
  create view "postgres"."public_intermediate"."int_funnel_events__dbt_tmp"
    
    
  as (
    

-- Combine stage and activity events, deduplicate, and order in one step

with stage_events as (
    select
        dc.deal_id,
        dc.change_time as event_time,
        m.step_id,
        m.step_name,
        m.step_order,
        m.source_type
    from "postgres"."public_staging"."stg_deal_changes" dc
    join "postgres"."public_intermediate"."int_funnel_step_mapping" m
      on m.source_type = 'stage'
     and dc.new_value::numeric = m.step_id
    where dc.changed_field_key = 'stage_id'
),

activity_events as (
    select
        a.deal_id,
        a.due_date as event_time,
        m.step_id,
        m.step_name,
        m.step_order,
        m.source_type
    from "postgres"."public_staging"."stg_activity" a
    join "postgres"."public_staging"."stg_activity_type" at
      on a.activity_type = at.type_key
    join "postgres"."public_intermediate"."int_funnel_step_mapping" m
      on at.activity_type_id = m.step_id
     and m.source_type = 'activity'
    where a.is_done = true
),

-- Combine both event sources
unioned as (
    select * from stage_events
    union all
    select * from activity_events
),

-- Keep only valid deals that exist in stg_deal_changes
valid_deals as (
    select distinct deal_id
    from "postgres"."public_staging"."stg_deal_changes"
),

filtered_funnel as (
    select f.*
    from unioned f
    join valid_deals vd on f.deal_id = vd.deal_id
),

-- Add ordering and time-in-stage calculations
ordered as (
    select
        f.deal_id,
        f.step_id,
        f.step_name,
        f.step_order,
        f.source_type,
        f.event_time as stage_entered_time,
        case
            when f.source_type = 'stage' then
                date_part(
                    'day',
                    coalesce(
                        lead(f.event_time) over (partition by f.deal_id order by f.event_time),
                        now()
                    ) - f.event_time
                )
            else 0
        end as days_in_stage,
        date_trunc('month', f.event_time) as month
    from filtered_funnel f
)

select *
from ordered
order by deal_id, step_order, stage_entered_time
  );
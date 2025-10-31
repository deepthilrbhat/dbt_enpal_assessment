
  create view "postgres"."public_intermediate"."int_deal_attributes__dbt_tmp"
    
    
  as (
    

-- Combine deal creation, owner, and lost reason in one place

with deal_creation as (
    select
        deal_id,
        max(new_value::timestamp) as deal_creation_time
    from "postgres"."public_staging"."stg_deal_changes"
    where changed_field_key = 'add_time'
    group by deal_id
),

owner_changes as (
    select distinct on (deal_id)
        deal_id,
        change_time as deal_owner_change_time,
        lag(new_value::int) over (partition by deal_id order by change_time) as deal_previous_owner_id,
        new_value::int as deal_current_owner_id
    from "postgres"."public_staging"."stg_deal_changes"
    where changed_field_key = 'user_id'
    order by deal_id, change_time desc
),

lost_reason as (
    select
        dc.deal_id,
        case when lr.lost_reason_id is not null then 'Yes' else 'No' end as is_deal_lost,
        lr.lost_reason_label as lost_reason,
        dc.change_time,
        row_number() over (partition by dc.deal_id order by dc.change_time desc) as rn
    from "postgres"."public_staging"."stg_deal_changes" dc
    left join "postgres"."public_intermediate"."int_lost_reason_mapping" lr
      on dc.new_value::numeric = lr.lost_reason_id
    where dc.changed_field_key = 'lost_reason'
),
latest_lost as (
    select deal_id, is_deal_lost, lost_reason
    from lost_reason
    where rn = 1
)

select
    c.deal_id,
    c.deal_creation_time,
    o.deal_owner_change_time,
    o.deal_current_owner_id,
    o.deal_previous_owner_id,
    l.is_deal_lost,
    l.lost_reason
from deal_creation c
left join owner_changes o on c.deal_id = o.deal_id
left join latest_lost l on c.deal_id = l.deal_id
  );
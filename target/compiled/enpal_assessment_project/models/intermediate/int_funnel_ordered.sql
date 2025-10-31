

with ordered as (
    select
        f.deal_id,
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
        extract(month from f.event_time) as month
    from "postgres"."public_intermediate"."int_funnel_events" f
)
select * from ordered






with validation_errors as (

    select
        deal_id, event_time, step_id
    from "postgres"."public_intermediate"."int_funnel_events"
    group by deal_id, event_time, step_id
    having count(*) > 1

)

select *
from validation_errors



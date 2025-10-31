





with validation_errors as (

    select
        deal_id, step_order, stage_entered_time
    from "postgres"."public_intermediate"."int_funnel_events"
    group by deal_id, step_order, stage_entered_time
    having count(*) > 1

)

select *
from validation_errors









with validation_errors as (

    select
        step_id, source_type
    from "postgres"."public_intermediate"."int_funnel_step_mapping"
    group by step_id, source_type
    having count(*) > 1

)

select *
from validation_errors



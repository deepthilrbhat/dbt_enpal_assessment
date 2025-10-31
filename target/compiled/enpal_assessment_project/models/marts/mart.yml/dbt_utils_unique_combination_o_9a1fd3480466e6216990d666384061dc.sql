





with validation_errors as (

    select
        deal_id, stage_id, stage_entered_time
    from "postgres"."public_mart"."fct_deals_funnel_curated"
    group by deal_id, stage_id, stage_entered_time
    having count(*) > 1

)

select *
from validation_errors



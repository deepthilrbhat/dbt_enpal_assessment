
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  





with validation_errors as (

    select
        deal_id, step_order, stage_entered_time
    from "postgres"."public_intermediate"."int_funnel_ordered"
    group by deal_id, step_order, stage_entered_time
    having count(*) > 1

)

select *
from validation_errors



  
  
      
    ) dbt_internal_test
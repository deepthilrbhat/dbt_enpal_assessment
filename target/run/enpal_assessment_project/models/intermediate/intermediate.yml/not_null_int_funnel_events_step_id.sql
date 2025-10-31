
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select step_id
from "postgres"."public_intermediate"."int_funnel_events"
where step_id is null



  
  
      
    ) dbt_internal_test
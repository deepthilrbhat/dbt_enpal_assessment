
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select step_name
from "postgres"."public_intermediate"."int_funnel_events"
where step_name is null



  
  
      
    ) dbt_internal_test
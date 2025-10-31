
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select stage_entered_time
from "postgres"."public_mart"."fct_deals_curated"
where stage_entered_time is null



  
  
      
    ) dbt_internal_test
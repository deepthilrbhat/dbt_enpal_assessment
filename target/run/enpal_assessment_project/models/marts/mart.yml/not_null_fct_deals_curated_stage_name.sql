
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select stage_name
from "postgres"."public_mart"."fct_deals_curated"
where stage_name is null



  
  
      
    ) dbt_internal_test
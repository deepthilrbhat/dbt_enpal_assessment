
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select deal_creation_time
from "postgres"."public_intermediate"."int_deal_attributes"
where deal_creation_time is null



  
  
      
    ) dbt_internal_test
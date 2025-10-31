
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select funnel_step
from "postgres"."public_mart"."rpt_deals_funnel_monthly"
where funnel_step is null



  
  
      
    ) dbt_internal_test
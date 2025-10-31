
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        is_deal_lost as value_field,
        count(*) as n_records

    from "postgres"."public_mart"."fct_deals_curated"
    group by is_deal_lost

)

select *
from all_values
where value_field not in (
    'True','False'
)



  
  
      
    ) dbt_internal_test
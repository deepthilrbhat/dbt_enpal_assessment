
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        source_type as value_field,
        count(*) as n_records

    from "postgres"."public_intermediate"."int_funnel_ordered"
    group by source_type

)

select *
from all_values
where value_field not in (
    'stage','activity'
)



  
  
      
    ) dbt_internal_test
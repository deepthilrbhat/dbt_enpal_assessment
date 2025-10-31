
    
    

with all_values as (

    select
        is_deal_lost as value_field,
        count(*) as n_records

    from "postgres"."public_intermediate"."int_deal_attributes"
    group by is_deal_lost

)

select *
from all_values
where value_field not in (
    'Yes','No'
)



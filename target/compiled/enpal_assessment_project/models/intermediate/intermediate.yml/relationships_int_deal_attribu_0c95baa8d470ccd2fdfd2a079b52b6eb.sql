
    
    

with child as (
    select lost_reason as from_field
    from (select * from "postgres"."public_intermediate"."int_deal_attributes" where lost_reason is not null) dbt_subquery
    where lost_reason is not null
),

parent as (
    select lost_reason_label as to_field
    from "postgres"."public_intermediate"."int_lost_reason_mapping"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



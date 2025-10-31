
    
    

with child as (
    select step_id as from_field
    from "postgres"."public_intermediate"."int_funnel_events"
    where step_id is not null
),

parent as (
    select step_id as to_field
    from "postgres"."public_intermediate"."int_funnel_step_mapping"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



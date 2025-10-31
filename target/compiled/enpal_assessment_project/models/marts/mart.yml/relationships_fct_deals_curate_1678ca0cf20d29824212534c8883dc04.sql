
    
    

with child as (
    select deal_previous_owner_id as from_field
    from (select * from "postgres"."public_mart"."fct_deals_curated" where deal_previous_owner_id is not null) dbt_subquery
    where deal_previous_owner_id is not null
),

parent as (
    select user_id as to_field
    from "postgres"."public_staging"."stg_users"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null




  create view "postgres"."public_staging"."stg_deal_changes__dbt_tmp"
    
    
  as (
    with source as (
    select * from "postgres"."public"."deal_changes"
),

renamed as (
    select distinct
        deal_id,
        change_time::timestamp as change_time,
        changed_field_key,
        new_value
    from source
)

select * from renamed
  );
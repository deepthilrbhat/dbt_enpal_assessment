
  create view "postgres"."public_staging"."stg_activity_type__dbt_tmp"
    
    
  as (
    with source as (
    select * from "postgres"."public"."activity_types"
),

renamed as (
    select
        id as activity_type_id,
        name as activity_type_name,
        active::boolean as is_active,
        "type" as type_key
    from source
)

select * from renamed
  );
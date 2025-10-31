
  create view "postgres"."public_staging"."stg_users__dbt_tmp"
    
    
  as (
    with source as (
    select * from "postgres"."public"."users"
),

renamed as (
    select
        id as user_id,
        name as user_name,
        email as user_email,
        modified::timestamp as modified_at
    from source
)

select * from renamed
  );
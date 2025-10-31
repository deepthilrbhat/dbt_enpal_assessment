
  
    

  create  table "postgres"."public_mart"."dim_users__dbt_tmp"
  
  
    as
  
  (
    select distinct
    user_id,
    user_name,
    user_email,
    modified_at
from "postgres"."public_staging"."stg_users"
  );
  
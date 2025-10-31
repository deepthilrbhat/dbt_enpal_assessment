
  
    

  create  table "postgres"."public_mart"."dim_stages__dbt_tmp"
  
  
    as
  
  (
    select distinct
    stage_id,
    stage_name
from "postgres"."public_staging"."stg_stages"
  );
  
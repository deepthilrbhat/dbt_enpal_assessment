
  create view "postgres"."public_intermediate"."int_lost_reason_mapping__dbt_tmp"
    
    
  as (
    

select
    (jsonb_array_elements(field_value_options::jsonb)->>'id')::int as lost_reason_id,
    jsonb_array_elements(field_value_options::jsonb)->>'label' as lost_reason_label
from "postgres"."public_staging"."stg_fields"
where field_key = 'lost_reason'
  );
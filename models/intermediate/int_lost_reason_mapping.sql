{{ config(materialized='view') }}

select
    (jsonb_array_elements(field_value_options::jsonb)->>'id')::int as lost_reason_id,
    jsonb_array_elements(field_value_options::jsonb)->>'label' as lost_reason_label
from {{ ref('stg_fields') }}
where field_key = 'lost_reason'

{{ config(materialized='table', tags=['dimension']) }}

select * from {{ ref('int_lost_reason_mapping') }}

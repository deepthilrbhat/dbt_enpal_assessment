{{ config(materialized='table', tags=['dimension']) }}

select * from {{ ref('int_funnel_step_mapping') }}


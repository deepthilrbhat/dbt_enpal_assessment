{{ config(materialized='view') }}

with stage_steps as (
    select
        stage_id::numeric as step_id,
        stage_name as step_name,
        stage_id::numeric as step_order,
        'stage' as source_type,
         true as is_active
    from {{ ref('stg_stages') }}
),
activity_steps as (
    select
        activity_type_id::numeric as step_id,
        activity_type_name as step_name,
        case 
            when activity_type_id = 1 then '2.1'
            when activity_type_id = 2 then '3.1'
            when activity_type_id = 3 then '8.1'
            when activity_type_id = 4 then '6.1'
            else activity_type_id::numeric
        end as step_order,
        'activity' as source_type,
        is_active as is_active
    from {{ ref('stg_activity_type') }}
)
select * from stage_steps
union all
select * from activity_steps


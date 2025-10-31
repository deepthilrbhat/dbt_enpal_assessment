{{ config(
    materialized = 'incremental',
    unique_key = ['deal_id', 'stage_id', 'stage_entered_time'],
    incremental_strategy = 'merge',
    on_schema_change = 'sync_all_columns',
    tags = ['deals', 'mart']
) }}

--optional for huge data load
    -- cluster_by = ['stage_entered_time', 'deal_id'],  -- for Snowflake
    -- partition_by = {'field': 'stage_entered_time', 'data_type': 'timestamp', 'granularity': 'month'},  -- for BigQuery/Databricks
    

with base as (
    select
        f.deal_id,
        d.deal_creation_time,
        d.deal_current_owner_id,
        d.deal_previous_owner_id,
        d.deal_owner_change_time,
        f.step_order as stage_id,
        f.step_name as stage_name,
        f.stage_entered_time,
        f.days_in_stage,
        d.is_deal_lost,
        d.lost_reason
    from {{ ref('int_funnel_events') }} f
    left join {{ ref('int_deal_attributes') }} d on f.deal_id = d.deal_id

    {% if is_incremental() %}
      where f.stage_entered_time > (
          select coalesce(max(stage_entered_time), '1900-01-01')
          from {{ this }}
      )
    {% endif %}
)

select *
from base
order by deal_id, stage_id, stage_entered_time

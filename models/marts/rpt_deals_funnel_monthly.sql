{{ config(
    materialized = 'table',
    tags = ['deals', 'reporting']
) }}

with funnel_data as (
    select
        f.deal_id,
        f.stage_id as funnel_step,
        f.stage_name as kpi_name,
        f.stage_entered_time
    from {{ ref('fct_deals_funnel_curated') }} f
    where f.stage_id not in (6.1,8.1)
),

aggregated as (
    select
        to_char(date_trunc('month', stage_entered_time), 'Mon-YYYY') as month,
        kpi_name,
        funnel_step,
        count(distinct deal_id) as deals_count
    from funnel_data
    group by 1, 2, 3
)

select *
from aggregated
order by month, funnel_step
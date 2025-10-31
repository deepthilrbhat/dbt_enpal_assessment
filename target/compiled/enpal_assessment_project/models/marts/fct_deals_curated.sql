

select
    f.deal_id,
    d.deal_creation_time,
    d.deal_current_owner_id,
    cu.user_name as deal_current_owner_name,
    d.deal_previous_owner_id,
    pu.user_name as deal_previous_owner_name,
    d.deal_owner_change_time,
    f.step_order as stage_id,
    f.step_name as stage_name,
    f.stage_entered_time,
    f.days_in_stage,
    d.is_deal_lost,
    d.lost_reason
from "postgres"."public_intermediate"."int_funnel_ordered" f
left join "postgres"."public_intermediate"."int_deal_attributes" d on f.deal_id = d.deal_id
left join "postgres"."public_staging"."stg_users" cu on d.deal_current_owner_id = cu.user_id
left join "postgres"."public_staging"."stg_users" pu on d.deal_previous_owner_id = pu.user_id
order by f.deal_id, f.step_order, f.stage_entered_time
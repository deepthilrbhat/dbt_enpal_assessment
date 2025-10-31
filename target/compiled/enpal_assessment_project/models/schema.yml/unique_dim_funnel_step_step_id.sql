
    
    

select
    step_id as unique_field,
    count(*) as n_records

from "postgres"."public_mart"."dim_funnel_step"
where step_id is not null
group by step_id
having count(*) > 1



with source as (
    select * from "postgres"."public"."activity"
),

renamed as (
    SELECT DISTINCT ON (activity_id, deal_id, due_to, type, assigned_to_user, done)
        activity_id,
        type AS activity_type,
        assigned_to_user AS user_id,
        deal_id,
        done::boolean AS is_done,
        due_to::timestamp AS due_date
    from source
)

select * from renamed
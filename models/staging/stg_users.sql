with source as (
    select * from {{ source('public', 'users') }}
),

renamed as (
    select
        id as user_id,
        name as user_name,
        email as user_email,
        modified::timestamp as modified_at
    from source
)

select * from renamed

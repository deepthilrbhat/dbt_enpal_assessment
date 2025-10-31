with source as (
    select * from {{ source('public', 'stages') }}
),

renamed as (
    select
        stage_id,
        stage_name
    from source
)

select * from renamed

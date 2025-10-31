with source as (
    select * from {{ source('public', 'fields') }}
),

renamed as (
    select
        id as field_id,
        field_key,
        name as field_name,
        field_value_options
    from source
)

select * from renamed

select distinct
    user_id,
    user_name,
    user_email,
    modified_at
from {{ ref('stg_users') }}

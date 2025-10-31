select distinct
    stage_id,
    stage_name
from {{ ref('stg_stages') }}

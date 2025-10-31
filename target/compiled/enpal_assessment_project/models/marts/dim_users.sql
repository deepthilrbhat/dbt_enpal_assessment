select distinct
    user_id,
    user_name,
    user_email,
    modified_at
from "postgres"."public_staging"."stg_users"
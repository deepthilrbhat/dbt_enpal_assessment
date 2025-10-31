
      -- back compat for old kwarg name
  
  
        
            
                
                
            
                
                
            
                
                
            
        
    

    

    merge into "postgres"."public_mart"."fct_deals_funnel_curated" as DBT_INTERNAL_DEST
        using "fct_deals_funnel_curated__dbt_tmp114007177342" as DBT_INTERNAL_SOURCE
        on (
                    DBT_INTERNAL_SOURCE.deal_id = DBT_INTERNAL_DEST.deal_id
                ) and (
                    DBT_INTERNAL_SOURCE.stage_id = DBT_INTERNAL_DEST.stage_id
                ) and (
                    DBT_INTERNAL_SOURCE.stage_entered_time = DBT_INTERNAL_DEST.stage_entered_time
                )

    
    when matched then update set
        "deal_id" = DBT_INTERNAL_SOURCE."deal_id","deal_creation_time" = DBT_INTERNAL_SOURCE."deal_creation_time","deal_current_owner_id" = DBT_INTERNAL_SOURCE."deal_current_owner_id","deal_previous_owner_id" = DBT_INTERNAL_SOURCE."deal_previous_owner_id","deal_owner_change_time" = DBT_INTERNAL_SOURCE."deal_owner_change_time","stage_id" = DBT_INTERNAL_SOURCE."stage_id","stage_name" = DBT_INTERNAL_SOURCE."stage_name","stage_entered_time" = DBT_INTERNAL_SOURCE."stage_entered_time","days_in_stage" = DBT_INTERNAL_SOURCE."days_in_stage","is_deal_lost" = DBT_INTERNAL_SOURCE."is_deal_lost","lost_reason" = DBT_INTERNAL_SOURCE."lost_reason"
    

    when not matched then insert
        ("deal_id", "deal_creation_time", "deal_current_owner_id", "deal_previous_owner_id", "deal_owner_change_time", "stage_id", "stage_name", "stage_entered_time", "days_in_stage", "is_deal_lost", "lost_reason")
    values
        ("deal_id", "deal_creation_time", "deal_current_owner_id", "deal_previous_owner_id", "deal_owner_change_time", "stage_id", "stage_name", "stage_entered_time", "days_in_stage", "is_deal_lost", "lost_reason")


  
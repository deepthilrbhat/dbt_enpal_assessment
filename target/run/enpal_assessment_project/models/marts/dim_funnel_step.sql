
  
    

  create  table "postgres"."public_mart"."dim_funnel_step__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_intermediate"."int_funnel_step_mapping"
  );
  
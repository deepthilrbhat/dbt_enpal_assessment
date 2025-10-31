
  
    

  create  table "postgres"."public_mart"."dim_lost_reason__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_intermediate"."int_lost_reason_mapping"
  );
  

/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

SELECT DATE(collector_tstamp) as date,unstruct_event_com_curamando_purchase_1_0_0 FROM `curamando-snowplow.rt_pipeline_prod1.events` 
WHERE TIMESTAMP_TRUNC(collector_tstamp, DAY) between TIMESTAMP("2023-09-23") and TIMESTAMP("2023-11-23") and event_name = "purchase"
/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

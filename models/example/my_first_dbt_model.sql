
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with test_table as (
select *
from `curamando-snowplow.rt_pipeline_prod1.events`
where
    timestamp_trunc(collector_tstamp, day)
    between timestamp("2023s-09-21") and timestamp("2023-11-21")
limit 1000
)
select * from test_table

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

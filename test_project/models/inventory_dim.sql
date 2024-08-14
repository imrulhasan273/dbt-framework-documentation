
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
/*** 
    materialized='incremental',  -- 'view', 'table', 'incremental', 'ephemeral'
    unique_key='inventory_id',   -- Assuming 'inventory_id' is unique
    incremental_strategy='insert_overwrite', -- OptionS: merge, append, insert_overwrite
    partition_by={'field': 'last_update', 'data_type': 'timestamp'} -- Optional, for partitioned tables
***/

{{ config(
    materialized='incremental', 
    unique_key='inventory_id',
    partition_by={'field': 'last_update', 'data_type': 'timestamp'} 
) }}

with source_data as (
    SELECT inventory_id, film_id, store_id, max(last_update) as max_date 
    FROM public.inventory 
    group by 1,2,3
)
select *
from source_data



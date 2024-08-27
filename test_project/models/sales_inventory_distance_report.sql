/*** 
    materialized='incremental',  -- 'view', 'table', 'incremental', 'ephemeral'
    unique_key='inventory_id',   -- Assuming 'inventory_id' is unique
    incremental_strategy='insert_overwrite', -- OptionS: merge, append, insert_overwrite
    partition_by={'field': 'last_update', 'data_type': 'timestamp'} -- Optional, for partitioned tables
***/

{{ config(
    materialized='incremental',
    unique_key='"Customer Key"',
)}}

{% set current_time = "CURRENT_TIMESTAMP" %}

{% if is_incremental() %}
    -- INCREAMENTAL REFRESH
    with max_customer_key as (
        select max("Customer Key") as max_key
        from {{ this }}
    )
    select 
        sd."Customer Key", 
        sd.record_count, 
        sd.transformed_on
    from
    (
        select
            "Customer Key", 
            count(1) as record_count, 
            {{ current_time }} as transformed_on
        from stg.sales_inventory as sd
        group by "Customer Key"
    ) sd
    where sd."Customer Key" > (select max_key from max_customer_key)
{% else %}
    -- FULL REFRESH
    select 
        "Customer Key", 
        count(1) as record_count, 
        {{ current_time }} as transformed_on
    from stg.sales_inventory 
    group by "Customer Key"
{% endif %}




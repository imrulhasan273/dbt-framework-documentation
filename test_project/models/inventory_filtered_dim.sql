
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}

select *
from {{ ref('inventory_dim') }}
where 1=1



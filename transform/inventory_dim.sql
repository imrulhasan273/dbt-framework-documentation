-- models/transform/transformed_customers.sql
with base as (
    select *
    from {{ ref('inventory') }}  -- Refers to the staging model
)
SELECT film_id, store_id, last_update 
FROM public.inventory
where 1=1

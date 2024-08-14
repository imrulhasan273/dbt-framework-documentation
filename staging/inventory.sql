-- models/staging/customers.sql
select *
from {{ source('public', 'inventory') }}

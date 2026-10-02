{{
    config(
        materialized='table'
    )
}}

SELECT
    1 AS customer_id,
    'John' AS customer_name,
    'London' AS city

UNION ALL

SELECT
    2,
    'Mary',
    'Manchester'
union all
select 3,
'claire',
'London'
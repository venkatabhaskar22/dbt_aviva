{{
    config(
        materialized='table'
    )
}}

SELECT
    10001 AS customer_id,
    'John' AS customer_name,
    'London' AS city,
    'M' AS gender,
    'Married' AS marital_status

UNION ALL

SELECT
   20001,
   'Mary',
    'Manchester',
    'F',
   'Single'

UNION ALL

SELECT
   30001,
   'Claire',
   'London',
  'F',
    'Single'

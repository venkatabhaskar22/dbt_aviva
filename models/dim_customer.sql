{{
    config(
        materialized='table'
    )
}}

SELECT
    customer_id,
    customer_name,
    city,
    gender,
    marital_status,
    email,
    salary_employee,
    stg_timestamp,
    load_timestamp
FROM {{ ref('stg_customer') }}
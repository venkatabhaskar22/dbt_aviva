{{
    config(
        materialized='incremental'
    )
}}

SELECT
    customer_id,
    upper(customer_name) as customer_name,
    initcap(city) as city,
    case
        when gender = 'M' then 'Male'
        when gender = 'F' then 'Female'
        else 'Unknown'
    end as gender,
    marital_status,
    lower(email) as email,
    CAST(annual_income as numeric(15,2)) as salary_employee,
    CAST(processed_dttm AS TIMESTAMP_NTZ(0)) as stg_timestamp,
    CAST(current_timestamp() AS TIMESTAMP_LTZ(0)) as load_timestamp
FROM {{ source('stg','RAW_CUSTOMERS') }}
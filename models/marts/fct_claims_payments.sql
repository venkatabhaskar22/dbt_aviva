{{ config(
    materialized='table',
    database='INSURANCE_DB',
    schema='ANALYTICS'
) }}

WITH claims AS (

    SELECT *
    FROM {{ ref('stg_claims') }}

),

payments AS (

    SELECT
        CLAIM_ID,
        SUM(
            CASE
                WHEN PAYMENT_STATUS = 'PAID'
                THEN PAYMENT_AMOUNT
                ELSE 0
            END
        ) AS TOTAL_PAID_AMOUNT
    FROM {{ ref('stg_payments') }}
    GROUP BY CLAIM_ID

)

SELECT
    C.CLAIM_ID,
    C.POLICY_ID,
    C.CLAIM_STATUS,
    C.CLAIM_AMOUNT,
    COALESCE(P.TOTAL_PAID_AMOUNT, 0) AS TOTAL_PAID_AMOUNT,

    GREATEST(
        C.CLAIM_AMOUNT - COALESCE(P.TOTAL_PAID_AMOUNT, 0),
        0
    ) AS OUTSTANDING_AMOUNT,

    C.UPDATED_AT

FROM claims C
LEFT JOIN payments P
    ON C.CLAIM_ID = P.CLAIM_ID
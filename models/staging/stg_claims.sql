SELECT
    CLAIM_ID,
    POLICY_ID,
    UPPER(TRIM(CLAIM_STATUS)) AS CLAIM_STATUS,
    CLAIM_AMOUNT,
    UPDATED_AT
FROM {{ source('insurance_curated', 'curated_claims') }}
WHERE CLAIM_ID IS NOT NULL
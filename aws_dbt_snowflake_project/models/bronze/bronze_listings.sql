
--{% set incremental_flag = 1 %}
--{% set incremental_col = 'CREATED_AT' %}

{{ config(materialized='incremental') }}

SELECT * FROM {{ source('staging', 'listings') }}

{% if is_incremental() %}
WHERE LISTING_ID >  (
    SELECT COALESCE(MAX(LISTING_ID), '1900-01-01')
    FROM {{ this }}
)
{% endif %}

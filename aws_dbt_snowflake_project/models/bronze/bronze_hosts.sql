
--{% set incremental_flag = 1 %}
--{% set incremental_col = 'CREATED_AT' %}
--instead of two lines above we will use a below single line
{{ config(materialized='incremental') }}

SELECT * FROM {{ source('staging', 'hosts') }}

{% if is_incremental() %}
WHERE HOST_ID > (
    SELECT COALESCE(MAX(HOST_ID), '1900-01-01')
    FROM {{ this }}
)
{% endif %}

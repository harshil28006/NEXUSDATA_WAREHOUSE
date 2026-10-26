{{ 
    config(
        materialized = 'ephemeral' ,
    )
 }}

WITH listings AS
(
    SELECT DISTINCT
        LISTING_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    FROM 
        {{ ref('obt') }}
    WHERE 
        LISTING_ID IS NOT NULL
)
SELECT * FROM listings






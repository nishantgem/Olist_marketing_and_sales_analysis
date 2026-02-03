{{ config(materialized='view') }}

with source as (
    select * 
    from {{ source('olist', 'olist_closed_deals_dataset') }}
),

renamed as (
    select
        mql_id,
        seller_id,
        sdr_id,
        sr_id,
        won_date,
        business_segment,
        lead_type,
        lead_behaviour_profile,
        has_company,
        has_gtin,
        average_stock,
        business_type
    from source
)

select * from renamed

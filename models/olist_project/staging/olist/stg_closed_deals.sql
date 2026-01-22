with source as (
    select *
    from {{ source('olist', 'closed_deals') }}
),

renamed as (
    select
        mql_id,
        seller_id,
        sdr_id,
        sr_id,
        cast(won_date as timestamp) as won_ts,
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
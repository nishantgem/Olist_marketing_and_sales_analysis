with closed_deals as (
    select *
    from {{ ref('int_closed_deals') }}
),

final as (
    select
        mql_id,
        seller_id,
        sdr_id,
        sr_id,

        won_ts,
        business_segment,
        lead_type,
        lead_behaviour_profile,
        has_company,
        has_gtin,
        average_stock,
        business_type,

        -- enriched MQL attributes
        first_contact_ts,
        landing_page_id,
        origin,

        -- enriched seller attributes
        seller_city,
        seller_state
    from closed_deals
)

select * from final

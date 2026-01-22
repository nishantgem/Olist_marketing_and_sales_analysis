with closed_deals as (
    select *
    from {{ ref('stg_closed_deals') }}
),

mql as (
    select *
    from {{ ref('int_mql') }}
),

sellers as (
    select *
    from {{ ref('int_sellers') }}
),

joined as (
    select
        cd.mql_id,
        cd.seller_id,
        cd.sdr_id,
        cd.sr_id,

        cd.won_ts,
        cd.business_segment,
        cd.lead_type,
        cd.lead_behaviour_profile,
        cd.has_company,
        cd.has_gtin,
        cd.average_stock,
        cd.business_type,

        -- enrich with MQL attributes
        mql.first_contact_ts,
        mql.landing_page_id,
        mql.origin,

        -- enrich with seller attributes
        sellers.seller_city,
        sellers.seller_state
    from closed_deals cd
    left join mql using (mql_id)
    left join sellers using (seller_id)
)

select * from joined

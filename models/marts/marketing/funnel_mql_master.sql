{{ config(materialized='table') }}

with mql as (
    select *
    from {{ ref('stg_mql') }}
),

closed_deals as (
    select *
    from {{ ref('stg_closed_deals') }}
),

sellers as (
    select *
    from {{ ref('stg_sellers') }}
),

joined as (
    select
        -- MQL fields
        m.mql_id,
        m.first_contact_date,
        m.landing_page_id,
        m.origin,
        m.lead_behaviour_profile,
        m.lead_score,

        -- Closed deals fields
        cd.seller_id,
        cd.sdr_id,
        cd.sr_id,
        cd.won_date,
        cd.business_segment,
        cd.lead_type,                  -- ✔ correct source
        cd.has_company,
        cd.has_gtin,
        cd.average_stock,
        cd.business_type,

        -- Seller enrichment
        s.seller_city,
        s.seller_state,

        -- Funnel stage logic
        case 
            when cd.won_date is not null then 'Closed Deal'
            else 'MQL'
        end as funnel_stage

    from mql m
    left join closed_deals cd
        on m.mql_id = cd.mql_id
    left join sellers s
        on cd.seller_id = s.seller_id
)

select * from joined

with mql as (
    select *
    from {{ ref('fact_mqls') }}
),

closed_deals as (
    select *
    from {{ ref('fact_closed_deals') }}
),

orders as (
    select *
    from {{ ref('fact_orders') }}
),

order_items as (
    select *
    from {{ ref('fact_order_items') }}
),

-- 1. MQL → Closed Deal
mql_to_deal as (
    select
        mql.mql_id,
        mql.first_contact_ts,
        mql.landing_page_id,
        mql.origin,

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
        cd.seller_city,
        cd.seller_state
    from mql
    left join closed_deals cd using (mql_id)
),

-- 2. Closed Deal → Orders (via seller_id)
deal_to_orders as (
    select
        m.*,
        o.order_id,
        o.customer_id,
        o.customer_unique_id,
        o.customer_city,
        o.customer_state,
        o.order_status,
        o.order_purchase_ts,
        o.order_approved_ts,
        o.order_carrier_delivered_ts,
        o.order_customer_delivered_ts,
        o.order_estimated_delivery_ts,
        o.delivery_days
    from mql_to_deal m
    left join orders o
        on m.seller_id = o.seller_id
),

-- 3. Orders → Order Items
final as (
    select
        d.*,
        oi.order_item_id,
        oi.product_id,
        oi.price,
        oi.freight_value
    from deal_to_orders d
    left join order_items oi using (order_id)
)

select * from final
with order_items as (
    select *
    from {{ ref('stg_order_items') }}
),

products as (
    select *
    from {{ ref('stg_products') }}
),

sellers as (
    select *
    from {{ ref('stg_sellers') }}
),

joined as (
    select
        oi.order_id,
        oi.order_item_id,
        oi.product_id,
        oi.seller_id,

        -- product attributes
        p.product_category_name,
        p.product_name_length,
        p.product_description_length,
        p.product_photos_qty,

        -- seller attributes
        s.seller_city,
        s.seller_state,

        -- order item attributes
        oi.shipping_limit_ts,
        oi.price,
        oi.freight_value
    from order_items oi
    left join products p using (product_id)
    left join sellers s using (seller_id)
)

select * from joined

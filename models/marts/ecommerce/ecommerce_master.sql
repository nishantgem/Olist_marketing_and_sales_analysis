{{ config(materialized='table') }}

with orders as (
    select *
    from {{ ref('stg_orders') }}
),

order_items as (
    select *
    from {{ ref('stg_order_items') }}
),

payments as (
    select *
    from {{ ref('stg_order_payments') }}
),

customers as (
    select *
    from {{ ref('stg_customers') }}
),

products as (
    select *
    from {{ ref('stg_products') }}
),

sellers as (
    select *
    from {{ ref('stg_sellers') }}
),

reviews as (
    select *
    from {{ ref('stg_order_reviews') }}
),

joined as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_timestamp,
        o.order_approved_at,
        o.order_delivered_carrier_date,
        o.order_delivered_customer_date,
        o.order_estimated_delivery_date,

        oi.order_item_id,
        oi.product_id,
        oi.seller_id,
        oi.shipping_limit_date,
        oi.price,
        oi.freight_value,

        p.payment_type,
        p.payment_installments,
        p.payment_value,

        c.customer_unique_id,
        c.customer_zip_code_prefix,
        c.customer_city,
        c.customer_state,

        pr.product_category_name,
        pr.product_weight_g,
        pr.product_length_cm,
        pr.product_height_cm,
        pr.product_width_cm,

        s.seller_zip_code_prefix,
        s.seller_city,
        s.seller_state,

        r.review_score,
        r.review_creation_date,
        r.review_answer_timestamp

    from orders o
    left join order_items oi
        on o.order_id = oi.order_id
    left join payments p
        on o.order_id = p.order_id
    left join customers c
        on o.customer_id = c.customer_id
    left join products pr
        on oi.product_id = pr.product_id
    left join sellers s
        on oi.seller_id = s.seller_id
    left join reviews r
        on o.order_id = r.order_id
)

select * from joined

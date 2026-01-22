with orders as (
    select *
    from {{ ref('int_orders') }}
),

final as (
    select
        order_id,
        customer_id,
        customer_unique_id,
        customer_city,
        customer_state,

        order_status,
        order_purchase_ts,
        order_approved_ts,

        -- correct names from staging → intermediate
        order_carrier_delivered_ts,
        order_customer_delivered_ts,
        order_estimated_delivery_ts,

        delivery_days
    from orders
)

select * from final

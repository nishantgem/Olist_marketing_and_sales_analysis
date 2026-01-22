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
        order_delivered_carrier_ts,
        order_delivered_customer_ts,
        order_estimated_delivery_ts,

        delivery_days
    from orders
)

select * from final

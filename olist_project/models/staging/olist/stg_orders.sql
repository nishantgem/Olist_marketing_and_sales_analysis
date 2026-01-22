{{ config(materialized='view') }}

with source as (
    select * from {{ source('olist', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        order_status,
        cast(order_purchase_timestamp as timestamp) as order_purchase_ts,
        cast(order_approved_at as timestamp) as order_approved_ts,
        cast(order_delivered_carrier_date as timestamp) as order_carrier_delivered_ts,
        cast(order_delivered_customer_date as timestamp) as order_customer_delivered_ts,
        cast(order_estimated_delivery_date as timestamp) as order_estimated_delivery_ts
    from source
)

select
    order_id,
    customer_id,
    order_status,
    order_purchase_ts,
    order_approved_ts,
    order_carrier_delivered_ts,
    order_customer_delivered_ts,
    order_estimated_delivery_ts
from renamed

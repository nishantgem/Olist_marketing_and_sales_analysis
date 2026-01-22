{{ config(materialized='view') }}

with source as (
    select * 
    from {{ source('olist', 'order_items') }}
),

renamed as (
    select
        order_id,
        order_item_id,
        product_id,
        seller_id,
        cast(shipping_limit_date as timestamp) as shipping_limit_ts,
        cast(price as float) as price,
        cast(freight_value as float) as freight_value
    from source
)

select
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_ts,
    price,
    freight_value
from renamed

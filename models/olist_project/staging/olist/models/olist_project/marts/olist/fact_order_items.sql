with order_items as (
    select *
    from {{ ref('int_order_items') }}
),

final as (
    select
        order_id,
        order_item_id,
        product_id,
        seller_id,

        -- product attributes
        product_category_name,
        product_name_length,
        product_description_length,
        product_photos_qty,

        -- seller attributes
        seller_city,
        seller_state,

        -- order item attributes
        shipping_limit_ts,
        price,
        freight_value
    from order_items
)

select * from final

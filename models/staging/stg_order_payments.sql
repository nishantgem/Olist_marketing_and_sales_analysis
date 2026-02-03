{{ config(materialized='view') }}

with source as (
    select * 
    from {{ source('olist', 'olist_order_payments_dataset') }}
),

renamed as (
    select
        order_id,
        payment_sequential,
        payment_type,
        cast(payment_installments as integer) as payment_installments,
        cast(payment_value as numeric) as payment_value
    from source
)

select * from renamed

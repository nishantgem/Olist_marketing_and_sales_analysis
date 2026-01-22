with source as (
    select *
    from {{ source('olist', 'mql') }}
),

renamed as (
    select
        mql_id,
        cast(first_contact_date as timestamp) as first_contact_ts,
        landing_page_id,
        origin
    from source
)

select * from renamed
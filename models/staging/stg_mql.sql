{{ config(materialized='view') }}

with source as (
    select * 
    from {{ source('olist', 'olist_marketing_qualified_leads_dataset') }}
),

renamed as (
    select
        mql_id,
        first_contact_date,
        landing_page_id,
        origin,
        cast(first_contact_date as timestamp) as first_contact_date
    from source
)

select * from renamed

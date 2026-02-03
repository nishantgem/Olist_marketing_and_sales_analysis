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
        cast(created_at as timestamp) as created_at
    from source
)

select * from renamed

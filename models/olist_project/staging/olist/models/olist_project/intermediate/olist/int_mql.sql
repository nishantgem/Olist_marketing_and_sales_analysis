with mql as (
    select *
    from {{ ref('stg_mql') }}
),

cleaned as (
    select
        mql_id,
        first_contact_ts,
        landing_page_id,
        origin
    from mql
)

select * from cleaned

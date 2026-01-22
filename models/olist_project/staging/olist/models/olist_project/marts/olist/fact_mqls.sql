with mql as (
    select *
    from {{ ref('int_mql') }}
),

final as (
    select
        mql_id,
        first_contact_ts,
        landing_page_id,
        origin
    from mql
)

select * from final

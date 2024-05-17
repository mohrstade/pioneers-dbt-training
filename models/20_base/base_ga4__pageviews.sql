with
    events as (
        select 
            *
        from {{ ref("stg_ga4__events") }}
    ),

    views as (
        select
            {{ unnest_key("event_params", "page_location") }},
            count(*) as views
        from events
        where event_name = "page_view"
        group by page_location
    )

select * from views
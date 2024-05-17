with source as (
      select * from {{ source('src_ga4', 'events') }}
),
renamed as (
    select
        {{ adapter.quote("event_date") }},
        {{ adapter.quote("event_timestamp") }},
        {{ adapter.quote("event_name") }},
        {{ adapter.quote("event_params") }},
        {{ adapter.quote("event_previous_timestamp") }},
        {{ adapter.quote("event_value_in_usd") }},
        {{ adapter.quote("event_bundle_sequence_id") }},
        {{ adapter.quote("event_server_timestamp_offset") }},
        {{ adapter.quote("user_id") }},
        {{ adapter.quote("user_pseudo_id") }},
        {{ adapter.quote("privacy_info") }},
        {{ adapter.quote("user_properties") }},
        {{ adapter.quote("user_first_touch_timestamp") }},
        {{ adapter.quote("user_ltv") }},
        {{ adapter.quote("device") }},
        {{ adapter.quote("geo") }},
        {{ adapter.quote("app_info") }},
        {{ adapter.quote("traffic_source") }},
        {{ adapter.quote("stream_id") }},
        {{ adapter.quote("platform") }},
        {{ adapter.quote("event_dimensions") }},
        {{ adapter.quote("ecommerce") }},
        {{ adapter.quote("items") }},
        {{ adapter.quote("collected_traffic_source") }},
        {{ adapter.quote("is_active_user") }}

    from source
)

select * from renamed
  
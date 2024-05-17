{% macro unnest_key(column_to_unnest, key_to_extract, value_type="string_value", rename="default") %}
    (select value.{{ value_type }} from unnest({{ column_to_unnest }}) where key = "{{ key_to_extract }}") as {% if rename == "default" %} {{ key_to_extract }}
    {% else %} {{ rename }}
    {% endif %}
{% endmacro %}
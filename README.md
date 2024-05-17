# dbt Setup
# Voraussetzungen:
- Python: https://code.visualstudio.com/docs/python/python-tutorial
- Cloud-SDK: https://cloud.google.com/sdk/docs/install-sdk

# DBT Projekt Ausetzen

## git initialisieren

```bash
git init
git add .
git commit -m "first commit"
```

```bash
python virtual environment initialisieren
python -m venv .dbt-env
source ./.dbt-env/bin/activate
```
## Python requirements instalieren


requirements.txt:

```txt
dbt-core==1.8.*
dbt-bigquery==1.8.*
```

```bash
pip install -r requirements.txt
```

## DBT. Initalisieren

```bash
dbt init project_name
```


## profiles.yml

Im Ordner: `~/.dbt/profiles.yml` oder im Projekt Ordner.

```yml
project_name:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: oauth
      project: project-id
      dataset: dbt_dev
      threads: 6
      job_execution_timeout_setting: 300
      priority: interactive
      retries: 1
      location: EU
````

## DBT Requirements instalieren

packages.yml
```packages:
  - package: dbt-labs/codegen
    version: 0.12.1
```

## sources.yml generieren
```bash
dbt --quiet run-operation generate_source --args '{"schema_name":"analytics_262450666",
    "table_names": ["events_20240516", "events_intraday_20240517"],
    "generate_columns":true,
    "include_descriptions":true,
    "name":"src_ga4_events",
    "include_database":true,
    "include_schema":true}' > models/00_sources/sources.yml
```

## unnest_key macro

```jinja
{% macro unnest_key(column_to_unnest, key_to_extract, value_type="string_value", rename="default") %}
    (select value.{{value_type}} from unnest({{column_to_unnest}}) where key = "{{key_to_extract}}") as {% if rename == "default" %} {{key_to_extract}}
    {% else %} {{rename}}
    {% endif %}
{% endmacro %}
```

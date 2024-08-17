# dbt Framework Documentation

--- 

## Set Up Environment

```cmd
pip install virtualenvwrapper-win  
virtualenv dbt_env			
cd dbt_env/scripts			
activate				
cd..				
cd..	
```

---

### Installation

---

**Step 1: Install dbt**

```cmd
pip install dbt-core
```

**Step 2: Initialize dbt project**

```cmd
dbt init test_project
```

---


**Step 3: Install Adapters**

```cmd
pip install dbt-postgres
pip install dbt-snowflake
dbt --version
```

**Step 4: Configure `profile.yml`**

- Adding `Adapter` for **PostgreSQL**

```yml
test_project:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: postgres
      password: IMRUL
      port: 5432
      dbname: datacloud
      schema: stg  # Source schema (default)
      search_path: stg, dwh  # Search path to include both source and target schemas
      threads: 4  # Number of parallel threads

```

> Note: file is located in `C:\Users\imrul.hasan\.dbt` folder (`~/.dbt/`)

**Step 5: Create new file in `macros`**

- Adding macros to modify existing schema naming behavior [`generate_schema_name.sql`]

```sql
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}
```

---

**Step 6: Debug**

```cmd
dbt debug
```

> make sure to `cd` to the Project Folder

**Step 7: Run DBT Project**

```cmd
dbt run
dbt run --threads 4
```

---

## **Core Concepts**

### Models

---

### Sources

---

### Seeds

---

### Snapshots

---

### Tests

---

### Jinja Macros

---

### Packages

---

## **Advanced Topics**

### Materializations

---

### Deployment and Scheduling

---

### DBT Cloud

---

### Optimizing DBT Models

---

## **Best Practices**

### Project Organization

---

### Version Control

---

### Testing and Debugging

---








































































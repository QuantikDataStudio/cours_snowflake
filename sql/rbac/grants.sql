USE ROLE dev_sec_ops_role;

USE DATABASE <% snowflake_db_name %>;

CREATE OR ALTER SCHEMA <% app_name %>_<% schema_name %>;>

-- Create DevOps role
CREATE ROLE IF NOT EXISTS <% env %>_<% app_name %>_DEVOPS_ROLE;>
GRANT CREATE INTEGRATION ON ACCOUNT TO ROLE <% env %>_<% app_name %>_DEVOPS_ROLE;>
GRANT ROLE <% env %>_<% app_name %>_DEVOPS_ROLE TO USER DEV_SEC_OPS_USER;>
GRANT USAGE ON DATABASE <% snowflake_db_name %> TO ROLE <% env %>_<% app_name %>_DEVOPS_ROLE;>
GRANT USAGE ON WAREHOUSE <% etl_warehouse %> TO ROLE <% env %>_<% app_name %>_DEVOPS_ROLE;>

GRANT ALL ON SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_DEVOPS_ROLE;>
GRANT USAGE ON INTEGRATION <% env %>_storage_integration TO ROLE <% env %>_<% app_name %>_DEVOPS_ROLE;>


-- Create read and write roles
CREATE ROLE IF NOT EXISTS <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON FUTURE TABLES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON ALL TABLES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON FUTURE DYNAMIC TABLES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON ALL DYNAMIC TABLES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON FUTURE VIEWS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON ALL VIEWS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON FUTURE STREAMS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT SELECT ON ALL STREAMS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON WAREHOUSE <% etl_warehouse %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON DATABASE <% snowflake_db_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON FUTURE STAGES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON ALL STAGES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT READ ON FUTURE STAGES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT READ ON ALL STAGES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON INTEGRATION <% env %>_storage_integration TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON INTEGRATION <% env %>_notification_integration TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
-- For sandbox account, this is important. For other accounts, it will be a repeat of the SQL query
GRANT USAGE ON INTEGRATION <% notification_integration %> TO ROLE <% env %>_<% app_name %>_READ_ROLE;>
GRANT USAGE ON INTEGRATION <% env %>_email_integration TO ROLE <% env %>_<% app_name %>_READ_ROLE;>

CREATE ROLE IF NOT EXISTS <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT INSERT,
      UPDATE,
      TRUNCATE,
      DELETE ON FUTURE TABLES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT INSERT,
      UPDATE,
      DELETE ON FUTURE VIEWS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT OPERATE ON FUTURE TASKS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON FUTURE FILE FORMATS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON FUTURE STAGES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>

GRANT INSERT,
      UPDATE,
      TRUNCATE,
      DELETE ON ALL TABLES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT INSERT,
      UPDATE,
      DELETE ON ALL VIEWS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT OPERATE ON ALL TASKS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON ALL FUNCTIONS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON ALL PROCEDURES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON ALL FILE FORMATS IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT USAGE ON ALL STAGES IN SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT CREATE PIPE ON SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT CREATE TASK ON SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>
GRANT CREATE TABLE ON SCHEMA <% app_name %>_<% schema_name %> TO ROLE <% env %>_<% app_name %>_WRITE_ROLE;>

-- Create Application role
CREATE ROLE IF NOT EXISTS <% env %>_<% app_name %>_APP_ROLE;>
GRANT ROLE <% env %>_<% app_name %>_READ_ROLE TO ROLE <% env %>_<% app_name %>_APP_ROLE;>
GRANT ROLE <% env %>_<% app_name %>_READ_ROLE TO ROLE <% env %>_SHARE_ROLE;>
GRANT ROLE <% env %>_<% app_name %>_WRITE_ROLE TO ROLE <% env %>_<% app_name %>_APP_ROLE;>
GRANT ROLE <% env %>_<% app_name %>_APP_ROLE TO USER DEV_SEC_OPS_USER;>
GRANT EXECUTE TASK ON ACCOUNT TO ROLE <% env %>_<% app_name %>_APP_ROLE;>

GRANT ROLE <% env %>_<% app_name %>_READ_ROLE TO ROLE <% env %>_ENGINEER_ROLE;>
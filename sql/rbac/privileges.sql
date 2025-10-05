use role accountadmin;

CREATE ROLE IF NOT EXISTS dev_sec_ops_role;
GRANT ROLE dev_sec_ops_role to user coursdbt;

grant create database on account to role dev_sec_ops_role ;
grant create role on account to role dev_sec_ops_role;
grant manage grants on account to role dev_sec_ops_role;
grant create warehouse on account to role dev_sec_ops_role;

GRANT EXECUTE TASK ON ACCOUNT TO ROLE dev_sec_ops_role WITH GRANT OPTION;

use role dev_sec_ops_role;
create or alter database health_app_2;

use database health_app_2;
create or alter schema raw;
create or alter schema staging;

create or alter role dev_ops_role;
create or alter role engineer_role;
create or alter role app_role;

-- DevOps role
grant ALL on schema raw to role dev_ops_role;
grant ALL on schema staging to role dev_ops_role;

-- Engineer role
GRANT SELECT ON FUTURE TABLES in schema raw to role engineer_role;
GRANT SELECT ON FUTURE TABLES in schema staging to role engineer_role;

-- App role
GRANT SELECT ON FUTURE TABLES in schema raw to role app_role;
GRANT SELECT ON FUTURE TABLES in schema staging to role app_role;

GRANT INSERT ON FUTURE TABLES in schema raw to role app_role;
GRANT INSERT ON FUTURE TABLES in schema staging to role app_role;

GRANT CREATE TASK ON SCHEMA raw TO ROLE app_role;
GRANT EXECUTE TASK ON ACCOUNT TO ROLE app_role;


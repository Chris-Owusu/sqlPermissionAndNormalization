SELECT rolname FROM pg_roles WHERE rolsuper = true;

SELECT  FROM pg_roles;

SELECT current_role;

CREATE ROLE abc_open_data WITH LOGIN NOSUPERUSER;

CREATE ROLE publishers WITH NOSUPERUSER ROLE abc_open_data;

GRANT USAGE ON SCHEMA analytics TO publishers;

GRANT SELECT ON ALL TABLES IN SCHEMA analytics TO publishers;

SELECT  FROM information_schema.table_privileges
WHERE grantee = 'publishers';

SET ROLE abc_open_data;

SELECT  FROM analytics.downloads limit 10;

SET ROLE ccuser;

SELECT current_role;

SELECT  FROM directory.datasets LIMIT 5;


GRANT USAGE ON SCHEMA directory TO publishers;


GRANT SELECT (id, create_date, hosting_path, publisher, src_size) 
ON directory.datasets to publishers;

SET ROLE abc_open_data;
SELECT current_role;

SELECT id, publisher, hosting_path, data_checksum 
FROM directory.datasets;

SET ROLE ccuser;
SELECT current_role;


-- CREATE POLICY emp_rls_policy  ON analytics.downloads 
-- FOR SELECT TO sales USING (salesperson=current_user);
 
-- ALTER TABLE publisher ENABLE ROW LEVEL SECURITY;


SELECT  FROM abc_open_data LIMIT 5;





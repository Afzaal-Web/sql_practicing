-- 1. web/desktop application
CREATE USER moon_app IDENTIFIED BY '1234';

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE 
ON sql_store.*
TO moon_app;

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE 
ON sql_store.*
TO moon_app@domain.com;

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE 
ON sql_store.customers
TO moon_app@domain.com;

-- 2. admin

GRANT CREATE VIEW 
ON sql_store.*
TO afzaal;

GRANT ALL
ON classicmodels.*
To afzaal;

GRANT CREATE VIEW 
ON sql_store.*
TO afzaal;

GRANT ALL
ON *.*
To afzaal;


-- view privilleges
SHOW GRANTS FOR afzaal;

-- Revoke privilleges

REVOKE ALL PRIVILEGES
ON *.*
TO afzaal;

FLUSH PRIVILEGES;

REVOKE CREATE VIEW 
ON sql_store.*
FROM moon_app;




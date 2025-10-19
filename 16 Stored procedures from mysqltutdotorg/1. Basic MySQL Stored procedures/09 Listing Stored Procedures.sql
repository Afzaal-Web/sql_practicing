-- Basic syntax
SHOW PROCEDURE STATUS [LIKE 'pattern' | WHERE search_condition];
/*  SHOW PROCEDURE STATUS statement shows all
characteristics of stored procedures including stored procedure names.
 It returns stored procedures that you have the privilege to access.
 */
SHOW PROCEDURE STATUS;

-- show procedures in particular DB

SHOW PROCEDURE STATUS
WHERE db = 'classicmodels';

--  stored procedures whose names contain a specific word

-- show proc ends with table
SHOW PROCEDURE STATUS
LIKE '%table';

-- Listing stored procedures using the data dictionary

-- the routine table in the information_schema database contains all information
-- on the stored procedure and stored functions of all databases in the currently MYSQL server

select * from information_schema.routines;

-- To show all stored procedures of a particular database, you use the following query:

SELECT routine_name
FROM   information_schema.routines
WHERE  routine_type = 'PROCEDURE'
AND    routine_schema = 'classicmodels';
        




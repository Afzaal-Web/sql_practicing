-- Listing stored functions using SHOW FUNCTION STATUS statement

-- SHOW FUNCTION STATUS LIKE 'pattern' WHERE condition
SHOW FUNCTION STATUS;

SHOW FUNCTION STATUS
WHERE db = 'classicmodels';

SHOW FUNCTION STATUS LIKE '%Customer%';

-- Listing stored functions using the data dictionary

SELECT 
		routine_name
FROM
		informational_schema.routines
WHERE
		routine_type = 'FUNCTION'
        AND
        routine_schema = 'dbname';
        

SELECT 
		routine_name
FROM
		informational_schema.routines
WHERE
		routine_type = 'FUNCTION'
        AND
        routine_schema = 'classicmodels';
        
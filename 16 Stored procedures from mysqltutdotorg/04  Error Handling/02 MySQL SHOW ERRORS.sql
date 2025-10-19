-- Introduction to MySQL SHOW ERRORS statement
-- The SHOW ERRORS statement is used to display error information
-- about the most recent execution of a statement or a stored procedure.
SHOW ERRORS;

-- LIMIT
-- SHOW ERRORS [LIMIT [offset,] row_count];

-- To get the total number of errors, you use the following form of the SHOW ERRORS statement:
SHOW COUNT(*) ERRORS;

-- Alternatively we can select it from system variable
SELECT @@error_count;

SELECT id FROM products;
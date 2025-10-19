
-- put this in first session

USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT POINTS 
FROM customers 
WHERE customer_id = 1;

-- END 

-- put this in 2nd session
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 20
WHERE customer_id = 1;
COMMIT;

-- END



/* In our first transaction we are dealing with a value which is never existed in database.
this is the problem with dirty reads.
So Read Uncommitted is the lowest isolation level and in this level you can experience all concurrency problems
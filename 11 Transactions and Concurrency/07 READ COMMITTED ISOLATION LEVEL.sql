
-- put this in first session

USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

SELECT POINTS FROM customers WHERE customer_id = 1;

SELECT POINTS FROM customers WHERE customer_id = 1;
COMMIT;
-- END 

-- put this in 2nd session
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 30
WHERE customer_id = 1;
COMMIT;

-- END

/* 
At this Read Committed isolation level, We have non repeatable or inconsitent reads.
*/
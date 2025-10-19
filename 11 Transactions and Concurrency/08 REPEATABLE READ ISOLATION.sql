-- In this isolation our reads are going to be consistent and repeatable.

-- In this isolation our reads are going to be consistent and repeatable.

-- put this in first session

USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

SELECT POINTS FROM customers WHERE customer_id = 1;

SELECT POINTS FROM customers WHERE customer_id = 1;
COMMIT;
-- END 

-- put this in 2nd session
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 50
WHERE customer_id = 1;
COMMIT;

-- END


-- Problem with REPEATABLE READ that is phantom read

-- put this in first session

USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;

-- END 

-- put this in 2nd session
USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA'
WHERE customer_id = 1;
COMMIT;

-- END



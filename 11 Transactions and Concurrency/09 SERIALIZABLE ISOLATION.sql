-- provides the highest level of isolation solves all concurrency pronblems

-- put this in first session

USE sql_store;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;

-- END 


-- put this in 2nd session
USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA'
WHERE customer_id = 3;
COMMIT;

-- END

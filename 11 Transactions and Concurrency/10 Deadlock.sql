-- What is deadlock
/* Deadlock happens when different transactions can not complete
because each transaction hold a lock that the other needs, so both transactions 
keep need eachother and never release their lock. */

USE sql_store;
START TRANSACTION;
UPDATE customers SET state = 'VA' WHERE customer_id = 1;
UPDATE orders SET status = 1 WHERE order_id = 1;
COMMIT;

-- IN THE SECOND SESSION WE HAVE CHAGNE THE ORDER OF UPDATE STATEMENTS

USE sql_store;
START TRANSACTION;
UPDATE orders SET status = 1 WHERE order_id = 1;
UPDATE customers SET state = 'VA' WHERE customer_id = 1;
COMMIT;
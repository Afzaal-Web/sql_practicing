START TRANSACTION;
UPDATE customers
SET point = points + 10
WHERE customer_id = 1;
COMMIT;
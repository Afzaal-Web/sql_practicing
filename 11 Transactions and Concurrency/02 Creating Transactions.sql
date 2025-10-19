
START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);

INSERT INTO order_items
VALUES(LAST_INSERT_ID(), 1, 1, 1);

COMMIT;



START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);

INSERT INTO order_items
VALUES(LAST_INSERT_ID(), 1, 1, 1);

ROLLBACK;

-- MYSQL wraps all the statements in transaction if it have error it then not commit the statment

SHOW VARIABLES LIKE 'autocommit%';
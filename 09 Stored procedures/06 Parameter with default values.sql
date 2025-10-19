DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER //
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
	IF state IS NULL THEN
    SET state = 'ca';
    END IF;
SELECT * FROM clients c
WHERE c.state = state;
END //
DELIMITER ;

CALL get_clients_by_state(null);

DELIMITER //
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
	IF state IS NULL THEN
    SELECT * FROM clients;
    ELSE
    SELECT * FROM clients c
    WHERE c.state = state;
    END IF;

END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
    SELECT * FROM clients c
    WHERE c.state = IFNULL(state,c.state);

END //
DELIMITER ;


-- EXCERCISE
-- get_payments with TWO parameters
-- client_id => INT
-- payment_method_id => TINYINT

DROP PROCEDURE IF EXISTS get_payments;
DELIMITER $$
CREATE PROCEDURE get_payments
(client_id INT, payment_method_id TINYINT)
BEGIN
SELECT
p.client_id,
p.payment_method,
p.invoice_id,
p.date,
p.amount,
pm.name AS payment_method
FROM payments p
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id
WHERE p.client_id = IFNULL(client_id,p.client_id) AND 
pm.payment_method_id = IFNULL(payment_method_id,pm.payment_method_id)
;
END $$
DELIMITER ;

CALL get_payments(5,null);

-- second way

DROP PROCEDURE IF EXISTS get_payments;
DELIMITER $$
CREATE PROCEDURE get_payments
(client_id INT, payment_method_id TINYINT)
BEGIN
SELECT *
FROM payments p
WHERE p.client_id = IFNULL(client_id,p.client_id) AND 
p.payment_method = IFNULL(payment_method_id,p.payment_method)
;
END $$
DELIMITER ;

CALL get_payments(5,null);
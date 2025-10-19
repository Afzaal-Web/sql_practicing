DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER //
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
SELECT * FROM clients c
WHERE c.state = state;
END //

DELIMITER ;

CALL get_clients_by_state('ca');


-- EXERCISE

/* Write a stored procedure to returb invoices
for a given client
get_invoices_by_client */
DROP PROCEDURE IF EXISTS get_invoices_by_client;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client
(name VARCHAR(50))
BEGIN
SELECT *, c.name

FROM invoices i
JOIN clients c USING (client_id)
WHERE c.name = name;
END $$
DELIMITER ;

CALL get_invoices_by_client('vinte');


DROP PROCEDURE IF EXISTS get_invoices_by_client;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client
(name VARCHAR(50))
BEGIN
SELECT *
FROM clients c
JOIN invoices_with_balance i USING (client_id)
WHERE c.name = name;
END $$
DELIMITER ;
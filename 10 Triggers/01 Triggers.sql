/* A block of sql code that automatically gets executed 
before or after an insert, update or delete statement*/


DROP TRIGGER IF EXISTS payment_afer_insert;
DELIMITER $$

CREATE TRIGGER payment_afer_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
		UPDATE invoices
        SET payment_total = payment_total + NEW.amount
        WHERE invoice_id = NEW.invoice_id;
END $$

DELIMITER ;

-- in trigger we can modify any table except the payments table
-- i.e table which is used for insert,delete or update right after create
-- trigger statement

INSERT INTO payments 
VALUES (DEFAULT,5,1,'2025-01-02',122,1);

UPDATE payments 
SET invoice_id = 4
where payment_id = 10;

-- Create a trigger that gets fired when we
-- delete a payment

DROP TRIGGER payment_afer_delete;
DELIMITER $$
CREATE TRIGGER payment_afer_delete
AFTER DELETE ON payments
FOR EACH ROW
BEGIN
		UPDATE invoices
        SET payment_total = payment_total - OLD.amount
        WHERE invoice_id = OLD.invoice_id;
END $$
DELIMITER ;


DELETE FROM payments
where payment_id = 17;

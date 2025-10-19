DROP TRIGGER IF EXISTS payment_afer_insert;
DELIMITER $$

CREATE TRIGGER payment_afer_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
		UPDATE invoices
        SET payment_total = payment_total + NEW.amount
        WHERE invoice_id = NEW.invoice_id;
        
        INSERT INTO payments_audit 
        VALUES (NEW.client_id,NEW.date,NEW.amount,'Insert',NOW());
END $$

DELIMITER ;

INSERT INTO payments 
VALUES (DEFAULT,5,1,'2025-01-02',122,1);


DROP TRIGGER IF EXISTS payment_afer_delete;
DELIMITER $$
CREATE TRIGGER payment_afer_delete
AFTER DELETE ON payments
FOR EACH ROW
BEGIN
		UPDATE invoices
        SET payment_total = payment_total - OLD.amount
        WHERE invoice_id = OLD.invoice_id;
        
		INSERT INTO payments_audit 
        VALUES (OLD.client_id,OLD.date,OLD.amount,'delete',NOW());
END $$
DELIMITER ;


DELETE FROM payments
where payment_id = 18;

-- user or session variables
-- SET @invoice_count = 0;

-- LOCAL VARAIBLES
-- DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;

DROP PROCEDURE IF EXISTS get_risk_factor;
DELIMITER $$
CREATE PROCEDURE get_risk_factor()
BEGIN
	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL;
    DECLARE invoices_count INT;
    
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count , invoices_total
    FROM invoices;
    
    SET risk_factor = invoices_total / invoices_count * 5;
    
    select risk_factor;
END $$

DELIMITER ;
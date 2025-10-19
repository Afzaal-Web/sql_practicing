

UPDATE invoices_with_balance
SET payment_total = invoice_total - 20
WHERE invoice_id = 3;

DELETE FROM invoices_with_balance
where invoice_id = 19;

RENAME TABLE invoices_with_balance TO invoices_with_balance_24;

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
where (invoice_total - payment_total) > 0
WITH CHECK OPTION;
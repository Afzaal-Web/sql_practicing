-- DISTINCT
-- Aggregate Functions (min, max, sum, avg, count)
-- group by / having
-- union

/* if the above are not in query then we can 
update, delete or insert view */


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
where (invoice_total - payment_total) > 0;

-- delete view row
DELETE FROM invoices_with_balance
WHERE invoice_id = 1;

-- update view
UPDATE invoices_with_balance
SET
due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2;
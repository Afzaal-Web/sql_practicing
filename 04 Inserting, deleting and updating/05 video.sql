-- copy table from one to another

CREATE TABLE ARCHIVE AS
SELECT * FROM orders;

-- INSERT INTO copy table
INSERT INTO archive 
SELECT * 
FROM orders 
WHERE order_date < '2019-01-01';

USE sql_invoicing;

-- EXERCISE
CREATE TABLE archived_invoices AS SELECT i.invoice_id,
    i.number,
    c.name AS client_name,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date FROM
    invoices i
        JOIN
    clients c USING (client_id)
WHERE
    i.payment_date IS NOT NULL;
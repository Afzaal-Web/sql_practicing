-- select invoices larger than all invoices of client 3

SELECT *
FROM invoices 
WHERE invoice_total > (
SELECT MAX(invoice_total) AS maximum
FROM invoices
WHERE client_id = 3
);

-- use of ALL
SELECT *
FROM invoices
WHERE invoice_total > ALL (
SELECT invoice_total
FROM invoices
WHERE client_id = 3
)

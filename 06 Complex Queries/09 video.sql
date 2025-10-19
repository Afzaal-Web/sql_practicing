SELECT 
	invoice_id,
    invoice_total,
    (SELECT AVG(invoice_total)
    FROM invoices
    )  AS invoice_avg,
    invoice_total - (SELECT AVG(invoice_total)
    FROM invoices
    )  AS difference
    FROM invoices;
    
    
-- EXERCISE
SELECT 
client_id,
name,
(SELECT SUM(invoice_total)
FROM invoices
WHERE client_id = c.client_id
) AS total_sales,
(SELECT AVG(invoice_total)
    FROM invoices
    )  AS average,
    (SELECT total_sales  - average) AS difference
FROM clients c;




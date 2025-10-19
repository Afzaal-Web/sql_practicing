


SELECT *
FROM employees e
WHERE salary > (
SELECT AVG(salary) AS Average
FROM employees
WHERE office_id = e.office_id
);

-- EXERCISE

SELECT *
FROM invoices i
WHERE invoice_total > (
SELECT AVG(invoice_total) AS Average
FROM invoices 
WHERE client_id = i.client_id
)


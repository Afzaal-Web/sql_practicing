-- Select clients that have an invoice
SELECT *
FROM clients
JOIN invoices i USING(client_id)
GROUP BY (client_id);

SELECT *
FROM clients
WHERE client_id IN (
SELECT client_id
FROM invoices
);
-- USING EXISTS Operator
SELECT *
FROM clients c
WHERE EXISTS (
SELECT client_id
FROM invoices
WHERE client_id = c.client_id
);

-- EXERCISE
-- Find the Products that have never been ordered

SELECT *
FROM products p
WHERE NOT EXISTS (
SELECT product_id
FROM order_items
WHERE product_id = p.product_id
)
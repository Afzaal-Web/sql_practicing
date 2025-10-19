SELECT *
FROM clients
WHERE client_id NOT IN (
SELECT DISTINCT client_id
FROM invoices
);

-- Using JOINS
SELECT *
FROM invoices
RIGHT JOIN clients USING (client_id)
WHERE invoice_id IS NULL;

-- EXERCISE
-- find customers who ordered lettuce (id =3)
-- select customer_id, first_name, last_name
SELECT
DISTINCT customer_id,
first_name,
last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING(order_id)
WHERE oi.product_id = 3;

--  IN
SELECT
customer_id,
first_name,
last_name
FROM customers
WHERE customer_id IN (
SELECT o.customer_id
FROM order_items oi
JOIN orders o USING (order_id)
WHERE product_id = 3
)



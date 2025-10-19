-- Two types of Joins
-- Inner Join *INNER keyword is optional
-- Outer Join


SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Two OUTER JOINS 
-- LEFT AND RIGHT JOINS
-- When we use a LEFT JOIN, all the records from the left table 
-- are returned whether ON condition is true or not
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- When we use a RIGHT JOIN, all the records from the Right table 
-- are returned whether ON condition is true or not
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
RIGHT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY o.order_id;

SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
RIGHT OUTER JOIN orders o -- OUTER keyword is optional
	ON c.customer_id = o.customer_id
ORDER BY o.order_id;


-- EXERCISE

SELECT 
p.product_id,
p.name,
oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
ORDER BY p.product_id;


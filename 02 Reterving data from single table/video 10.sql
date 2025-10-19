SELECT *
FROM customers
ORDER BY birth_date DESC;

SELECT *
FROM customers
ORDER BY state DESC, first_name DESC;

SELECT first_name, last_name
FROM customers
ORDER BY state DESC;

SELECT *
FROM customers
ORDER BY 8,9 DESC;

-- EXERCISE

SELECT *, quantity * unit_price AS total
FROM order_items
WHERE order_id = 2
ORDER BY quantity * unit_price DESC;
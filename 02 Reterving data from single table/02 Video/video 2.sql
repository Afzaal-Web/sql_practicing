-- SELECT * 
-- FROM customers
-- where customer_id = 1
-- ORDER BY last_name;

-- SELECT first_name, last_name
-- FROM customers;

-- SELECT last_name,first_name, points 
-- FROM customers;

-- SELECT last_name,first_name, points + 10
-- FROM customers;

-- SELECT last_name,first_name, points, points + 10
-- FROM customers;

-- SELECT last_name,first_name, points, points * 10 + 100 AS Points_Gains
-- FROM customers;

-- SELECT 
-- last_name,
-- first_name, 
-- points, 
-- (points + 10) * 100 AS Points_Gains
-- FROM customers;


-- SELECT 
-- last_name,
-- first_name, 
-- points, 
-- (points + 10) * 100 AS 'Points Gains'
-- FROM customers;

-- SELECT state
-- FROM customers;

-- SELECT DISTINCT state   -- DISTINCT removes duplicates
-- FROM customers;

-- Excercies

SELECT *
FROM products;

SELECT 
      name,
      unit_price,
      (unit_price * 1.1) AS new_price
      FROM products;


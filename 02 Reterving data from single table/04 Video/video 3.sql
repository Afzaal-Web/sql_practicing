SELECT *
FROM customers;

-- SELECT *
-- FROM customers
-- WHERE birth_date > '1990-01-01' AND points > 1000;

-- SELECT *
-- FROM customers
-- WHERE birth_date > '1990-01-01' OR points > 1000;

-- 	SELECT *
-- 	FROM customers
-- 	WHERE birth_date > '1990-01-01' OR points > 1000
-- 	AND state = 'va';

-- 	SELECT *
-- 	FROM customers
-- 	WHERE birth_date > '1990-01-01' OR
--  (points > 1000 AND state = 'va');
    
    -- SELECT *
	-- FROM customers
	-- WHERE NOT (birth_date > '1990-01-01' OR points > 1000);
    
    
-- EXCERCIES

SELECT *
FROM order_items;

SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity > 30;
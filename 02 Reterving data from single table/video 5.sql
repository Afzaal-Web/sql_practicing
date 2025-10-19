-- SELECT *
-- FROM customers
-- WHERE state = 'va' OR state = 'ga' OR state = 'fl';

-- SELECT *
-- FROM customers
-- WHERE state IN ('VA', 'GA', 'FL');

-- SELECT *
-- FROM customers
-- WHERE state NOT IN ('VA', 'GA', 'FL');


-- EXERCISE

SELECT *
FROM products;

SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72);
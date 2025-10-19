-- SELECT *
-- FROM customers
-- WHERE points > 3000;

-- > greater than
-- >= greater than or equal to
-- <  less than
-- <= less than or equal to
-- =  Equality
-- !=  Not equal to
-- <> Not equal to

-- SELECT *
-- FROM customers
-- WHERE state = 'VA';

-- SELECT *
-- FROM customers
-- WHERE state != 'vA';

-- SELECT *
-- FROM customers
-- WHERE state <> 'vA';

-- SELECT *
-- FROM customers
-- WHERE birth_date > '1990-01-01';

SELECT *
FROM orders;

SELECT *
FROM orders
WHERE order_date >= '2019-01-01';
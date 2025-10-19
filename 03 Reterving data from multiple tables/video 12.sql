use sql_store;
SELECT 
ROW_NUMBER() OVER (ORDER BY c.first_name) AS row_num,
c.first_name,
p.name,
c.customer_id
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name;

-- implicit syntax cross joins
SELECT 
c.first_name,
p.name,
c.customer_id
FROM customers c, products p
ORDER BY c.first_name;

-- EXERCISE
SELECT 
p.name AS `product name`,
s.name AS `shipper name`
FROM products p, shippers s;

-- explicit
SELECT 
p.name AS `product name`,
s.name AS `shipper name`
FROM products p
CROSS JOIN shippers s;

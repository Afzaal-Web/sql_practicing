SELECT *
FROM customers;

DESCRIBE customers;
INSERT INTO customers
VALUES (
DEFAULT,
'John', 
'Smith',
'2025-03-28',
'213-423-3344',
'123 Main Street',
'NYC',
'NY',
241212);

INSERT INTO customers (first_name,last_name)
VALUES (
'Bill',
'SMith'
);
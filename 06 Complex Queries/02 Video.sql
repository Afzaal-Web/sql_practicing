-- FIND PRODUCTS THAT ARE MORE 
-- EXPENSIVE THAN THE LETTUCE (ID = 3)

SELECT *
FROM products
WHERE unit_price > (
SELECT unit_price
FROM products
WHERE product_id = 3
);

-- EXERCISE
SELECT 
first_name,
last_name,
salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

SELECT 
    first_name,
    last_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


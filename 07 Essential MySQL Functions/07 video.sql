-- IF(expression, value_1, value_2)
SELECT
	order_id,
    order_date,
    IF(YEAR(order_date) = YEAR(NOW()),
    'Active', 
    'Archived') As active_status
FROM orders;


SELECT
	product_id,
    name,
    COUNT(*) AS orders,
    IF(COUNT(*) > 1, 'Many times', 'Once') AS frequency
FROM products
JOIN order_items USING (product_id)
group by product_id;


CREATE TABLE employees24 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees24 (emp_id, name, department, salary) VALUES
(1, 'Alice', 'IT', 6000),
(2, 'Bob', 'IT', 7000),
(3, 'Charlie', 'HR', 5000),
(4, 'David', 'HR', 5500);

SELECT department, name, SUM(salary) AS total
FROM employees24
GROUP BY department, name;







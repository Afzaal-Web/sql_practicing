CREATE INDEX idx_lastname ON customers (last_name(20));

SELECT 
COUNT(distinct LEFT(last_name, 1)),
COUNT(distinct LEFT(last_name, 5)), 
COUNT(distinct LEFT(last_name, 10)), 
COUNT(distinct LEFT(last_name, 15)), 
COUNT(distinct LEFT(last_name, 20))
from customers;

ANALYZE TABLE customers;
SELECT LEFT(last_name, 20) AS first_letter,
       COUNT(*) AS total_customers
FROM customers
GROUP BY first_letter with rollup
ORDER BY first_letter




SELECT first_name, state, COUNT(*) AS total
FROM customers
WHERE state = 'mi'
GROUP BY first_name, state;

EXPLAIN SELECT customer_id FROM customers WHERE state =  'ca';

CREATE INDEX idx_state ON customers (state);

-- Write query to find customers with more than 100o points

EXPLAIN SELECT count(customer_id) FROM customers WHERE points >  1000;

CREATE INDEX idx_points ON customers (points);
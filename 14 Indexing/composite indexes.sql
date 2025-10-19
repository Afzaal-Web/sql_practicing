use sql_store;

SHOW INDEXES IN customers;

DROP INDEX idx_points ON customers;

EXPLAIN SELECT count(customer_id)
FROM customers
WHERE state = 'ca' AND points >  1000;

CREATE INDEX idx_state_points ON customers (state, points)
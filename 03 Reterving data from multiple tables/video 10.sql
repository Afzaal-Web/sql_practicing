use sql_store;
SELECT 
o.order_id,
c.customer_id,
c.first_name,
sh.name AS shippers
FROM orders o
LEFT JOIN customers c
	-- ON o.customer_id = c.customer_id
    USING (customer_id)
JOIN shippers sh
	USING (shipper_id);
    
    
SELECT *
FROM order_items oi
JOIN order_item_notes oin
-- ON oi.order_id = oin.order_id AND
-- oi.product_id = oin.product_id;
USING (order_id, product_id);

-- EXERCISE

use sql_invoicing;
-- With USING (client_id), you don’t get duplicate client_id columns in the result.
SELECT 
    p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method
FROM
    payments p
        JOIN
    clients c USING (client_id)
        JOIN
    payment_methods pm ON p.payment_method = pm.payment_method_id;
    
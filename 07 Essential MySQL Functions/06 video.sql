-- IFNULL AND COALESCE

SELECT customer_id, 
IFNULL(shipper_id, 'Not Assigned yet') AS shipper
FROM orders;

SELECT customer_id, comments,
COALESCE(shipper_id, comments, 'Not Assigned yet') AS shipper
FROM orders;

-- EXERCISE

SELECT CONCAT(first_name, ' ', last_name) AS full,
IFNULL(phone, 'Unknown') AS phone
from
customers;

SELECT CONCAT(first_name, ' ', last_name) AS full,
COALESCE(phone, 'Unknown') AS phone
from
customers
CREATE database IF NOT EXISTS sql_store2;
DROP DATABASE IF EXISTS sql_Store2;

USE sql_store2;

CREATE TABLE IF NOT EXISTS customers
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(255) NOT NULL UNIQUE,
    points DECIMAL(4,2) NOT NULL DEFAULT 00.34
);

drop table if exists customers;

ALTER TABLE customers
ADD email VARCHAR(255) NOT NULL UNIQUE AFTER last_name,
ADD city  VARCHAR(50) NOT NULL,
MODIFY COLUMN last_name VARCHAR(50) NOT NULL,
DROP points;

SHOW INDEX FROM customers;

ALTER TABLE customers DROP INDEX last_name;



SHOW CREATE TABLE customers;

-- creating relationships

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
order_id 	INT PRIMARY KEY NOT NULL,
customer_id INT NOT NULL,
FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items 
(
order_id 	INT NOT NULL,
CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id)
REFERENCES orders (order_id)
ON UPDATE CASCADE
        ON DELETE NO ACTION,
        name VARCHAR(255) NOT NULL
);

-- ALTER relationships I.E PK AND FK

SHOW CREATE TABLE order_items;

-- remove fk 
ALTER TABLE order_items
	DROP FOREIGN KEY fk_order_items_orders;
    
-- add fk 
ALTER TABLE order_items
			ADD CONSTRAINT fk_order_items_orders
			FOREIGN KEY (order_id) REFERENCES orders (order_id)
			ON UPDATE CASCADE
			ON DELETE NO ACTION;

-- remove pk
ALTER TABLE customers
-- DROP PRIMARY KEY,
ADD PRIMARY KEY (email);

ALTER TABLE customers
MODIFY customer_id INT;  





-- MySQL Stored Procedures

use classicmodels;

/* The following SELECT statement returns
all rows in the table customers from the sample database:*/

SELECT 
	  customerName,
      city,
      state,
      postalCode,
      country
FROM
	  customers
ORDER BY customerName;

-- create procedure
DELIMITER $$

CREATE PROCEDURE sp_name()
BEGIN
SELECT 
	  customerName,
      city,
      state,
      postalCode,
      country
FROM
	  customers
ORDER BY customerName;
END $$

DELIMITER ;

-- call stored proceudre

CALL sp_name();

DELIMITER $$
CREATE PROCEDURE GetCustomers()
BEGIN
SELECT 
	  customerName,
      city,
      state,
      postalCode,
      country
FROM
	  customers
ORDER BY customerName;
END $$
DELIMITER ;

CALL GetCustomers();

-- MySQL Stored Procedures advantages
/* 
Reduce network traffic
Centralize business logic in the database
Make the database more secure

-- MySQL stored procedures disadvantages
Resource usage
Troubleshooting
Maintenances


-- will learn how to create a stored function using the CREATE FUNCTION statement.

-- stored function returns a single value
-- syntax

DELIMITER $$

CREATE FUNCTION fun_name (
param1,param2
)
RETURN datatype
[NOT] DETERMINISTIC
BEGIN

END $$
DELIMITER ;

-- 01 Name of the function
-- 02 list all parameters 
-- by default stored function consider all parameters as IN parameters. you can not specify IN, OUT AND INOUT modifiers to parameters.
-- 03 specify datatype of the return value
-- 04 determine whether the func is DETERMINISTIC 
-- A DETERMINISTIC FUNC	always return the same result for the same input
-- while a non diterministic func produces different results for the same input parameters
-- If you don’t use DETERMINISTIC or NOT DETERMINISTIC, MySQL defaults to the NOT DETERMINISTIC option.

-- 05 finally write code in the body og begin and end
-- inside the body section we need to include at least one RETURN stmt. The return stmt sends a value to the calling program

-- example


DROP FUNCTION IF EXISTS customer_level;
DELIMITER $$

CREATE FUNCTION customer_level(
		credit DECIMAL(10,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
		DECLARE customerLevel VARCHAR(20);
        
       IF credit > 50000
       THEN
       SET customerLevel = 'PLATINUM';
       ELSEIF (credit <= 50000 AND credit >= 10000)
       THEN
       SET customerLevel = 'GOLD';
       ELSEIF credit < 10000
       THEN
       SET customerLevel = 'SILVER';
       END IF;
       
       RETURN customerLevel;
END $$
DELIMITER ;



-- Calling function IN SQL STMT

SELECT 
customerName,
customer_level(creditLimit)
FROM customers;

 
-- Calling stored function in stored procedure

DELIMITER $$
CREATE PROCEDURE getCustomerLevel(customerNum INT)
BEGIN
	DECLARE customerCredit DECIMAL (10,2);
    SELECT creditLimit INTO customerCredit FROM customers WHERE customerNumber = customerNum;
    SELECT customer_level(customerCredit);
END $$
DELIMITER ;

-- Exercise 1

DELIMITER $$
CREATE FUNCTION getFullName(firstName VARCHAR(50), lastName VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
		DECLARE fullName VARCHAR(100) DEFAULT '';
        
        SELECT firstName, lastName INTO firstName, lastName
        FROM employees;
        
        SET fullName = CONCAT(firstName, ' ', lastName);
        
        RETURN fullName;

END $$
DELIMITER ;

-- Exercise 2
DROP FUNCTION IF EXISTS getEmailDomain;
DELIMITER $$
CREATE FUNCTION getEmailDomain(id INT)
RETURNS VARCHAR(100)
NOT DETERMINISTIC
BEGIN

	DECLARE domain VARCHAR(100);
    DECLARE p_email VARCHAR(100);
	SELECT email INTO p_email
    FROM employees
    WHERE employeeNumber = id;
    
    SET domain = SUBSTRING(p_email, LOCATE('@', p_email) + 1);
    
    RETURN domain;
END $$
DELIMITER ;

SELECT 
email,
getEmailDomain(1102)
FROM employees
WHERE employeeNumber = 1102;


SELECT 
   e.email,
   getEmailDomain(e.employeeNumber) AS domain
FROM (
   SELECT * FROM employees
) AS e
WHERE e.employeeNumber = 1102;

SELECT e.email, getEmailDomain(e.employeeNumber) AS domain
FROM (SELECT * FROM employees) AS e;



UPDATE employees
SET email = "gbondur@blinkride.com"
WHERE employeeNumber = 1002;


DROP FUNCTION IF EXISTS getEmailDomain;
DELIMITER $$
CREATE FUNCTION getEmailDomain(id INT)
RETURNS VARCHAR(100)
NOT DETERMINISTIC
READS SQL DATA
BEGIN

	DECLARE domain VARCHAR(100);
    DECLARE p_email VARCHAR(100);
	SELECT email INTO p_email
    FROM employees
    WHERE employeeNumber = id;
    
    SET domain = SUBSTRING(p_email, LOCATE('@', p_email) + 1);
    
    RETURN domain;
END $$
DELIMITER ;







 
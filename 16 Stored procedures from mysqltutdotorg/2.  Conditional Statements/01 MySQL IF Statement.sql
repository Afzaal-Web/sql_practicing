/* 
We will learn how to use MySQL IF statement to execute a block of SQL code based on a specified condition.
*/
-- IF() IF function

SELECT IF(1 = 2, 'true', 'false');  -- false

SELEct IF(1=1, 'AFZAAL', 'G');

SELECT 
		customerNumber,
		customerName,
		IF(state IS NULL, 'N/A', state) state,
		country
FROM
		customers;
        
-- we can use aggregate function with IF()
SELECT
		SUM(status) AS shipped,
		SUM(status = 'shipped') AS shipped,
        SUM(IF(status = 'shipped', 1, 0)) AS shipped_WITH_IF
FROM orders;

-- MySQL COUNT IF – Combining the IF function with the COUNT function

SELECT DISTINCT
    status
FROM
    orders
ORDER BY status;

SELECT
		COUNT(IF(status = 'cancelled', 1,null)) AS Cancelled,
        COUNT(IF(status = 'On Hold', 1,null)) AS `On Hold`
        FROM orders;



SELECT status, COUNT(STATUS)
FROM orders
GROUP BY status;

-- IF condition

/* 
The IF statement has three forms:
IF ... THEN (Evaluate one condition and execute a code block if the condition is true.)

IF ... THEN ... ELSE (Evaluate one condition and execute a code block if the condition is true; otherwise, execute another code block.)

IF .... THEN ... ELSEIF ... ELSE (Evaluate multiple conditions and execute a code block if a condition is true. If all conditions are false, execute the code block in the ELSE branch.)
*/

-- IF-THEN statement
IF condition 
THEN
statements;
END IF;

/*
First, define a condition to execute the code between the IF...THEN and END IF . 
If the condition is true, the statements between IF-THEN and END IF will execute.
Otherwise, control is passed to the next statement following the END IF.
*/

DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
	IN pcustomernum INT,
    OUT pcustomerLevel VARCHAR(20)
)
BEGIN
		DECLARE credit DECIMAL (10,2) DEFAULT 0;
        
        SELECT creditLimit INTO credit
        FROM customers
        WHERE customerNumber = pcustomernum;
        
        IF credit > 2000
        THEN
        SET pcustomerLevel = "PLATINUM";
        END IF;
END $$
DELIMITER ;

DROP PROCEDURE GetCustomerLevel;


DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
	IN pcustomernum INT,
    OUT pcustomerLevel VARCHAR(20)
)
BEGIN
		DECLARE credit DECIMAL (10,2) DEFAULT 0;
        
        SELECT creditLimit INTO credit
        FROM customers
        WHERE customerNumber = pcustomernum;
        
        IF credit > 2000
        THEN
        SET pcustomerLevel = "PLATINUM";
        ELSE
        SET pcustomerLevel = "Non Platium";
        END IF;
END $$
DELIMITER ;


-- IF-THEN-ELSEIF-ELSE statement

DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
	IN pcustomernum INT,
    OUT pcustomerLevel VARCHAR(20)
)
BEGIN
		DECLARE credit DECIMAL (10,2) DEFAULT 0;
        
        SELECT creditLimit INTO credit
        FROM customers
        WHERE customerNumber = pcustomernum;
        
     IF credit >= 2000 THEN
    SET pcustomerLevel = 'Platinum';
ELSEIF credit >= 1000 AND credit < 2000 THEN
    SET pcustomerLevel = 'Gold';
ELSE
    SET pcustomerLevel = 'Silver';
END IF;
END $$
DELIMITER ;

CALL GetCustomerLevel(112, @level);
select @level;


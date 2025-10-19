-- Definition: A cursor is a database object used for iterating the result
-- of a select statment. 

-- use in stored procedure, triggers and functions where you need to process individual rows 
-- returned by a query one at a time.

-- Syntax

/*
-- declare a cursor
DECLARE cursor_name CURSOR FOR
SELECT column1, column2
FROM table_name
WHERE apply_condition

OPEN cursor_name;

FETCH cursor_name INTO variable_1, variable_2;

CLOSE cursor_name;
*/

-- declare a cursor
-- cursor must be declare after any variable declaration
-- if cuursor declare before any variable MYSQL issue an error.
-- cursor must always associate with a SELCT statment

-- Open Cursor
-- to fecth data we have to must call Open Cursor
-- then retrieve the next row pointed by the cursor
-- advance the cursor to the subsequent row in the result set Using FETCH 

FETCH cursor_name INTO variable1, variable2;

-- Finally, deactivate the cursor and release the memory associated with
-- it using the CLOSE statement:

CLOSE cursor_name;

-- When working with MYSQL cursor, we must also declare a NOT FOUND handler
-- to manage the situtation when cursor can not find any row.

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1; 

-- Example

DELIMITER $$

CREATE PROCEDURE creat_email_list(
		INOUT email_list TEXT
)
BEGIN
	DECLARE done BOOL DEFAULT false;
    DECLARE email_address VARCHAR(100) DEFAULT '';
    
    DECLARE cur CURSOR FOR
    SELECT email 
    FROM employees;
    
    DECLARE CONTINUE HANDLER 
    FOR NOT FOUND SET done = true;
    
    OPEN cur;
    
    SET email_list = '';
    
    process_email: LOOP
    
    FETCH cur INTO email_address;
    
    IF done = true
    THEN
    LEAVE process_email;
    END IF;
    
    SET email_list = CONCAT(email_address, ",",email_list);
    
    END LOOP;
    
    CLOSE cur;
    
END $$
DELIMITER ;

-- Declare a variable to hold the email list
SET @my_email_list = 'test1@example.com,';  -- Initial value for the email list

-- Call the procedure with the INOUT parameter
CALL creat_email_list(@my_email_list);


DELIMITER $$
CREATE PROCEDURE fetch_customers()
BEGIN
		DECLARE done BOOL DEFAULT 0;
        DECLARE cusName VARCHAR(50) DEFAULT '';
        DECLARE cusCity VARCHAR(50) DEFAULT '';
        
        DECLARE curr CURSOR FOR
        SELECT customerName, city
        FROM customers
        WHERE country = 'UK';
        
        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        
        DROP TEMPORARY TABLE IF EXISTS temp_Table;
        
		CREATE TEMPORARY TABLE temp_Table(
        customerName VARCHAR(50),
        city VARCHAR(50)
        );
        
        OPEN curr;
        start_loop: LOOP
		FETCH curr INTO cusName, cusCity;
        IF done = 1
        THEN
        LEAVE start_loop;
        END IF;
        
        INSERT INTO temp_Table (customerName, city) value (cusName, cusCity);
        
        END LOOP;
        
        CLOSE curr;
		SELECT customerName AS CustomerName, city AS City
        FROM temp_Table;
END $$
DELIMITER ;



SELECT * 
FROM information_schema.tables
WHERE table_schema = 'classicmodels';


-- 2nd Exercise


        
        
DELIMITER $$
CREATE PROCEDURE fetch_customers_groupBY()
BEGIN
		DECLARE done BOOL DEFAULT 0;
        DECLARE cusCountry VARCHAR(50) DEFAULT '';
        DECLARE total INT DEFAULT 0;
        
        DECLARE curr CURSOR FOR
        SELECT country, count(*)
		FROM customers
        GROUP BY country;
        
        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        
        DROP TEMPORARY TABLE IF EXISTS temp_Table;
        
		CREATE TEMPORARY TABLE temp_Table(
        country VARCHAR(50),
        totalCustomers INT
        );
        
        OPEN curr;
        read_loop: LOOP
		FETCH curr INTO cusCountry, total;
        IF done = 1
        THEN
        LEAVE read_loop;
        END IF;
        
        INSERT INTO temp_Table (country, totalCustomers) value (cusCountry, total);
        
        END LOOP;
        
        CLOSE curr;
		SELECT country, totalCustomers
        FROM temp_Table;
END $$
DELIMITER ;

-- dfd






-- 3rd Exercise

DELIMITER $$
CREATE PROCEDURE fetch_customers_credits()
BEGIN
		DECLARE done BOOL DEFAULT 0;
        
        DECLARE cusName VARCHAR(50) DEFAULT '';
        DECLARE cusCountry VARCHAR(50) DEFAULT '';
        DECLARE cusCredit INT DEFAULT 0;
        
        DECLARE cusCategory VARCHAR(50) DEFAULT '';
        
        DECLARE curr CURSOR FOR
        SELECT customerName, country, creditLimit
		FROM customers;
        
        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        
        DROP TEMPORARY TABLE IF EXISTS temp_Table;
        
		CREATE TEMPORARY TABLE temp_Table(
        tempName VARCHAR(50),
        tempCountry VARCHAR(50),
        tempCreditLimit INT,
        tempCategory VARCHAR(50)
        );
        
        OPEN curr;
        read_loop: LOOP
        
		FETCH curr INTO cusName, cusCountry, cusCredit;
        
		IF done = 1
        THEN
        LEAVE read_loop;
        END IF;
        
		IF cusCredit > 100000
        THEN
        SET cusCategory = 'High';
        ELSEIF cusCredit BETWEEN 50000 AND 99000
        THEN
        SET cusCategory = 'Medium';
        ELSE 
        SET cusCategory = 'Low';
        END IF;
        
       
		
        INSERT INTO temp_Table (tempName, tempCountry, tempCreditLimit, tempCategory)
        value (cusName, cusCountry, cusCredit, cusCategory);
        
        END LOOP;
        
        CLOSE curr;
		SELECT   tempName AS CustomerName, tempCountry AS Country,
        tempCreditLimit AS CreditLimit,
        tempCategory AS CreditCategory
        FROM temp_Table;
END $$
DELIMITER ;


-- Exercise 4

DELIMITER ##

CREATE PROCEDURE getSalesRepName()
BEGIN
	  DECLARE done BOOL DEFAULT false;
      
      DECLARE cusName VARCHAR(50);
      DECLARE cusCountry VARCHAR(50);
      
      DECLARE efirstName VARCHAR(50);
      DECLARE elastName VARCHAR(50);
      DECLARE fullrepName VARCHAR(50);
      
      DECLARE curr CURSOR FOR
      SELECT c.customerName, c.country, e.firstName, e.lastName 
      FROM customers c
      JOIN employees e
      ON salesRepEmployeeNumber = employeeNumber;
      
      DECLARE CONTINUE HANDLER FOR NOT FOUND
      SET done = true;
      
      DROP TEMPORARY TABLE IF EXISTS temp_Table;
       
	  CREATE TEMPORARY TABLE temp_Table(
        tempName VARCHAR(50),
        tempCountry VARCHAR(50),
        tempsalesRepName VARCHAR(100)
        );
        
        OPEN curr;
        
        read_loop: LOOP
        
        FETCH curr INTO cusName, cusCountry, efirstName, elastName;
        
        IF done = true
        THEN
        LEAVE read_loop;
        END IF;
        
        SET fullrepName = CONCAT(efirstName, ' ', elastName);
        
		INSERT INTO temp_Table (tempName, tempCountry, tempsalesRepName)
        value (cusName, cusCountry, fullrepName);
        
        END LOOP;
        CLOSE curr;
        
        SELECT tempName AS CustomerName, tempCountry AS Country,
        tempsalesRepName AS SalesRepName
        FROM temp_Table;
        
END ##
DELIMITER ;











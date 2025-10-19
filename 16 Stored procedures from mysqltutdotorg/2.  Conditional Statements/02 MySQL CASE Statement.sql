/* WE will learn how to use MySQL CASE statements to construct complex conditional
   statements inside stored procedures. 
   
   Besides the IF statement, MySQL provides an alternative conditional statement called
   the CASE statement used in stored procedures. The CASE statements make the code more
   readable and efficient.
   
*/

-- The CASE statement has two forms:
		-- Simple CASE statement
        -- Searched CASE statement
        
-- Simple CASE statement
-- The following is the basic syntax of the simple CASE statement:

/*
CASE {`case value`}
	WHEN `value` THEN `value`
    WHEN `value` THEN `value`
    
    ELSE `value`
END CASE;
*/

/*
In this syntax, the simple CASE statement sequentially compares the case_value is with when_value1,
when_value2, and so on until it finds a match.
When the CASE finds a case_value that is equal to a when_value, it executes statements in the
corresponding THEN clause.
If the CASE statement cannot find any matches, it executes the else-statements in the ELSE clause
if the ELSE clause is available.
If the ELSE clause is not available and the CASE cannot find any matches, it’ll issue the following
error:
Case not found for CASE statement
*/

/*
To avoid the error when the case_value does not equal any when_value, you can use an empty
BEGIN...END block in the ELSE clause:
CASE case_value
    WHEN when_value1 THEN ...
    WHEN when_value2 THEN ...
    ELSE 
        BEGIN
        END;
END CASE;
*/

/*
The simple CASE statement tests for equality ( =), therefore, you cannot use it to test equality
with NULL because NULL = NULL returns FALSE.
*/

-- Simple CASE statement example

DELIMITER $$
CREATE PROCEDURE GetCustomerShipping(
	IN pcustomerNumber INT,
    OUT pshipping VARCHAR(50)
)
BEGIN
		DECLARE customerCountry VARCHAR(100);
        
        SELECT country INTO customerCountry
        FROM customers
        WHERE customerNumber = pcustomerNumber;
        
        CASE customerCountry
        WHEN 'USA'
        THEN 
        SET pshipping = '2-day Shipping';
        
        WHEN 'UK'
        THEN 
        SET pshipping = '3-day Shipping';
        
		WHEN 'Switzerland'
        THEN 
        SET pshipping = '5-day Shipping';
        
        ELSE
		SET pshipping = 'More than 10-day Shipping';
         
		END CASE;
        
	
	    SELECT customerNumber AS CustomerNumber,
		customerName AS CustomerName,
		country AS Country
		FROM customers
		WHERE customerNumber = pcustomerNumber;

END $$
DELIMITER ;

-- Searched CASE statement
/*
The simple CASE statement only allows you to compare a value with a set of distinct values.

To perform more complex matches such as ranges, you use the other form of the CASE statement
called the searched CASE statement.

The searched CASE statement is equivalent to the IF statement. However, it’s much more readable
than the IF statement.

basic syntax

CASE
	WHEN search condition1 THEN statements
    WHEN search condition2 THEN statements
    ...
    ELSE statements
END CASE;

*/

DELIMITER $$
CREATE PROCEDURE GetDeliveryStatus(
	IN porderNumber INT,
    OUT deliveryStatus VARCHAR(100)
)
BEGIN
		DECLARE waitingday INT DEFAULT 0;
        
        SELECT 
        DATEDIFF(requiredDate, shippedDate) INTO waitingday
        FROM orders
        WHERE
        orderNumber = porderNumber;
        
        CASE 
			WHEN waitingday < 0
			THEN
			SET deliveryStatus = 'Early status';
			
			WHEN waitingday = 0
			THEN
			SET deliveryStatus = 'On Time';
			
			WHEN waitingday >= 1
			THEN
			SET deliveryStatus = 'Late';
			
			WHEN waitingday >= 5
			THEN
			SET deliveryStatus = 'Very Late';
			
			ELSE
			SET deliveryStatus = 'No Information';
        END CASE;
END $$
DELIMITER ;


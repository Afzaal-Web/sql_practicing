-- how to create store proc with parameters including IN,OUT and INOUT

-- A parameter in a stored procedure has one of three modes: IN, OUT, or INOUT. 

-- IN parameters
-- IN is the default mode
-- When defining an IN parameter in a stored procedure, the calling program
-- must pass an argument to the stored procedure.

/* Additionally, the value of an IN parameter is protected. This means that even
if you change the value of the IN parameter inside the stored procedure, its original
value remains unchanged after the stored procedure ends. In other words, the stored
procedure works only on the copy of the IN parameter. */

-- OUT parameters 
/* The value of an OUT parameter can be modified within the stored procedure, and its updated
value is then passed back to the calling program. */

-- INOUT parameters 
-- An INOUT  parameter is a combination of IN and OUT parameters. 
-- This means that the calling program may pass the argument, and
-- the stored procedure can modify the INOUT parameter and pass the
-- new value back to the calling program.

-- IN parameter example

DELIMITER $$
CREATE PROCEDURE getOfficeByCountry( IN countryName VARCHAR(255) )
BEGIN
		SELECT *
        FROM offices
        WHERE country = countryName;
END $$
DELIMITER ;

CALL getOfficeByCountry('JAPAN');

-- The OUT parameter example

DELIMITER $$
CREATE PROCEDURE GetOrderCountByStatus 
( 
	IN orderStatus VARCHAR(25),
    OUT total INT
)
BEGIN
		SELECT COUNT(orderNumber)
        INTO total
        FROM orders
        WHERE status = orderStatus;
END $$
DELIMITER ;

CALL GetOrderCountByStatus('disputed',@total);
select @total;

-- 2nd example

DELIMITER $$
CREATE PROCEDURE getEmpByDesignation
(
	IN jobTitle VARCHAR(255),
    OUT total INT
)
BEGIN
		SELECT COUNT(employeeNumber)
        INTO total
        FROM employees e
        WHERE e.jobTitle LIKE CONCAT('%', jobTitle, '%');
END $$
DELIMITER ;

CALL getEmpByDesignation('vp', @total);
select @total;


DELIMITER $$
CREATE PROCEDURE getCreditLimit
(
	IN cusNum INT,
    OUT creditLim INT
)
BEGIN
	SELECT creditLimit INTO creditLim
    FROM customers
    WHERE customerNumber = cusNum;
END $$
DELIMITER ;

CALL getCreditLimit(103,@cl);
select @cl AS credit_Num;


-- The INOUT parameter example

DELIMITER $$
CREATE PROCEDURE DoubleValue(INOUT num INT)
BEGIN
SET num = num + 10;
END $$
DELIMITER ;

SET @num = 2; --  input values
CALL DoubleValue(@num); -- procedure modifies it
SELECT @num; -- output value

DELIMITER $$
CREATE PROCEDURE add5toYourNumber(INOUT counter INT)
BEGIN
		SET counter = counter + 5;
END $$
DELIMITER ;

SET @num = 15;
CALL add5toYourNumber(@num);
SELECT @num;

DROP PROCEDURE IF EXISTS discountOnPrice;
-- Apply discount on price
DELIMITER $$

CREATE PROCEDURE discountOnPrice(
    IN cusNumber INT, 
    INOUT discount DECIMAL(10,2)
)
BEGIN
    DECLARE totalAmount DECIMAL(10,2);

    -- Get total amount for the given customer
    SELECT SUM(amount)
    INTO totalAmount
    FROM payments
    WHERE customerNumber = cusNumber;

    -- Apply 10% discount on total amount
    SET discount = totalAmount - (totalAmount * 0.10);
END $$

DELIMITER ;


SET @cus = 103;       -- customerNumber
SET @disc = 0;        -- initial input (can be 0 or ignored)
CALL discountOnPrice(@cus, @disc);
SELECT @disc AS final_discounted_amount;

DELIMITER $$
CREATE PROCEDURE increment(IN num INT, INOUT inc INT)
	BEGIN
			SET inc = inc + num;
	END $$
DELIMITER ;

CALL increment(2)
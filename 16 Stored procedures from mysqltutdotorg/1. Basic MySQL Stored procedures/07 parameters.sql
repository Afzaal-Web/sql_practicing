-- parameters

-- IN AND OUT

DELIMITER $$
CREATE PROCEDURE getOrderDateNstatus
(
	IN orderNum INT,
    OUT order_date DATE,
    OUT status VARCHAR(15)
)
BEGIN
		SELECT o.orderDate,  o.status
        INTO   order_date,   status
        FROM   orders o
        WHERE  o.orderNumber = orderNum;
END $$
DELIMITER ;

    SET @order_date = 0;
    SET @status = 0;
    CALL getOrderDateNstatus(10167,@order_date,  @status);
    SELECT @order_date AS order_date, @status AS order_satus;
    
 -- INOUT   
    
DELIMITER $$
CREATE PROCEDURE updateOrderStatus
(
	IN orderNum INT,
    INOUT currentStatus VARCHAR(15)
)
BEGIN
		DECLARE dbStatus VARCHAR(15) DEFAULT NULL;
        
        SELECT status INTO dbStatus
        FROM orders
        WHERE orderNumber = orderNum;
        
        IF dbStatus = 'In Process'
        THEN
        SET currentStatus = 'Shipped';
        ELSE
        SET currentStatus = dbStatus;
        END IF;
END $$
DELIMITER ;

SET @currentStatus = '';
CALL updateOrderStatus(10100, @currentStatus);
SELECT @currentStatus AS currStatus;


--


DELIMITER $$
CREATE PROCEDURE raiseSalary
(
	IN cusNum INT,
    INOUT amount DECIMAL(10,2)
)
BEGIN
	DECLARE crlimit DECIMAL(10,2) DEFAULT 0;
    
	SELECT creditLimit INTO crlimit
    FROM customers
    WHERE customerNumber = cusNum;
    
	SELECT MAX(p.amount) INTO amount
	FROM payments p
	WHERE p.customerNumber = cusNum;
    
    IF crlimit < 20000
    THEN
    SET amount = amount + (amount * 0.5);
    ELSE
    SET amount = amount - (amount * 0.5);
    END IF;
END $$
DELIMITER ;




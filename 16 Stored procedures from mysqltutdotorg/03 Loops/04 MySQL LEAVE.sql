-- LEAVE immediately exits a loop or block before its natural end
-- like a break statement in other languages.

-- basic syntax
 
-- LEAVE label;

/*

CREATE PROCEDURE sp_name()
sp: BEGIN
	IF condition THEN
        LEAVE sp;
    END IF;
END $$

*/
-- Using the LEAVE statement to exit a stored procedure

DELIMITER $$
CREATE PROCEDURE checkCredit(
	pcustomerNumber Int
)
sp: BEGIN
		DECLARE customerCount INT;
         
		SELECT COUNT(*) INTO customerCount
        FROM customers
        WHERE customerNumber = pcustomerNumber;
        
        IF customerCount < 1
        THEN
        SELECT 'NO CUSTOMER EXISTS' AS SEARCH;
        LEAVE sp;
        END IF;
        
        UPDATE customers
        SET creditLimit = creditLimit + 0.5
        WHERE customerNumber = pcustomerNumber;
        
END $$
DELIMITER ;

CALL checkCredit(241212);

-- Using LEAVE statement in a loop example

DELIMITER $$
-- The following stored procedure generates a string of integers with the 
-- number from 1 to a random number between 4 and 10:

CREATE PROCEDURE leaveDemo(
		OUT result VARCHAR(100)
)
BEGIN

		DECLARE counter INT DEFAULT 1;
        DECLARE times INT;
        
        SET times = FLOOR(RAND()*(10-4+1)+4);
        SET result = '';
        
        disp: LOOP
        SET result = CONCAT(result,counter, '');
        
        IF counter = times
        THEN
        LEAVE disp;
        END IF;
        
        SET counter = counter + 1;
        END LOOP;
        
END $$
DELIMITER ;

SET @result = '';
CALL leaveDemo(@result);
SELECT @result;

DELIMITER **

CREATE PROCEDURE leaveEvenLoop(OUT result VARCHAR(100))
BEGIN
		DECLARE counter INT DEFAULT 1;
        SET result = '';
        
        stopAt: LOOP
		SET result = CONCAT(result, counter);
        
        IF counter > 6 AND counter % 2 != 0
        THEN
        LEAVE stopAt;
        END IF;

        SET counter = counter + 1;
        
        END LOOP;
END **
DELIMITER ;

CALL leaveEvenLoop(@result);
SELECT @result;






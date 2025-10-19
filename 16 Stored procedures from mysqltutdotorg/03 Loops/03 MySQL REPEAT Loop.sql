-- REPEAT checks the condition after each iteration (runs at least once).

-- The REPEAT statement creates a loop that repeatedly executes a block of statements until a condition is true.

-- SYNTAX
-- [begin_label] REPEAT
-- statements
-- UNTIL condition
-- END REPEAT

-- PROCEDURE to concatenate numbers from 1 to 9:
DELIMITER $$
CREATE PROCEDURE count_to_ten()
BEGIN
		DECLARE counter INT DEFAULT 0;
        DECLARE result VARCHAR(100) DEFAULT '';
        
        REPEAT 
        SET counter = counter + 1;
        SET result = CONCAT(result,counter, ',');
        UNTIL counter >= 10
        END REPEAT;
        
        SELECT result;
END $$
DELIMITER ;

CALL count_to_ten();

-- Exercise 2

DELIMITER //
CREATE PROCEDURE sum_to_n(IN n INT)
BEGIN
		DECLARE total INT DEFAULT 0;
        
        REPEAT
        SET total = total + n;
        SET n = n -1;
        UNTIL n <= 0
        END REPEAT;
        
        SELECT total;
END //
DELIMITER ;
CALL sum_to_n(5);

-- Exercise 3

DELIMITER //
CREATE PROCEDURE factorial_of_n(IN n INT)
BEGIN
		DECLARE total INT DEFAULT 1;
        REPEAT
        SET total = total * n;
        SET n = n - 1;
        UNTIL n <= 0
        END REPEAT;
        SELECT total;
END //
DELIMITER ;
CALL factorial_of_n(5);

-- Exercise 4

DELIMITER //
CREATE PROCEDURE  reverse_count(IN n INT)
BEGIN
		DECLARE count VARCHAR(100) DEFAULT '';
        
        REPEAT
        SET count = CONCAT(count,n, ',');
        SET n = n - 1;
        UNTIL n <= 0
        END REPEAT;
        
        SELECT count;
END //
DELIMITER ;
CALL reverse_count(15);

-- Exercise 4

DELIMITER //
CREATE PROCEDURE even_sum(IN n INT)
BEGIN
		DECLARE sum INT DEFAULT 0;
        
        REPEAT
        IF n % 2 = 0
        THEN
        SET sum = sum + n;
        END IF;
        SET n = n - 1;
        
        UNTIL n <= 0
        END REPEAT;
        
        SELECT sum;
END //
DELIMITER ;
CALL even_sum(10);
 


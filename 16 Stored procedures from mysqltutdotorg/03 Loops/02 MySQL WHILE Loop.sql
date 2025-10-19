-- WHILE checks the condition before each iteration (may not run at all);

-- Introduction to MySQL WHILE loop statement
/*
The WHILE loop is a loop statement that executes a block of code
repeatedly as long as a condition is true.

[begin-label] WHILE search condition DO
STATEMENT LIST
END WHILE [end_label]
*/

DELIMITER $$
CREATE PROCEDURE loadDates(
	startDate DATE,
    day INT
)
BEGIN
		DECLARE currDate DATE DEFAULT startDate;
        DECLARE counter INT DEFAULT 1;
        
        WHILE counter <= day
        DO
        CALL insertDate(currDate);
        SET counter = counter + 1;
        SET currDate = DATE_ADD(currDate, INTERVAL 1 DAY);
        END WHILE;

END $$
DELIMITER ;

CALL loadDates('2025-10-18',5);

DELIMITER $$
CREATE PROCEDURE insertDate(
	currDate DATE
)
BEGIN
        INSERT INTO calendars
		VALUES (currDate, MONTH(currDate), QUARTER(currDate), YEAR(currDate));
END $$
DELIMITER ;

  CALL insertDate('2025-10-12');

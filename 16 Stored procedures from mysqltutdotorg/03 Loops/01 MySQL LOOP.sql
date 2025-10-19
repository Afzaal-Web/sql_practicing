-- Introduction to MySQL LOOP statement

CREATE TABLE calendars (
    date DATE PRIMARY KEY,
    month INT NOT NULL,
    quarter INT NOT NULL,
    year INT NOT NULL
);
    

DELIMITER $$
CREATE PROCEDURE fillData(
	IN startDate DATE,
    IN endDate DATE
)
BEGIN
		DECLARE currentDate DATE DEFAULT startDate;
		
		insert_date: LOOP
		SET currentDate = DATE_ADD(currentDate, INTERVAL 1 DAY);
		
		IF currentDate > endDate
		THEN
		LEAVE insert_date;
		END IF;
		
		INSERT INTO calendars
		VALUES (currentDate, MONTH(currentDate), QUARTER(currentDate), YEAR(currentDate));
		END LOOP;
END $$
DELIMITER ;

CALL fillData('2024-01-01','2024-12-31');

SELECT 
    *
FROM
    calendars
ORDER BY date DESC
LIMIT 3;









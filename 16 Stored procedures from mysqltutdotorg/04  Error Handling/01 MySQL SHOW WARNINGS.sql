/*
When you execute a statement and encounter an error or warning, you can use
the SHOW WARNINGS statement to display detailed information.
*/
-- Basic syntax


DROP TABLE IF EXISTS abc;

SHOW WARNINGS;
/*
The output has three columns:
Level: It can be a Note or Error.
Code: This is an integer that represents a MySQL error code.
Message: This stores the detailed warning or error message.
*/

-- SHOW WARNINGS [LIMIT [OFFSET,] row_count]

SELECT 
    DATE_SUB('2017-02-29', INTERVAL - 1 DAY) d1,
    DATE_SUB('2017-12-32', INTERVAL + 2 DAY) d2,
    DATE_SUB('2017-15-03', INTERVAL + 5 DAY) d3;

SHOW WARNINGS LIMIT 2;

SHOW COUNT(*) WARNINGS;

SHOW VARIABLES LIKE 'max_error_count';


SET max_error_count=2048;

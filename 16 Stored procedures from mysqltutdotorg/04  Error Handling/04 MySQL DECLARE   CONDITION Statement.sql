/*
The DECLARE ... CONDITION statement in MySQL allows you to assign a meaningful
name to an error code or SQLSTATE, making error handling in stored procedures
clearer and more readable.
*/

DECLARE condition_name CONDITION FOR condition_value

condition_value: {
	mysql_error_code | SQLSTATE [VALUE] sqlstate_value
}

DECLARE CONTINUE HANDLER FOR 1051
BEGIN

END;

DECLARE unknow_table CONDITION FOR 1051
DECLARE CONTINUE HANDLER FOR unknow_table
BEGIN

END;

-- EXAMPLE

DROP PROCEDURE IF EXISTS GetData;

DELIMITER $$
CREATE PROCEDURE GetData(
	IN table_name VARCHAR(255)
)
BEGIN
		DECLARE unknown_table CONDITION FOR 1146;
        DECLARE EXIT HANDLER FOR unknown_table
        BEGIN
        SELECT 'Error: Table does not exists. Please choose a different TABLE.' AS Message;
        END;
        
        SET @sql_query = CONCAT('SELECT * FROM ', table_name);
        
        PREPARE stmt FROM @sql_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

END $$
DELIMITER ;

CALL GetData('abc');



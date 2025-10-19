-- how to use MySQL handler to handle errors or warnings encountered in stored procedures.

-- basic syntax
/*
DECLARE {EXIT | CONTINUE} HANDLER
		FOR condition_value, [, condition_value] ...
        statements;
        
DECLARE { EXIT | CONTINUE } HANDLER : declare a handler instructing whether it should exit or continue
FOR condition_value [, condition_value] ...: This specifies the condition that activate the handler and we can specify multiple condtiitons by separating with comma
statement: This statement or block of statements executes when the stored procedure encounters one of the specified conditions.

The condition_value can be one of the following
	- mysql_error_code: such as 1051
    - SQLWARNING: Shorthand for the class of SQLSTATE values that begin with '01'
    - NOT FOUND: Shorthand for the class of SQLSTATE values that begin with '02'
    - SQLEXCEPTION: Shorthand for the class of SQLSTATE values that do not begin with '00', '01', 02'
    - SQLSTATE [VALUE] sqlstate_value: this is a string that indicates an SQLSTATE value, such as '42501' means 'Unknown Table'
    
SQLSTATE is a five-character that provides information about the result of an SQL operation.
An SQLSTATE consists of two parts:
Class code (First Two Characters): Indicates the general category of the error
Subclass Code (Next three character): provide more specific about the error within the general category

For example, a SQLSTATE code of ’42S02′ indicates a missing table, where ’42’ is the class code for syntax 
error or access rule violation, and ‘S02’ is the subclass code indicating that the table is not found.
*/

-- MySQL DECLARE … HANDLER example

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) NOT NULL
);



/*
DECLARE {EXIT | CONTINUE} HANDLER
		FOR condition_value, [, condition_value] ...
        statements;
        */
        
DROP PROCEDURE IF EXISTS insert_User;
DELIMITER $$
CREATE PROCEDURE insert_User(
	IN pusername VARCHAR(100),
    IN pemail VARCHAR(255)
)
BEGIN
		DECLARE EXIT HANDLER FOR SQLSTATE '23000'
        BEGIN
		SELECT 'Error: Duplicate username. Please choose a different username.' AS Message;
        END;
        
		INSERT INTO users (username, email)
        VALUES (pusername, pemail);
        
        SELECT 'User Inserted successfully' AS message;
END $$
DELIMITER ;

CALL insert_User('afzaaL', 'afzaal@gmail.com');
















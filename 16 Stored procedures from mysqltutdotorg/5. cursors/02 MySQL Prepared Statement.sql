-- MySQL Prepared Statement

-- MYSQL prepared statments are a feature that helps
-- to enhance the security and performance of db queries
-- allows to write sql queries with placeholder for parameters
-- then bind values to those parameters at runtime

-- syntax based on three statments

PREPARE
EXECUTE
DEALLOCATE PREPARE

-- PREPARE statement
PREPARE stmt FROM preparable_stmt;
-- 1. name of the prepared statement (stmt_name) after the PREPARE keyword.
-- 2. provide the SQL statement with placeholders (?) (preparable_stmt) 
-- the preparable is single sql statment, not multiple statment

/*After creating a prepared statement, you need to initialize a 
set of user variables to supply values for the parameter placeholders (?) 
specified in the prepared statement:*/

SET @var_name1 = value_1;
SET @var_name2 = value_2;

-- EXECUTE statement
-- The EXECUTE stmt runs the prepared stmt with the actual values
EXECUTE stmt_name [USING @var_name [, @var_name] ...];

-- If the prepared statement contains any parameter markers (?), 
-- you need to supply the user variables containing values for these parameters.

-- Note that you can use only user variables as the values for the parameters.
-- You can execute the same prepared statement as many times as you want,
-- each time, you can set the variables to different values before each
-- execution.

-- DEALLOCATE PREPARE statement

-- The DEALLOCATE PREPARE statement releases the resource associated with
-- the prepared statement:

DEALLOCATE | DROP PREPARE stmt_name;


-- create db
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Prepare stmt
PREPARE insert_user FROM 'INSERT INTO users (username, email) VALUES (?,?)';

SET @username = 'afzaa';
SET @email = 'jone@gmail.com';

SET @username = 'sds; DROP TABLE users; --';
SET @email = 'bnghe@example.com';

EXECUTE insert_user USING @username, @email;

-- deallocate the resources
DEALLOCATE PREPARE insert_user;


PREPARE stmt FROM 'SELECT * FROM users WHERE username = ?';
SET @username = "afzaa'; DROP TABLE users; --";
EXECUTE stmt USING @username;












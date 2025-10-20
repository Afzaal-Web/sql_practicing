-- MySQL uses DEFINER and SQL SECURITY characteristics to control these privileges.

-- The DEFINER attribute
-- When you define a stored routine such as a stored procedure or function, you can optionally specify the DEFINER attribute, which is
-- the name of a MySQL account:

CREATE [DEFINER=user] PROCEDURE spName(parameter_list)
...

CREATE [DEFINER=user] FUNCTION sfName()
...


-- The SQL SECURITY characteristic

-- Stored routines (stored procedures and functions) and views can include an
-- SQL SECURITY clause with a value of DEFINER or INVOKER:


CREATE [DEFINER=user] PROCEDURE spName(parameter_list)
SQL SECURITY [DEFINER | INVOKER]
...

CREATE [DEFINER=user] FUNCTION sfName(parameter_list)
SQL SECURITY [DEFINER | INVOKER]
...


CREATE DATABASE testdb;

CREATE TABLE messages (
    id INT AUTO_INCREMENT,
    message VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DELIMITER $$

CREATE DEFINER = afzaal PROCEDURE InsertMessage( 
    msg VARCHAR(100)
)
SQL SECURITY DEFINER
BEGIN
    INSERT INTO messages(message)
    VALUES(msg);
END$$

DELIMITER ;

-- The SQL Security is set to the definer. It means that any user account that calls this stored procedure
-- will execute with all privileges of the definer i.e., root@localhost user account.


CREATE USER dev@localhost 
IDENTIFIED BY 'azs1234';

GRANT EXECUTE ON testdb.* 
TO dev@localhost;
FLUSH PRIVILEGES;

REVOKE SELECT ON testdb.* FROM 'dev'@'localhost';


DELIMITER $$

CREATE DEFINER=root@localhost 
PROCEDURE UpdateMessage( 
    msgId INT,
    msg VARCHAR(100)
)
SQL SECURITY INVOKER
BEGIN
    UPDATE messages
    SET message = msg
    WHERE id = msgId;
END$$

DELIMITER ;

-- The UpdateMessage has the security context of INVOKER who calls this stored procedure.


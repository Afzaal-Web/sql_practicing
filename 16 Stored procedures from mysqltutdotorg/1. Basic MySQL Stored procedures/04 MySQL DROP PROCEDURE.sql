DROP PROCEDURE IF EXISTS new_procedure;

/*
Note that you need to have the ALTER ROUTINE privilege of the
stored procedure in order to remove it.
*/

DELIMITER $$

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT 
        firstName, 
        lastName, 
        city, 
        state, 
        country
    FROM employees
    INNER JOIN offices using (officeCode);
    
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS GetEmployee;
SHOW WARNINGS;
-- Introduction to MySQL SIGNAL statement

/*
The MySQL SIGNAL statement allows you to raise an exception within a 
stored program, including a stored procedure, a stored function, a trigger,
or an event.
*/

-- signal statement

SIGNAL condition_value
[SET signal_information_item,
	  signal_information,....]
      
   -- Create a sample database and switch to it
CREATE DATABASE IF NOT EXISTS hr;
USE hr;

-- Create a sample employee table
CREATE TABLE IF NOT EXISTS employees24 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Insert some sample data
INSERT INTO employees24 (id, name, salary) 
VALUES
    (1, 'John Doe', 50000),
    (2, 'Jane Smith', 75000),
    (3, 'Bob Johnson', 90000); 
    
SHOW PROCEDURE STATUS;
DROP PROCEDURE update_salary;
DELIMITER $$
CREATE PROCEDURE update_salary(
p_id INT,
p_salary DECIMAL(10,2)
)
BEGIN
			DECLARE p_count INT DEFAULT 0;
            
            SELECT COUNT(*) INTO p_count
            FROM employees24
            WHERE id = p_id;
            
            IF p_count = 0
            THEN
            SIGNAL SQLSTATE '45000'
            SET message_text = 'employee not found';
            END IF;
            
            IF p_salary < 0
            THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'salary can not be negative';
            END IF;
            
            UPDATE employees24
            SET salary = p_salary
            WHERE id = p_id;
            
            SELECT 'Salary updated successfully';
END $$
DELIMITER ;

CALL update_salary(6,3456);


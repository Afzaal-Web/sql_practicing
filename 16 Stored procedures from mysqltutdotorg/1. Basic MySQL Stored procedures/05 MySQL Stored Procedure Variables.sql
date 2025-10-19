/* A variable is a named data object whose value can change during the execution of a stored procedure. 
Typically, you use variables to hold immediate results. These variables are local to the stored procedure.

Declaring variables
To declare a variable inside a stored procedure, you use the DECLARE  statement as follows:
*/
DECLARE variable_name datatype(size) [DEFAULT dafault_value];
/* In this syntax:
				1. First, specify the name of the variable after the DECLARE keyword. Ensure the variable 
                name adheres to MySQL table column naming rules.
                2. Second, define the data type and length of the variable. Variables can have any MySQL
                data type, such as INT, VARCHAR , and DATETIME.
                3. Third, assign a default value to the variable using the DEFAULT option. If you declare
                a variable without specifying a default value, its default value is NULL.
*/

DECLARE totalSale DEC(10,2) DEFAULT 0.0;

-- MySQL allows you to declare two or more variables that share the same data type using a single DECLARE statement.

-- For example, the following example declares two integer variables totalQty and stockCount, and sets their default
-- values to zero.
DECLARE totalQty, stockCount INT DEFAULT 0

-- As of MySQL 8.0.34, it is not possible to declare multiple variables with different data types using a single DECLARE
-- statement. 

-- below will give syntax error
DECLARE amount DECIMAL(4,2),
		currency CHAR(3) DEFAULT 'USD';
        
-- To fix the error, we need to use multiple DECLARE statements as follows:
DECLARE amount DECIMAL(4,2),
DECLARE currency CHAR(3) DEFAULT 'USD';

-- Assigning variables

-- To assign a variable a value, we use the SET statement:
DECLARE price FLOAT DEFAULT 0.0
SET price = 43.00;

-- In addition to the SET statement, we can use the SELECT INTO statement to assign the result of a query
-- to a variable as shown in the following example:
DECLARE price FLOAT DEFAULT;
SELECT products_price 
	   INTO price 
       FROM poducts;

-- Variable scopes
/* A variable has its own scrope, which determines its life time.
if we declare variable inside a stored procedure, it will be out of scope
when the END statement of stored procedure is reached.

When we declare are variable inside the BEGIN ... END, it goes out of scope
once the END is reached.

MySQL allows you to declare two or more variables that share the same name in 
different scopes because a variable is only effective within its scope.
However, its not good practice to declare var with same name

A var whose name begin with @ sign is a session variable and accessble until the session ends.
*/
SHOW SESSION VARIABLES;

-- MySQL Stored Procedure Variable Example
DROP PROCEDURE proc_get_orders;
DELIMITER %%
CREATE PROCEDURE proc_get_orders()
BEGIN
		DECLARE orderTotals INT DEFAULT 0;
		SELECT COUNT(*) INTO orderTotals FROM orders;
		SELECT orderTotals;
END %%
DELIMITER ;

/*
Local variables (declared with DECLARE)
Only inside a stored program — like a procedure, function, or trigger.

User-defined variables (start with @)
You can use these anywhere, even directly in the MySQL client or Workbench — outside of procedures.
SET @price = 43.00;
SELECT @price;


System variables
These control MySQL’s configuration, not your data logic.
SHOW VARIABLES LIKE 'max_connections';
SET GLOBAL max_connections = 300;


-- Local
DECLARE total INT DEFAULT 10;

-- User (session)
SET @username = 'Afzaal';

-- System session
SET SESSION sql_mode = 'ANSI';

-- System global
SET GLOBAL max_connections = 200;

-- Procedure parameter
CREATE PROCEDURE GetProduct(IN pid INT)
BEGIN
    SELECT * FROM products WHERE productCode = pid;
END;



1. Local Variable
Defined inside a procedure → exists only inside that procedure.
		DECLARE total INT DEFAULT 10;
		SET total = total + 5;
Used only inside BEGIN...END of a procedure or function.

2. User / Session Variable
Defined with @ → belongs to your current connection.
		SET @username = 'Afzaal';
		SELECT @username;
✅ Works outside or inside procedures.
❌ Vanishes when you disconnec

3. System Session Variable
Controls MySQL behavior, but only for your session.
	SET SESSION sql_mode = 'ANSI';
✅ Affects only your connection, not others.

4. System Global Variable
	Same as above, but affects the whole server.
    SET GLOBAL max_connections = 200;
✅ Applies to all users/sessions.
❌ Resets on restart (unless set in config).

5. Procedure Parameter
Passed into a procedure — acts like a temporary local variable.
		CREATE PROCEDURE GetProduct(IN pid INT)
		BEGIN
		  SELECT * FROM products WHERE productCode = pid;
		END;
✅ Exists only while the procedure runs.
✅ Used to pass data in or out of a procedure.

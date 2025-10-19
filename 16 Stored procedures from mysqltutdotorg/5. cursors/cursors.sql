-- syntax to follow use Cursor
/*
1. DECLARE cursor_name CURSOR FOR select_statement;
2. OPEN cursor_name;
3. DECLARE CONTINUE HANDLER FOR NOT FOUND // TERMINATION statement
4. FETCH cursor_name INTO variable list;
5. CLOSE cursor_name;

*/

DROP PROCEDURE getCursorData;
DELIMITER $$
CREATE PROCEDURE getCursorData()
BEGIN
		DECLARE finished INT DEFAULT 0;
        DECLARE emails_list VARCHAR(500) DEFAULT '';
        DECLARE user_email VARCHAR(500) DEFAULT '';
        
		DECLARE user_data CURSOR FOR SELECT email FROM employees LIMIT 5;
        
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
        
        OPEN user_data;
        
        get_user_email: LOOP
        FETCH user_data INTO user_email;
        IF finished = 1
        THEN
        LEAVE get_user_email;
        END IF;
        
        IF emails_list != ''
        THEN
        SET emails_list = CONCAT(emails_list,', ', user_email);
        ELSE
        SET emails_list = user_email;
        END IF;
        
        END LOOP get_user_email;
        
        CLOSE user_data;
        
        SELECT emails_list;
END $$
DELIMITER ;
CALL getCursorData();
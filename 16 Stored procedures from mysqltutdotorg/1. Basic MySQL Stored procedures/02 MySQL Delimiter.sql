-- DELIMITER delimiter_character
-- The delimiter_character may consist of a single character or multiple characters, such as // or $$. 
-- However, you should avoid using the backslash (\) because it’s the escape character in MySQL.

CALL CreatePersonTable();
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS CreatePersonTable()
BEGIN

-- creat
CREATE TABLE IF NOT EXISTS persons(
		person_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		full_name VARCHAR(50) NOT NULL,
		email VARCHAR(255) NOT NULL UNIQUE
);

-- insert
INSERT INTO persons (full_name, email)
VALUES 
('Ali Khan', 'ali.khan@gmail.com'),
('Sara Ahmed', 'sara.ahmed@yahoo.com'),
('Bilal Malik', 'bilal.malik@hotmail.com'),
('Hina Tariq', 'hina.tariq@gmail.com'),
('Usman Shah', 'usman.shah@outlook.com'),
('Ayesha Noor', 'ayesha.noor@gmail.com'),
('Hamza Raza', 'hamza.raza@yahoo.com'),
('Fatima Zafar', 'fatima.zafar@gmail.com'),
('Ahmad Iqbal', 'ahmad.iqbal@hotmail.com'),
('Zainab Ali', 'zainab.ali@gmail.com'),
('Noman Asif', 'noman.asif@yahoo.com'),
('M. Afzaal', 'afzaal@gmail.com'),
('Imran Qureshi', 'imran.qureshi@gmail.com'),
('Sadia Malik', 'sadia.malik@outlook.com'),
('Omar Javed', 'omar.javed@gmail.com'),
('Nida Farooq', 'nida.farooq@yahoo.com'),
('Kashif Rehman', 'kashif.rehman@gmail.com'),
('Laiba Yousuf', 'laiba.yousuf@gmail.com'),
('Rizwan Haider', 'rizwan.haider@hotmail.com'),
('Maria Akhtar', 'maria.akhtar@gmail.com');
END //
DELIMITER ;






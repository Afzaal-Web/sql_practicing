CREATE DATABASE users;

USE users;

CREATE TABLE employee(
id INT auto_increment PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Email VARCHAR(150) unique NOT NULL,
Age INT,
Ceated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employee (Name, Email, Age)
VALUES
('Sara Ahmed', 'sara@example.com', 30),
('Usman Malik', 'usman@example.com', 28),
('Fatima Noor', 'fatima@example.com', 22);
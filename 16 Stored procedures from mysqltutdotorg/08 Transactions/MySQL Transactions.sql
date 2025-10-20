-- Introduction to MySQL transactions
/*
START TRANSACTION, COMMIT

A transaction is a sequence of one or more SQL statements that are executed as a single unit of work.

-- START TRANSACTION – Mark the beginning of a transaction. Note that the BEGIN or  BEGIN WORK are the aliases of the START TRANSACTION.
-- COMMIT – Apply the changes of a transaction to the database.
-- ROLLBACK – Undo the changes of a transaction by reverting the database to the state before the transaction starts.
*/

CREATE DATABASE banks;

USE banks;

CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

SELECT @@autocommit;

SHOW VARIABLES LIKE 'autocommit';

-- 2) MySQL COMMIT example

START TRANSACTION;
INSERT INTO users (id, username) 
VALUES (1, 'john');

UPDATE users 
SET email = 'john.doe@example.com' 
WHERE id = 1;
COMMIT;

-- 3) MySQL ROLLBACK example
START TRANSACTION;

INSERT INTO users (id, username) 
VALUES (2, 'jane');

UPDATE users 
SET email = 'jane.doe@example.com' 
WHERE id = 2;

ROLLBACK;

-- Using MySQL transactions in Stored Procedures

-- 1) Setting up sample tables

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT  PRIMARY KEY ,
    account_holder VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO accounts (account_holder, balance) 
VALUES ('John Doe', 1000.00),
       ('Jane Doe', 500.00);
       
	
DROP PROCEDURE IF EXISTS transfer;
DELIMITER $$
CREATE PROCEDURE transfer(
	sender_id INT,
    receiver_id INT,
    amount DECIMAL(10,2)
)
BEGIN
		DECLARE rollback_message VARCHAR(255) DEFAULT 'Transaction rolled back: Insufficient funds';
        DECLARE commit_message VARCHAR(255) DEFAULT 'Transaction committed successfully';
        
        START TRANSACTION;
        
        -- Attempt to debit money from account 1
        UPDATE accounts SET balance = balance - amount WHERE account_id = sender_id;
        
        -- Attempt to credit money to account 2
		UPDATE accounts SET balance = balance + amount WHERE account_id = receiver_id;
        
        IF (SELECT balance FROM accounts WHERE account_id = sender_id) < 0 AND amount > (SELECT balance FROM accounts WHERE account_id = sender_id)
        THEN
        ROLLBACK;
		
        ELSE
        -- Log the transactions if there are sufficient funds
        INSERT INTO transactions (account_id, amount, transaction_type) VALUES (sender_id, -amount, 'WITHDRAWAL');
        INSERT INTO transactions (account_id, amount, transaction_type) VALUES (receiver_id, amount, 'DEPOSIT');
        
           -- Commit the transaction
        COMMIT;
        SELECT commit_message AS 'Result';
        
        END IF;

END $$
DELIMITER ;






DELIMITER $$

CREATE PROCEDURE transfer(
    IN sender_id INT,
    IN receiver_id INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    DECLARE sender_balance DECIMAL(10,2);
    DECLARE rollback_message VARCHAR(255) DEFAULT 'Transaction rolled back: Insufficient funds';
    DECLARE commit_message VARCHAR(255) DEFAULT 'Transaction committed successfully';

    START TRANSACTION;

    -- Get current sender balance
    SELECT balance INTO sender_balance
    FROM accounts
    WHERE account_id = sender_id
    FOR UPDATE; -- Locks the row to prevent race conditions

    -- Check if sender has enough funds
    IF sender_balance < amount THEN
        ROLLBACK;
        SELECT rollback_message AS Result;
    ELSE
        -- Deduct from sender
        UPDATE accounts
        SET balance = balance - amount
        WHERE account_id = sender_id;

        -- Add to receiver
        UPDATE accounts
        SET balance = balance + amount
        WHERE account_id = receiver_id;

        -- Record both transactions
        INSERT INTO transactions (account_id, amount, transaction_type)
        VALUES (sender_id, -amount, 'WITHDRAWAL');

        INSERT INTO transactions (account_id, amount, transaction_type)
        VALUES (receiver_id, amount, 'DEPOSIT');

        COMMIT;
        SELECT commit_message AS Result;
    END IF;

END $$

DELIMITER ;




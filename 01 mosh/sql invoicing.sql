DROP DATABASE IF EXISTS `sql_invoicing`;
CREATE DATABASE `sql_invoicing`; 
USE `sql_invoicing`;

SET NAMES utf8mb4;
SET character_set_client = utf8mb4;

CREATE TABLE `payment_methods` (
  `payment_method_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `payment_methods` VALUES 
(1,'Credit Card'),
(2,'Cash'),
(3,'PayPal'),
(4,'Wire Transfer');

CREATE TABLE `clients` (
  `client_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `phone` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoices` (
  `invoice_id` INT NOT NULL,
  `number` VARCHAR(50) NOT NULL,
  `client_id` INT NOT NULL,
  `invoice_total` DECIMAL(9,2) NOT NULL,
  `payment_total` DECIMAL(9,2) NOT NULL DEFAULT '0.00',
  `invoice_date` DATE NOT NULL,
  `due_date` DATE NOT NULL,
  `payment_date` DATE DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `FK_client_id` (`client_id`),
  CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `payments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `amount` DECIMAL(9,2) NOT NULL,
  `payment_method` TINYINT NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_client_id_idx` (`client_id`),
  KEY `fk_invoice_id_idx` (`invoice_id`),
  KEY `fk_payment_payment_method_idx` (`payment_method`),
  CONSTRAINT `fk_payment_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (similar corrections apply to sql_store, sql_hr, sql_inventory databases)

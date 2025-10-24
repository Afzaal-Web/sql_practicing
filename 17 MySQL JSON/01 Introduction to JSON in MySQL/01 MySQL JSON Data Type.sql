-- What is JSON

/*
JSON stands for “JavaScript Object Notation”. JSON is a lightweight data-interchange format that is easy for humans to read and write
and simple for computers to parse and generate.

JSON is built on two data structures: objects and arrays.

-- Objects
An object is an unordered collection of key-value pairs enclosed in curly braces {}. Each key is a string, followed by a colon (:),\
 and then the associated value. For example:
 {
    "name": "John Doe",
    "age": 22
}  

Note that you must enclose the key in a JSON document with double quotes (").

-- Arrays
An array is an ordered list of values closed in square brackets []. An array may contain values of any valid JSON data type, 
including objects and other arrays. For example:

["John Doe", 22]
In this example, we have a JSON array of two values that represent the name and age of a person.

JSON supports several data types, including:
String: “JSON”
Number: 10, 12.25
Boolean: true and false.
Null: null

MySQL validates the JSON documents stored in the JSON column and issues an error if they are invalid.
MySQL stores the JSON documents in a binary format optimized for quick searches.

column_name JSON


*/


CREATE TABLE products(
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   price DECIMAL(10,2) NOT NULL,
   properties JSON
);

-- INSERTING JSON data

INSERT INTO products (name, price, properties)
VALUES ('T-SHIRT', '23.00', 
'{
"size": ["S","M","L","XL"],
"colors": ["white","black"]
}');

-- When the statement executes, MySQL performs the following steps:
-- First, validate the JSON document for validity.
-- Second, convert the JSON string into binary format and store it in the JSON column.

-- Querying JSON data from the table.

SELECT name, properties
FROM products;

SELECT name, JSON_PRETTY(properties)
FROM products;

-- Getting the keys of a JSON document

SELECT JSON_KEYS(properties)
FROM products;

-- Extracting data from a JSON document

-- Use the dollar sign ($) to represent the current document
-- Use a key or array index to specify the exact location.

--  $.colors[0]

SELECT JSON_EXTRACT(properties, "$.size[0]")
FROM products;

SELECT JSON_EXTRACT(properties, "$.size")
FROM products;

/*
MySQL supports native JSON data types starting in version 5.7.8.
MySQL stores JSON in a binary format optimized for quick searches.
Use the JSON_PRETTY() function to format the JSON documents.
Use the JSON_KEY() function to get all keys of a JSON document.
Use the JSON_EXTRACT() function to extract data from a JSON document.
*/


INSERT INTO products (name, price, properties)
VALUES ('laptop', '77000', 
'{
"Component": 
[
{"type": "processor", "color": "white"}, 
{"type": "RAM", "size": "8gb"}
]
}');




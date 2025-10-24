-- MySQL JSON_EXTRACT() Function
-- Introduction to the MySQL JSON_EXTRACT() function

-- The JSON_EXTRACT() function allows you to extract data from a JSON document based on the specified JSON paths.
-- syntax 
JSON_EXTRACT(json_doc, path);

-- The JSON_EXTRACT() function returns the values that match the paths.
-- If multiple paths match, it returns an array that wraps the matched values.

SELECT 
    JSON_EXTRACT('{"name":"afzaal","age": 30,"designation":"sql developer"}',
            '$.name');

-- 2) Extracting array elements
SELECT 
    JSON_EXTRACT('{"name":["ali","ahmad","abdullah"],
              "age": [23,43,23],
              "designation":["sql","react","javascript"]}',
            '$.name[2]',
            '$.age[2]',
            '$.designation[2]') data;

SELECT JSON_EXTRACT('[10, 20, 30]', '$[1]') result;
  
-- 3) Extracting nested values
-- The following example uses the JSON_EXTRACT() function to extract nested
-- values by specifying multiple levels of keys in the path:

SELECT 
    JSON_EXTRACT('{"person": {"name": "Jane", "age": 25}}',
            '$.person.name');
        
-- 4) Handling non-existent paths
SELECT 
    JSON_EXTRACT('{"name": "John", "age": 28}',
            '$.address.city') DATA;


-- 5) Using the MySQL JSON_EXTRACT() function with table data

CREATE TABLE product_prices(
id INT PRIMARY KEY AUTO_INCREMENT,
data json
);

INSERT INTO product_prices
(data)
SELECT
		JSON_OBJECT(
        'productName', productName, 
        'buyPrice', buyPrice, 
        'msrp', msrp
        )
FROM products;

SELECT * FROM product_prices;

SELECT
		JSON_EXTRACT
        (
			data,
            '$.productName',
			'$.buyPrice',
            '$.msrp'
        ) data
        FROM product_prices;
        
-- The -> operator

-- The -> operator is a shorthand for the JSON_EXTRACT() function
-- when used with two arguments: a column identifier on the left and
-- a JSON path on the right:

-- column_name -> path

-- For example, we can extract the product name from the data column of
-- the product_prices table as follows:

SELECT
data -> '$.productName'
FROM product_prices;

-- To remove the quotes from the result, you use the JSON_UNQUOTE() function:

SELECT
		JSON_UNQUOTE(data -> '$.productName')
        FROM product_prices;

ALTER TABLE product_prices
RENAME COLUMN data_of_products TO data;

-- The ->> operator
-- The ->> operator is equivalent to either one of the following function calls:

-- JSON_UNQUOTE(column -> path)
-- JSON_UNQUOTE(JSON_EXTRACT(column, path))

SELECT
		data ->> '$.productName'
        FROM product_prices;










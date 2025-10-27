-- create table product_info

CREATE TABLE product_results(
	id INT AUTO_INCREMENT PRIMARY KEY,
    data JSON
);

-- id: This is an auto-increment primary key column.
-- data: This column has the data type of JSON that stores the JSON data.

-- create JSON data from the columns of the products table and insert it into the product_results table

INSERT INTO product_results(data)
SELECT 
		JSON_OBJECT
        (
			'buyPrice', buyPrice, 'MSRP', MSRP, 
            'quantityInStock', quantityInStock, 
            'productName', productName
        )
FROM
	products;
    
SELECT * FROM product_results;


SELECT
JSON_EXTRACT(data, '$.productName'),
JSON_EXTRACT(data, '$.buyPrice')
FROM product_results
WHERE JSON_UNQUOTE(JSON_EXTRACT(data, '$.productName')) = 'P-51-D Mustang';

EXPLAIN 
SELECT
data ->> '$.productName',
data ->> '$.buyPrice'
FROM product_results
WHERE
data ->> '$.productName' = 'P-51-D Mustang';

-- Indexing JSON data using functional indexes
-- A functional index is an index based on an expression rather than a column. The following statement adds an index to the product_results table:

ALTER TABLE 
  product_results
ADD
	INDEX idx_product_name (
	(
      CAST(
        data ->> '$.productName' AS CHAR(255)
      ) COLLATE utf8mb4_bin
    )
);

SELECT 
  data ->> '$.productName',
  data ->> '$.buyPrice'
FROM 
  product_results 
WHERE 
  data ->> '$.productName' = 'P-51-D Mustang';
  
EXPLAIN SELECT 
data ->> '$.productName',
data ->> '$.buyPrice'
FROM 
product_results 
WHERE 
data ->> '$.productName' = 'P-51-D Mustang';














-- Introduction to the MySQL JSON_ARRAY_APPEND() function

-- The JSON_ARRAY_APPEND() function adds an element to a JSON array in a JSON document.
JSON_ARRAY_APPEND(json_doc, path, value1, value2, ...)

-- 1) Adding elements to a JSON array

-- The following example uses the JSON_ARRAY_APPEND() function to add elements to a JSON array:

SELECT JSON_ARRAY_APPEND('[1,3,5]', '$', 7);

-- 2) Adding elements to nested a JSON array

SELECT 
  JSON_ARRAY_APPEND(
    '{ "colors": ["red", "green"], "fonts": ["serif"] }', 
    '$.colors', 'blue'
  ); 
  
-- 3) Adding an element to a JSON array in a table

CREATE TABLE decorations(
id INT PRIMARY KEY,
data JSON
);

INSERT INTO decorations
VALUES(1, '{ "colors": ["red", "green"], "fonts": ["serif"] }' );


SELECT * FROM decorations
WHERE id = 1;

UPDATE decorations
SET data = JSON_ARRAY_APPEND(data, '$.fonts', 'lexend deca');



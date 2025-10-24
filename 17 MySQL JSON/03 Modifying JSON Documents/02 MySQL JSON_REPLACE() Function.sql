-- Introduction to MySQL JSON_REPLACE() function

-- The JSON_REPLACE() function replaces existing values in a JSON document and returns the updated document.

-- syntax
-- JSON_REPLACE(json_doc, path, value, path, value)

SELECT *
FROM contacts;

SELECT JSON_REPLACE(data, '$[0]', 'afzaal')
FROM contacts;

UPDATE contacts
SET data = JSON_REPLACE(data, '$[0]', 'afzaal')
WHERE employeeNumber = 1002;


-- MySQL JSON_REPLACE() function examples
-- 1) Replacing an existing value

SELECT 
  JSON_REPLACE(
    '{"name": "Jane Doe", "age": 22}', '$.name', 
    'Jane Smith'
  ) result;


-- 2) Updating nested objects
SELECT 
  JSON_REPLACE(
    '{"person": {"name": "John", "address": {"city": "New York"}}}', 
    '$.person.address.city', 'lahore'
    ) AS rep;
    
    
-- 3) Handling non-existing path example

-- If you attempt to replace a value at a path that doesn’t exist in the JSON document,
-- the JSON_REPLACE() function will simply leave the document unchanged. For example:

SELECT 
  JSON_REPLACE(
    '{"name": "John", "age": 22}', '$.city', 
    'London'
  ) result;


-- 4) Replacing with multiple path/value pairs

SELECT 
		JSON_REPLACE
        (
			'{"name": "Jane Doe", "age": 25, "city": "New York"}',
            '$.name', 'afzaal', '$.age', 30, '$.city', 'lahore'
        ) AS Data;
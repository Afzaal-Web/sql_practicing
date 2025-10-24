-- Introduction to MySQL JSON_INSERT() function
-- The JSON_INSERT() function allows you to add one or more elements to a JSON document.

-- syntax
-- JSON_INSERT(json_doc, path, value[, path, value] ...)

-- json_doc: This is the JSON document you want to insert data into.
-- path: The JSON path that specifies the position in the json_doc where you want to insert the new value.
-- value: The value you want to insert.

-- Note that you can insert multiple values at the positions specified by paths in a single function call.
-- The JSON_INSERT() function processes the path/value pair one by one, starting from the left.
-- It evaluates the first pair and uses the updated JSON document for evaluating the next pair till
-- to the last pair.

-- If the path exists in the JSON document, the function ignores and doesn’t replace the current
-- value in the JSON document.

-- If the path doesn’t exist in the JSON document, the JSON_INSERT() function will:
		-- Add the key/value to an object if the member is not present in an existing object.
        -- Extend an array with a new value if the path specifies an element after the last element
        -- of an existing array. If the existing value is not an array,
        -- the function wraps it as an array and then extends it with a new value.
        
-- MySQL JSON_INSERT() function examples

-- 1) Inserting a new value into an existing object

-- The following example uses the JSON_INSERT() function to insert a new key/value pair into an object
-- in a JSON document:


SELECT
		JSON_INSERT
        (
        '{"name": "John", "age": 30}',
        '$.salary',
        45
        )  AS updated_json;
        
SELECT
		JSON_INSERT
        (
        '{"name": "John", "age": 30}',
        '$.job',
        'MySql Developer'
        )  AS updated_json;
        
-- 2) Inserting into nested objects

-- The following example uses the JSON_INSERT() 
-- function to insert values into nested objects within a JSON document:

SELECT
		JSON_INSERT
        (
			'{"person": {"name": "Alice", "address": {"city": "Los Angeles"}}}',
            '$.person.address.zip', '90001'       
        ) AS updated_json;
        
-- 3) Inserting into arrays

SELECT
		JSON_INSERT
        (
			'{"skills":["MySQL","PHP","JavaScript"]}',
            '$.skills[3]', 'React'      
        ) AS updated_json;
        
-- 4) Inserting multiple values
SELECT 
  JSON_INSERT(
    '{"name": "John", "age": 25}',
    '$.city', 'lahore', '$.country', 'pakistan'
    ) AS updatedJson;
    
    
SELECT *
FROM contacts;

SELECT JSON_REPLACE(data, '$[0]', 'afzaal')
FROM contacts;

UPDATE contacts
SET data = JSON_REPLACE(data, '$[3]', '413-432-3344')
WHERE employeeNumber = 1002;










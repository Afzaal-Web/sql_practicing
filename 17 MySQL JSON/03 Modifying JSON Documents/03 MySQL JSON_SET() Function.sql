-- Introduction to MySQL JSON_SET() function

-- The JSON_SET() function allows you to replace existing values or add non-existing values to a JSON document.

JSON_SET(json_doc, path, value[, path, val] ...)

-- The JSON_SET() function returns the updated JSON document. It returns NULL if any argument is NULL.


-- 1) Replacing an existing value

SELECT
	JSON_SET(
    '{"name": "Jane Doe", "age": 22}', '$.name', 
    'Jane Smith'
    )
    
    
-- 2) Replacing values in nested objects

SELECT 
  JSON_SET(
    '{"person": {"name": "John", "address": {"city": "New York"}}}', 
    '$.person.address.city', 
     'Los Angeles'
  ) result;
  
  -- 3) Adding a nonexisting value
 -- If you set a value at a path that doesn’t exist in the JSON document,
 -- the JSON_SET() function will add the element. For example: 
  SELECT 
  JSON_SET
  (
  '{"name": "afzaal", "age": 25}',
  '$.city',
  'lahore'
  ) data;
  
  -- 4) Replacing/adding multiple path/value pairs
  
  -- The following example uses the SET() function to both update an existing value and add a new value to a JSON document:
  
  
  SELECT 
  JSON_SET(
    '{"name": "Jane Doe", "age": 25, "city": "New York"}', 
    '$.name', 'afzaal',
    '$.country', 'pakistan',
    '$.age', 30    
    ) data;
  
  
  
  
  
  UPDATE contacts
SET data = JSON_SET(data, '$[1]', 'afzaal@gmail.com', '$[2]', '413-222-3333')
WHERE employeeNumber = 1002;
  
  
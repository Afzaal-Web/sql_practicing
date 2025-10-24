-- Introduction to the MySQL JSON_REMOVE() function
-- The JSON_REMOVE() function is used to remove elements from a JSON document.

-- syntax

-- JSON_REMOVE(json_doc, path)

SELECT *
FROM contacts;

SELECT JSON_REMOVE(data, '$[0]')
FROM contacts;

UPDATE contacts
SET data = JSON_REMOVE(data, '$[0]')
WHERE employeeNumber = 1002;

SELECT 
  JSON_REMOVE(
    '{"name": "John", "age": 30}', '$.age'
  ) result;
  
-- 2) Removing an element from a JSON array
SELECT 
  JSON_REMOVE(
    '["PHP","MySQL","JavaScript"]', 
    '$[1]'
  ) result;

-- 3) Handling non-existent paths

-- If the path doesn’t exist, the JSON_REMOVE() function does nothing
-- and returns the original JSON document:

SELECT 
  JSON_REMOVE(
    '{"name": "John", "age": 28}', 
    '$.job'
  ) result;
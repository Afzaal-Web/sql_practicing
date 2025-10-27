-- Introduction to MySQL JSON_STORAGE_FREE function
-- The JSON_STORAGE_FREE function is used to get the space (in bytes) of a JSON column that was freed in its binary presentation after
-- it was updated in place by the JSON_SET(), JSON_REPLACE(), or JSON_REMOVE() function.

-- syntax
JSON_STORAGE_FREE(json_val);

-- json_val is a valid JSON document or a string that can be a valid JSON document.

-- The JSON_STORAGE_FREE() function returns a positive, nonzero value if the JSON column that has been updated
-- takes up less space than it did before the update.

-- If the JSON column takes the same or more space than before it was updated, the JSON_STORAGE_FREE()
-- function will return 0.

-- If the json_val is NULL, the JSON_STORAGE_FREE() function returns NULL.

-- example

DROP TABLE IF EXISTS employee_results;

CREATE TABLE employee_results(
    id INT PRIMARY KEY,
    data JSON
);



INSERT INTO employee_results(id, data) 
SELECT 
  employeeNumber, 
  JSON_OBJECT(
    'firstName', firstName, 'lastName', lastName, 'email', email
  ) 
FROM 
  employees;
  
  SELECT * FROM employee_results;
  
  UPDATE 
  employee_results 
SET 
  data = JSON_SET(data, '$.lastName', 'Doe') 
WHERE 
  id = 1056;
  
  SELECT 
  JSON_STORAGE_FREE(data) 
FROM 
  employee_results 
WHERE 
  id = 1056;
  
-- The output shows that the space that was freed from the update is 6 bytes.
-- Introduction to MySQL JSON_STORAGE_SIZE() function

-- The JSON_STORAGE_SIZE() function returns the storage size in bytes of a JSON document. It can be useful for estimating the storage
-- requirements of JSON data.

JSON_STORAGE_SIZE(json_val);

-- json_val: This is the JSON value for which you want to get the storage size. The json_value must be a valid JSON document or a string that can
-- be parsed as a valid JSON document.

-- Examples

-- 1) Using the MySQL JSON_STORAGE_SIZE() function with a JSON object

SELECT 
  JSON_STORAGE_SIZE(
    '{"name":"John","age":30,"city":"New York"}'
  ) size;
  
-- 2) Using the JSON_STORAGE_SIZE() function with an array

SELECT 
  JSON_STORAGE_SIZE('[1, 2, 3]') size;
  
  SELECT 
  employeeNumber,
  data, 
  JSON_STORAGE_SIZE(data) size 
FROM contacts;

SELECT 
  SUM(JSON_STORAGE_SIZE(data)) AS total_json_size
FROM contacts;

SELECT 
  employeeNumber,
  JSON_STORAGE_SIZE(data) AS size,
  (SELECT SUM(JSON_STORAGE_SIZE(data)) FROM contacts) AS total_json_size
FROM contacts;


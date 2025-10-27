-- Introduction to MySQL JSON_UNQUOTE() function

-- The JSON_UNQUOTE() function allows you to remove double quotes from a JSON string. Here’s the syntax of the JSON_UNQUOTE() function:

JSON_UNQUOTE(json_val);
-- json_val: The JSON string from which you want to remove the quotes.

-- The JSON_UNQUOTE() function returns a raw value without surrounding quotes. The function returns NULL if the json_val is NULL.

-- If the json_val starts and ends with double quotes but is not a valid JSON string literal, the JSON_UNQUOTE() function will raise an error.

-- MySQL JSON_UNQUOTE() function example

SELECT 
  details -> "$.name" name
FROM 
  persons;
  
SELECT 
  JSON_EXTRACT(details, '$.name') name
FROM 
  persons;
  

SELECT 
 JSON_UNQUOTE(JSON_EXTRACT(details, '$.name')) name
FROM 
  persons;
  
  SELECT 
  details ->> "$.name" name
FROM 
  persons;
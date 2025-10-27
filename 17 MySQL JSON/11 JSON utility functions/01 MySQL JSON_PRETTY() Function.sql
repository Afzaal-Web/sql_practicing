-- Introduction to MySQL JSON_PRETTY() function
-- The JSON_PRETTY() function is used to format JSON data for better readability. It makes the output of JSON data more human-friendly by adding indentation, newlines, and proper formatting.

JSON_PRETTY(json_val);

-- json_val: This is the JSON value that you want to pretty-print. It can be a valid JSON value or a string representation of a JSON value.

-- 1) Formatting a scalar value

SELECT JSON_PRETTY('1');

-- 2) Using MySQL JSON_PRETTY() function to pretty-print an array

SELECT 
  JSON_PRETTY('["apple","orange","banana"]') result;
  
-- 3) Using MySQL JSON_PRETTY() function to pretty-print an object

SELECT 
  JSON_PRETTY('{"name": "John", "age": 22, "job": "MySQL DBA"}') result


-- 4) Pretty-printing a complex JSON document
SELECT 
  JSON_PRETTY(
    '{"name": "John", "age": 22, "job": "MySQL DBA", "skills": ["Linux","SQL"]}'
  ) result;
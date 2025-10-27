-- Introduction to MySQL JSON_LENGTH() function

-- The JSON_LENGTH() function returns the length of a JSON document. Here’s the syntax of the JSON_LENGTH() function:

JSON_LENGTH(json_doc, path, path);

-- path: This is an optional argument. If you provide the path, the JSON_LENGTH()
-- function will return the length of the value within the json_doc located by the path.

-- The JSON_LENGTH() function returns NULL if any argument is NULL or the path does not identify any value in the JSON document.

-- The JSON_LENGTH() function raises an error if the json_doc is not a valid JSON document or the path is not a valid path expression.

-- The JSON_LENGTH calculates the length of a JSON document as follows:
			-- A scalar has a length of 1.
            -- An array has a length of the number of array elements.
            -- An object has the length of the number of object members.

-- Example
-- 1) Getting the length of a scalar

SELECT
		JSON_LENGTH('"HELLO"') length;
        
-- 2) Getting the length of an array
SELECT 
  JSON_LENGTH('[1, 2, 3]') length;
  
-- 3) Getting the length of an object
SELECT
	  JSON_LENGTH('{"name": "John", "age": 22}') AS length;


-- 4) Getting the length of an object that has a nested array
-- The following example uses the JSON_LENGTH() function to return the number of members in an object that has a property which is an array.
-- It doesn’t count the length of the nested array.
SELECT
		JSON_LENGTH(
        '{"name": "John", "age": 22, "skills":["PHP","MySQL","JavaScript"]}'
        );

-- 5) Getting the length of a value specified by a path
SELECT 
  JSON_LENGTH(
    '{"name": "John", "age": 22, "skills":["PHP","MySQL"]}',
    '$.skills'
  ) length;
      
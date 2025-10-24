-- Introduction to MySQL MEMBER OF operator

-- The MEMBER OF operator returns true (1) if a value is an element of a JSON array or false (0) otherwise.

-- syntax
value MEMBER OF (json_array)

-- value: This is the value that can be a scalar or a JSON document.
-- json_array: This is the JSON array of which you want to check if the value is an element.

-- The function returns NULL if the value or json_array is NULL

-- MySQL MEMBER OF operator examples

-- 1) Basic MEMBER OF operator examples

SELECT 
  4 MEMBER OF('[1,2,3]') result;
  
-- 2) Conversion of value
  
-- The MEMBER OF operator does not carry a conversion when checking. For example:

SELECT
'1' MEMBER OF ('[1,2,3]');

-- Notice that the MEMBER OF operator does not carry a type conversion for the string.

-- In this case, you can use the CAST to convert the string '1' to the number 1 when checking like this:

SELECT 
  CAST('1' AS UNSIGNED) MEMBER OF('[1,2,3]') result;
  
  -- 3) Checking a JSON document
  
SELECT
'{"name": "John"}' MEMBER OF
 (
    '[{ "name" : "John" }, { "name" : "Joe" }]'
  );
  -- It returns false because the function treats the '{"name": "John"}' as a string, not a JSON object:
  
  -- To do that, you need to convert the string to JSON before passing it to the MEMBER OF operator:
  
  SELECT
CAST('{"name": "John"}' AS JSON) MEMBER OF
 (
    '[{ "name" : "John" }, { "name" : "Joe" }]'
  ) 
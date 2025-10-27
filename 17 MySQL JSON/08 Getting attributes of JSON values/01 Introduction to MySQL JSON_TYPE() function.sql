-- The JSON_TYPE() function is used to return the data type of a JSON value.

-- JSON_TYPE(value);

-- value: This is the JSON value that you want to get the type, which can be an object, an array, or a scalar type (integer, boolean, null, etc).

-- The JSON_TYPE() function returns a string that represents the JSON type of the value.

-- Examples

SELECT
		JSON_TYPE('{"name": "John"}') AS type;

SELECT
		JSON_TYPE('["name", "John"]') AS type;
        
SELECT 
  JSON_TYPE('"Hello"') type;
  
SELECT 
  JSON_TYPE('1.0') type;
  
SELECT 
  JSON_TYPE('true') type;
  
SELECT 
  JSON_TYPE('null') type;
  

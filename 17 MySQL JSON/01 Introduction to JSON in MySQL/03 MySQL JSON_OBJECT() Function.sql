-- Introduction to MySQL JSON_OBJECT() function

-- The JSON_OBJECT() function allows you to create a JSON object from a list of key-value pairs.
-- syntax

-- JSON_OBJECT([key1, value1, key2, value2, ...])

-- key1, key2, …: A list of keys for the JSON object.
-- value1, value2, …: A list of corresponding values for the JSON object.

-- 1) Creating a simple JSON object

SELECT 
		JSON_OBJECT
        (
			"name","john",
			"age", 25
        ) AS result;

-- 2. Creating a nested JSON object
SELECT
		JSON_PRETTY(
		JSON_OBJECT
        (
			"name","john",
			"age", 25,
            "phone",
            JSON_OBJECT
            (
				"home","321-123-3333",
                "work","456-432-1122"
            )
        ) )AS resulut;
        
-- 3) Combining JSON_OBJECT() with JSON_ARRAY() function

SELECT 
       JSON_ARRAY
       (
		JSON_OBJECT("name","john","age", 25),
        JSON_OBJECT("name","john","age", 25)
       ) AS result;
	
-- 04 Creating JSON objects dynamically

SELECT 
		JSON_OBJECT(firstName, email) AS empData
FROM employees;


-- JSON_OBJECT() in MySQL requires pairs of key and value arguments.
SELECT 
  JSON_OBJECT(
    'firstName', firstName, 'email'
  ) result 
FROM 
  employees;
-- That’s three arguments — an odd number.



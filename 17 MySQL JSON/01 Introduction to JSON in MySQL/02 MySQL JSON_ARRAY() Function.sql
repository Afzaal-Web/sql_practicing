-- Introduction to the MySQL JSON_ARRAY function
-- A JSON array is an ordered list of values enclosed in square brackets. For example:
["afzaal", 23, "lahore", "developer"]

-- In MySQL, the JSON_ARRAY() function is used to create a JSON array from a list of values.
-- syntax

JSON_ARRAY(val1, val2, ...)
-- The JSON_ARRAY() function returns a JSON array from the input values.
-- The JSON_ARRAY() function is useful when you need to generate
-- JSON arrays from existing data in your database.

-- Example
-- Create a JSON array

SELECT 
JSON_ARRAY("afzaal", 23, "lahore", "developer");

SELECT 
JSON_ARRAY(firstName, email, jobTitle)
FROM
	employees
WHERE
employeeNumber IN (1002,1056);

SELECT 
JSON_PRETTY(
JSON_ARRAY(firstName, email, jobTitle)
)
FROM
	employees
WHERE
employeeNumber IN (1002,1056);

-- Storing JSON arrays into a table
CREATE TABLE contacts(
employeeNumber INT PRIMARY KEY,
data JSON
);

INSERT INTO contacts(employeeNumber, data)
SELECT
	  employeeNumber,
      JSON_ARRAY(firstName, extension, email)
FROM
employees;





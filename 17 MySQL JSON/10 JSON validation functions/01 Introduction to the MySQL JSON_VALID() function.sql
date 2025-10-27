-- Introduction to the MySQL JSON_VALID() function

-- The JSON_VALID() function accepts a value and returns 1 if the value is a valid JSON document
-- or 0 otherwise.

JSON_VALID(value);

-- Examples
SELECT JSON_VALID('{"name":"John Doe"}');

SELECT JSON_VALID("{'name':'John Doe'}");

-- Introduction to the MySQL JSON_QUOTE() function

-- The JSON_QUOTE() function is used to quote a string as a JSON value by wrapping it with double quote
-- characters and escaping interior quotes and other characters.

-- SYNTAX

JSON_QUOTE(string);

-- The function returns a valid JSON value of the input string. It’ll return NUL if the string is NULL.

-- In practice, you often use the JSON_QUOTE() function to make a valid JSON string literal for inclusion in a JSON document.

-- examples
SELECT JSON_QUOTE('hello');
-- 2) Quoting a string as a JSON array

SELECT JSON_QUOTE('[1,2,3]');
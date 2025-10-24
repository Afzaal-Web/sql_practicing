-- Introduction to MySQL JSON_VALUE() function
-- The JSON_VALUE() function allows you to extract a value at a path in a JSON document and
-- optionally convert the value to a desired type.

-- syntax
-- JSON_VALUE(json_doc, path [return type] [on empty] [on error]);

-- The JSON_VALUE() function has the following parameters and optional clauses:
-- json_doc: This is the JSON document from which you want to extract the value.
-- path: This is the JSON path expression that specifies the value within the
-- json_doc that you want to extract.
-- RETURNING type: This clause allows you to convert the extracted value to a desired
-- type including float, double, decimal, signed, unsigned, date, datetime, year, char, and json.

-- If you omit the RETURNING type clause, the function returns a value with the type of VARCHAR(512).

-- on_empty
-- on_empty clause determines how the function behaves when the path does not locate any data. The on_empty clause accepts one of the following values:
		-- NULL ON EMPTY: The function returns NULL.
        -- DEFAULT value ON EMPTY: The function returns the value.
        -- ERROR ON EMPTY: The function raises an error.
        
-- on_error
-- on_error clause determines the outcome when an error occurs. It takes one of the following values:
		-- NULL ON ERROR: The function returns NULL.
        -- DEFAULT value on ERROR: The function returns the value
        -- ERROR ON ERROR: The function throws an error.
        
-- MySQL JSON_VALUE() function examples

-- 1) Extracting a string value

SELECT
	  JSON_VALUE
      (
		'{"name": "John Doe","age": 22, "date_of_birth":"1990-12-15"}',
        '$.name'
      ) AS data;
      
-- 2) Extracting a number
-- The following example uses the JSON_VALUE() function to extract a value and
-- convert it to a value of the UNSIGNED type:

SELECT 
  JSON_VALUE(
    '{"name": "John Doe","age": 22, "date_of_birth":"1990-12-15"}', 
    "$.age" RETURNING UNSIGNED
  ) age;

-- 3) Extracting a date
-- The following example uses the JSON_VALUE() function to extract a value and
-- convert it to a DATE value:

	SELECT
		  JSON_VALUE
          (
			 '{"name": "John Doe","age": 22, "date_of_birth":"1990-12-15"}',
             "$.date_of_birth" RETURNING DATE
          )


-- Complete explanation — JSON_VALUE() in MySQL

-- Basic syntax
JSON_VALUE(
json_doc, path
[RETURNING sql_type]
[ { NULL | ERROR | DEFAULT value } ON EMPTY ]
 [ { NULL | ERROR | DEFAULT value } ON ERROR ])
 
 -- RETURNING — optional: specify SQL return type (e.g. CHAR(50), SIGNED, DECIMAL(10,2), etc.).
 -- If omitted MySQL defaults to VARCHAR(512).
 -- ON EMPTY / ON ERROR — control what happens if the path finds nothing or if an error occurs
 -- (defaults to NULL).
 
 -- Extract a simple string scalar:
 SELECT JSON_VALUE('{"name":"Alice","age":30}', '$.name') AS name;

-- Extract a number and return it as SQL integer:
SELECT JSON_VALUE('{"age":30}', '$.age' RETURNING VARCHAR(10)) AS age;

SELECT VERSION();

SELECT JSON_VALUE('{"age":30}', '$.age' RETURNING CHAR(10)) AS age;

-- Category		Supported Types
-- Character		CHAR(n)
-- Numeric			SIGNED, UNSIGNED, DECIMAL(p,s)
-- Temporal		DATE, TIME, DATETIME, YEAR
-- Boolean			BOOL

SET @invalid = 'not-a-json';
SELECT JSON_VALUE(@invalid, '$.city'
  DEFAULT 'Missing key' ON EMPTY
  DEFAULT 'Bad JSON' ON ERROR
) AS result;

SET @invalid = '{"name":"afzaa"}';
SELECT JSON_VALUE(@invalid, '$.city'
  DEFAULT 'Missing key' ON EMPTY
  DEFAULT 'Bad JSON' ON ERROR
) AS result;



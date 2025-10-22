-- Introduction to MySQL JSON_OVERLAPS() function

-- The JSON_OVERLAPS() function compares two JSON documents and returns true (1)
-- if the two documents share any key-value pairs or array elements or false (0) otherwise.

-- SYNTAX

-- JSON_OVERLAPS(json_doc_1, json_doc_2

-- In this syntax, json_doc1 and json_doc2 are the JSON documents you want to compare.
-- If both arguments are scalars, the function performs a simple equality test
-- If either argument is NULL, the function returns NULL.
-- This JSON_OVERLAPS() function complements the JSON_CONTAINS() function,
-- which necessitates the presence of all search elements in the target array.
-- The JSON_CONTAINS() function acts as an AND operation on search keys,
-- while JSON_OVERLAPS() functions as an OR operation.

-- MySQL JSON_OVERLAPS() function examples

-- 1) Using MySQL JSON_OVERLAPS() function with arrays

-- The following example uses the JSON_OVERLAPS() to check if two arrays share at least one element:

SELECT 
		JSON_OVERLAPS
        (
			'[1,2,3,4,5]','[2,9]'
		) AS result;
        
SELECT 
  JSON_OVERLAPS("[1,2,3]", "[4,5]") result;
  
  SELECT JSON_OVERLAPS('[1, 2, 3]', '["2", "4"]') AS result;

-- 2) Using JSON_OVERLAPS() function with objects

SELECT
		JSON_OVERLAPS
        (
			'{"name": "afzaal", "age": 25, "job": "sql developer"}','{"name": "afzaal", "City": "lhr"}'
		) AS result;
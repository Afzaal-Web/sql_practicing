-- Introduction to MySQL JSON_CONTAINS_PATH() function

-- The JSON_CONTAINS_PATH function is used to check whether a JSON document contains specific paths.

-- syntax

/*
JSON_CONTAINS_PATH(json_doc, one_or_all, path[, path] ....)
*/

-- json_doc: This is the JSON document you want to search for the paths.
-- one_or_all: 
-- A keyword that specifies whether you want to find at least one or all of the specified paths.
-- If it is 'one', the function returns 1 if the JSON document contains at least one, 0 otherwise
--  If the parameter is 'all', the function returns 1 if the document contains all the specified paths and 0 otherwise.
-- path: This is one or more path expressions you want to check within the JSON document.

-- Examples

-- 1) Checking for the Existence of a Single Path

-- The following example uses the JSON_CONTAINS_PATH() function to 
-- check if the JSON document contains the path $.a:

SELECT
		JSON_CONTAINS_PATH(
        '{"a": 1, "b": 2, "c": {"d": 4}}',
        'one', '$.a'
        );
        
-- 2) Checking for Multiple Paths with ‘one’ Mode

-- The following example uses the JSON_CONTAINS_PATH function to check if the JSON document contains 
-- at least one of two specified paths, $.a and $.e

SELECT 
  JSON_CONTAINS_PATH(
    '{"a": 1, "b": 2, "c": {"d": 4}}', 
    'one', '$.a', '$.e'
  ) result;

-- 3) Checking for Multiple Paths with ‘all’ Mode

SELECT 
  JSON_CONTAINS_PATH(
    '{"a": 1, "b": 2, "c": {"d": 4}}', 
    'all', '$.a', '$.e'
  ) result;
  

-- 4) Nested paths
-- The following example uses the JSON_CONTAINS_PATH() function to check
-- if the JSON document contains the nested path $.c.d:

SELECT 
		JSON_CONTAINS_PATH(
        '{"a": 1, "b": 2, "c": {"d": 4}}', 
        'one', '$.c.d'
        ) AS result;
        
-- 5) Non-Existent Path example

-- The following example uses the JSON_CONTAINS_PATH()
-- function to check if the JSON document contains the path $.a.d.

SELECT
		JSON_CONTAINS_PATH(
        '{"a": 1, "b": 2, "c": {"d": 4}}', 
        'ONE', '$.a.d'
        ) RESULT


















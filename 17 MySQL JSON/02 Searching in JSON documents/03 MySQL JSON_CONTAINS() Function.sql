-- We will learn how to use the MySQL JSON_CONTAINS() function to check whether a JSON document contains another JSON document.

-- Introduction to MySQL JSON_CONTAINS() function
-- The JSON_CONTAINS() function checks whether a JSON document (target) contains another JSON document (candidate) at a path.
-- syntax
-- JSON_CONTAINS(target, candidate[,path])

-- target: The JSON document you want to search in
-- candidate: The JSON value you’re checking for
-- path: The JSON path inside target where you want to check

-- The JSON_CONTAINS() function returns 1 if the target JSON document contains the candidate JSON document or 0 otherwise.

-- The JSON_CONTAINS() function returns NULL if any argument is NULL or if the path argument does not identify a section of the target document.

-- The function issues an error in the following cases:
		-- The target or candidate is not a valid JSON document.
        -- The path argument is not a valid path expression.
        -- The path contains a * or ** wildcard.
        
-- MySQL JSON_CONTAINS() function examples

-- 1) Checking for Scalar Values

SELECT
	   JSON_CONTAINS
       (
       '{"a": 1, "b": 2, "c": {"d": 4}}',
       '1', '$.a'
        ) AS result;
        
    SELECT JSON_CONTAINS('[1, 2, 3]', '1') AS result;
    
-- 2) Checking for object elements
-- The following example uses the JSON_CONTAINS() function to check if a candidate JSON object {"d": 4}
-- is contained within the target JSON document at the path $.c:

SELECT
		JSON_CONTAINS
        (
		'{"a": 1, "b": 2, "c": {"d": 4}}', 
        '{"d":4}', '$.c'
        ) result;
        
-- 3) Checking for array elements
SELECT
	  JSON_CONTAINS
      (
      '{"number": [1,2,3,4,5], "fruits": {"summer": "Mango", "winter": "Orange"}}',
      '[3,4]','$.number'
      ) AS result;

SELECT
	  JSON_CONTAINS
      (
      '{"number": [1,2,3,4,5], "fruits": {"summer": "Mango", "winter": "Orange"}}',
      '{"summer": "Mango"}','$.fruits'
      ) AS result;
      


        
        
        
        
        
        
        




-- Introduction to MySQL JSON_DEPTH() function

-- The JSON_DEPTH() function returns the depth of a JSON document.
-- It calculates the maximum depth of nested objects or arrays in the
-- JSON data.

-- JSON_DEPTH(json_doc);

-- The function returns an integer that represents the maximum depth of the JSON document.
-- It returns NULL if the json_doc is NULL. If the json_doc is not a valid JSON document,
-- the function will raise an error.

-- The JSON_DEPTH() function follows specific rules to calculate the depth of a JSON document:
   -- An empty array, empty object, or scalar value has depth 1.
   -- A nonempty array containing only elements of depth 1 or a nonempty object containing only
   -- member values of depth 1 has depth 2
   -- Otherwise, a JSON document has a depth greater than 2.

-- In practice, you use the JSON_DEPTH() function to analyze the structure of complex JSON
-- documents.

-- 1) Empty JSON object
SELECT 
  JSON_DEPTH('{}') AS depth;
  
-- 2) Nonempty JSON array with depth 1 elements
SELECT 
  JSON_DEPTH('[1, "apple", true]') AS depth;
  
  -- 3) Complex JSON Object
  
SELECT 
JSON_DEPTH(
'{"name": "John", "address": {"street": "123 Main St", "city": "New York"}, "hobbies": ["reading", "swimming"]}'
) AS depth;

-- Example 1 – Empty Object
SELECT JSON_DEPTH('{}') AS depth;
-- An empty object {} has a depth of 1.

-- Example 2 – Array of Scalars
SELECT JSON_DEPTH('[1, "apple", true]') AS depth;
-- The array [...] is at level 1, and its elements (numbers, strings, booleans)
-- are scalars with depth 1.
-- So: 1 (array) + 1 (scalars) = 2.

-- Example 3 – Nested Object
SELECT 
  JSON_DEPTH(
    '{"name": "John", 
      "address": {"street": "123 Main St", "city": "New York"}, 
      "hobbies": ["reading", "swimming"]
    }'
  ) AS depth;

-- Why 3?
-- Level 1: Outer object { ... }
-- Level 2: Inside it → "address" (an object) and "hobbies" (an array)
-- Level 3: Inside "address" → "street", "city" (scalars); inside "hobbies" → "reading", "swimming" (scalars)



SELECT 
		JSON_DEPTH('{"A":{"B":{"C":["a"]}}}')




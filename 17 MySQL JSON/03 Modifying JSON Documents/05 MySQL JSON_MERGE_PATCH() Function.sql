-- It combines two or more JSON documents into one,
-- following special merge rules (based on RFC 7396)

-- Think of it like:
-- Take the first JSON and apply changes from the second one

-- syntax
JSON_MERGE_PATCH(json_doc1, json_doc2)

-- You can merge two or more JSONs.
-- It returns one final merged JSON.
-- It will remove duplicates and merge keys properly.

-- If any JSON is invalid → ❌ MySQL gives an error.

-- The 3 Main Rules
		-- First JSON is not an object: MySQL treats it like {} (an empty object).
        -- Second JSON is not an object: MySQL just returns the second one as the result.
        -- Both are objects: MySQL merges them key by key using special rules.
        
-- Merge Rules (when both are objects)
		-- Key is only in first: Keep it
        -- Key is only in second and value ≠ null: Add it
        -- Key is in both, and second’s value ≠ null: Replace old value with new one
        -- Key is in both, and second’s value = null: Remove it
        
-- Example 1 — First JSON is not an object
SELECT JSON_MERGE_PATCH('[1,2]', '{"name": "John Doe"}');

-- MySQL treats [1,2] like {} and merges:

-- Example 2 — Second JSON is not an object
SELECT JSON_MERGE_PATCH('{"name": "John Doe"}', '[1,2]');
-- Returns second JSON as-is:

-- Example 3 — Both are objects
SELECT JSON_MERGE_PATCH('{"name": "John Doe"}', '{"age": 22}');
-- Adds both keys together:

-- Example 4 — Null in first JSON
SELECT JSON_MERGE_PATCH(
'{"name": "Afzaal", "age":null}',
'{"age": 22}'
);
-- Replaces the null with 22:

-- Example 5 — Remove a key (using null)
SELECT JSON_MERGE_PATCH
(
'{"name": "John Doe", "age": 22}',
'{"age": null}'
);
-- Removes "age" completely:

-- Example 6 — Nested (Recursive) merge

SELECT 
JSON_MERGE_PATCH
(
'{"person":{"name":"john smith"}}',
'{"person":{"age":22}}'
);
-- Deep merge — it combines inside "person" object:




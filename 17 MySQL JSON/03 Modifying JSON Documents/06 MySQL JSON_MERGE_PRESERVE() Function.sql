-- Introduction to MySQL JSON_MERGE_PRESERVE() function

-- What It Does
-- JSON_MERGE_PRESERVE() in MySQL combines (merges) two or more JSON documents
-- without deleting or replacing anything. It keeps all values — even duplicates — by turning them into arrays.

-- Syntax
JSON_MERGE_PRESERVE(json1, json2 [, json3, ...])

-- You can merge 2 or more JSON documents.
-- If any value isn’t valid JSON → ❌ error.
-- If any value is NULL → result is NULL

-- Examples
-- Merging Arrays
SELECT JSON_MERGE_PRESERVE('[1, 2]', '[3, 4]');
-- Arrays are simply combined.

-- Merging Objects
SELECT JSON_MERGE_PRESERVE('{"name":"John"}', '{"age":25}');
-- Different keys just combine normally.

-- Merging Scalars (simple values)
SELECT JSON_MERGE_PRESERVE('1', 'true');
-- Since they’re not arrays or objects, MySQL puts them in an array.

-- Merging an Array + Object
SELECT JSON_MERGE_PRESERVE('["Jane","John"]', '{"name":"Alice"}');
-- MySQL puts the object inside the array.

-- Merging Objects with the Same Keys
SELECT JSON_MERGE_PRESERVE(
  '{"name": "Jane Doe", "age": 24}',
  '{"name": "Jane Smith", "age": 25}'
);
-- When both JSONs have the same key, MySQL keeps both values in an array.


-- In One Line:
-- JSON_MERGE_PRESERVE() = Combine JSONs without losing anything (duplicates become arrays).
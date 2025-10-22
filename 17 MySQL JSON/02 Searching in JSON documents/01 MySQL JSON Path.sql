-- What is JSON path?
/*

JSON path is a way to specify and navigate through the elements in a JSON document. 
It serves as a roadmap to locate specific pieces of data within a JSON structure.

-- MySQL JSON path syntax elements
The following outlines the key elements of JSON path syntax:

Scope ($): The scope represents the JSON document, which serves as its root.

Path Legs: A path may consist of one or more path legs. 
There are three types of path legs:
				Member: Using a period (.) followed by a key name or asterisk (*).
                The member is used to access a member of an object.
                
                Array Location: Using square brackets ([]) to access array elements
                by their indexes (N) or using an asterisk to access all elements in an array.
                
                Double Asterisk (**): This is a special token that represents a recursive search
                for all paths within the JSON document.
                
Key names: Key names are enclosed in double quotes or can be valid ECMAScript identifiers, specifying
the names of keys in a JSON object.

*/
-- MySQL JSON path examples

-- 1) Accessing a specific key in an object
-- Suppose you have a JSON document that represents information about a person:
-- {
--    "name": "John",
--    "age": 25,
--    "job": "MySQL Developer"
-- }
-- To access the age key, you can use the following path expression:
-- "$.age"

SELECT 
	JSON_EXTRACT(
    '{"name":"john","age":25,"job":"mysql develper"}',
    "$.age"
    ) AS Age;


-- 2) Accessing all members in an object
-- The following path accesses all members of the object:
-- "$.*"

SELECT 
	JSON_EXTRACT(
    '{"name":"john","age":25,"job":"mysql develper"}',
    "$.*"
    ) AS jsondata;

-- 3) Accessing an array element by its index

-- Suppose you have the following JSON array:
-- ["PHP", "MySQL", "JavaScript"]
-- To access the second element of the array, you use the path expression:

-- '$[1]'

SELECT 
		JSON_EXTRACT(
        '["PHP","MySQL","JavaScript"]',
        '$[1]'
        ) course;
        
-- 4) Accessing all elements in an array
-- '$[*]'



-- 5) Combining path legs

-- Suppose you have the following JSON document:

{
  "name": "John",
  "age": 25,
  "job": "MySQL Developer",
  "skills": [
    "PHP",
    "MySQL",
    "JavaScript"
  ]
}
  
  SELECT 
  JSON_EXTRACT(
    '{"name":"John","age":25,"job":"MySQL Developer","skills":["PHP","MySQL","JavaScript"]}', 
    "$.skills[*]"
  ) result;
  






























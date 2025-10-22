-- Introduction to MySQL JSON_SEARCH() function

-- The JSON_SEARCH() function is used to find a path for a given string within a JSON document.

-- syntax
-- JSON_SEARCH(json_document, one_or_all, search_str [, escape_char])

-- json_document: This is the JSON document in which you want to search.
/* one_or_all: The argument that specifies whether to find the first occurrence or all occurrences.
If one_or_all is ‘one’, the function stops the search after the first match and returns one path
string. If the one_or_all argument is ‘all’, then the function returns an array that contains all
the matching paths. */

/*search_str: This is the string or pattern you want to search for within the JSON document. 
With the search_str argument, you can use the % and _ wildcard characters.
The % matches any number of characters and _ matches exactly one character. */

/*escape_char: To use the wildcard characters (% and _ ) as the literal string within the search_str,
you preceded it with an escape character (escape_char). The default escape_char is \ if you omit it
or if it is NULL. Otherwise, escape_char must be a constant that is empty or one character.*/

-- MySQL JSON_SEARCH() function examples

-- 1) Searching for the first occurrence
-- The following example uses the JSON_SEARCH() function to search for the first occurrence of a path
-- that matches the string "John" in a JSON document:

SELECT
		JSON_SEARCH
        (
			'{"name": "afzaal", "age": 25, "city": "laahore"}', 
            'all', '25'
        ) AS path;

SELECT 
  JSON_SEARCH(
    '{"name": "John", "age": 25, "username": "John"}', 
    'one', 
    'John'
  ) path;
  
-- 3) Searching with the wildcard %
/*
The following example uses the JSON_SEARCH() function to search for all occurrences of a path that
matches the string "john" and is followed by any number of characters in a JSON document:
*/

SELECT 
  JSON_SEARCH(
    '{"name": "john", "age": 25, "email": "john@test.com"}', 
    'all', 
    'john%'
  ) path;
  

-- 4) Searching with the wildcard _
-- The following example uses the JSON_SEARCH() function to search for all occurrences of a
-- path that matches any single character followed by the string "oe" in a JSON document:

SELECT 
  JSON_SEARCH(
    '[{"name": "Joe", "age": 25, "salary":"100_000"},
      {"name": "Doe", "age": 27, "salary":"120_000"}]', 
    'all', 
    '_oe'
  ) path;

-- 5) Searching using an escape character
-- Suppose we have the following JSON document:

{"code": "S_100", "name":"Sx100"}
-- To search for the path that matches the string "S_100", you may come up with the following statement:
SELECT 
  JSON_SEARCH(
    '{"code": "S_100", "name":"Sx100"}', 
    "all", "S_100"
  ) path;
  
-- But the search string "S_100" matches both strings "S_100" and "Sx100" because the _ character in
-- the search string S_100 is a wildcard character that matches both literal character _ in "S_100" and
-- x in "Sx100"

-- To treat the character _ as a literal string in the search string "S_100", you need to escape it
-- by preceding it with the default escape character (\) like this:

SELECT 
		JSON_SEARCH
        (
			 '{"code": "S_100", "name":"Sx100"}',
             "all", "S\_100"
        ) AS path;

-- If you don’t want to use the default escape character, you can specify one using the
-- escape_char argument. For example:

SELECT 
		JSON_SEARCH
        (
			 '{"code": "S_100", "name":"Sx100"}',
             "all", "S#_100", "#"
        ) AS path;


























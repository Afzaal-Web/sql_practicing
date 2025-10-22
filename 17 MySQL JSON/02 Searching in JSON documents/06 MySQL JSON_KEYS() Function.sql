-- Introduction to MySQL JSON_KEYS() function

-- The JSON_KEYS() function is used to retrieve the keys or property names from a JSON object within a JSON document.

-- Here’s the syntax of the JSON_KEYS() function:
-- JSON_KEYS(json_doc, [path])

-- json_doc: This is the JSON object from which you want to extract the property name.
-- path (optional): This is the path that specifies an object within a document that you want to extract the keys.

-- The JSON_KEYS() function returns a JSON array that contains property names of the json_doc object or the JSON
-- object specified by the path.

-- The JSON_KEYS() function returns NULL if the json_doc is null or json_doc is not a valid JSON object or
-- the path does not locate an object within the json_doc.

-- The JSON_KEYS() function issues an error if the json_doc is not a valid JSON document,
-- the path is not valid or contains wildcards (*) or (**).

-- MySQL JSON_KEYS() function examples
-- Let’s take some examples of using the JSON_KEYS() function:

-- 1) Basic JSON_KEYS() function usage
/*
{
    "name": "John",
    "age": 25,
    "job": "MySQL Developer"
}
*/

SELECT 
		JSON_KEYS
        (
			'{"name":"afzaal", "age":25, "job": "mysql developer"}'
        ) AS properties;
        
-- 2) Using the JSON_KEYS() function with a path

/*
{
    "book": {
        "title": "The Great Gatsby",
        "author": {
            "name": "F. Scott Fitzgerald",
            "birth_year": 1896
        }
    }
}
*/

SELECT
		JSON_KEYS
        (
		'{
			"book": {
						"title": "The Great Gatsby",
						"author": {
									"name": "F. Scott Fitzgerald",
									"birth_year": 1896
								 }
					}
		}', '$.book.author'
        ) AS properties;
        
	









-- MySQL JSON_OBJECTAGG() Function

-- Introduction to MySQL JSON_OBJECTAGG() function

/*
The JSON_OBJECTAGG() function aggregates key-value pairs from columns
into a JSON object. Here’s the syntax of the JSON_OBJECTAGG() function:
*/

JSON_OBJECTAGG(key, value)

-- The JSON_OBJECTAGG() function takes two column names as arguments:
-- The first being used as the key and the second as the value.

-- The JSON_OBJECTAGG() function returns a JSON object containing key-value
-- pairs. It returns NULL if the result has no rows or in case of an error.

-- The error occurs when any key name is NULL or the number of arguments is
-- not equal to 2.

-- In practice, you often use the JSON_OBJECTAGG() function with the GROUP BY clause to aggregate data
-- into JSON objects for each group produced by the GROUP BY clause.

-- MySQL JSON_OBJECTAGG() function example

CREATE TABLE properties (
id INT,
attribute VARCHAR(255) NOT NULL,
value VARCHAR(255)
)

INSERT INTO properties(id, attribute, value) 
VALUES
    (1, 'color', 'red'),
    (1, 'size', 'medium'),
    (1, 'shape', 'circle'),
    (2, 'color', 'blue'),
    (2, 'size', 'large'),
    (3, 'color', 'green'),
    (3, 'shape', 'square');

SELECT * FROM properties;

-- aggregate data by the values in the id column using the JSON_OBJECTAGG() function:

SELECT
		id,
        json_objectagg(attribute,value) AS attribute_value
FROM
	properties
GROUP BY
		id;












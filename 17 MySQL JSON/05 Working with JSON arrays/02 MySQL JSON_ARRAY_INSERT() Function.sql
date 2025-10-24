-- Introduction to MySQL JSON_ARRAY_INSERT() function

-- The JSON_ARRAY_INSERT() function is used to insert one or more elements into a specified position in a JSON array of a JSON document.

-- SYNTAX
JSON_ARRAY_INSERT(json_doc, path1, value1, path2, value2);

-- MySQL JSON_ARRAY_INSERT() function examples

-- 1) Inserting elements into a JSON array

SELECT JSON_ARRAY_INSERT('["red","green"]', '$[1]', 'blue');

CREATE TABLE styles(
    id INT AUTO_INCREMENT PRIMARY KEY,
    data JSON
);

INSERT INTO styles(data)
VALUES('{ "colors": ["red", "green"], "fonts": ["serif"] }');

SELECT id, JSON_PRETTY(data) FROM styles
WHERE id = 1;

UPDATE styles
SET data = JSON_ARRAY_INSERT(data, '$.colors[2]', 'blue')
WHERE id = 1;

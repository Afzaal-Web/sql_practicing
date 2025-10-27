-- Introduction to MySQL JSON_TABLE() function
-- The JSON_TABLE() function allows you to extract data from JSON documents and convert it into tabular data.

JSON_TABLE(json_doc, path COLUMN (column_list) AS alias);

-- json_doc: This is the JSON document that you want to extract data from.
-- path: The JSON path expression that specifies the location of the data in the json_doc document to be extracted.
-- COLUMNS(column_list): The COLUMNS clause specifies a list of columns of the resulting table.
-- AS alias: The table alias is required but the AS keyword is optional.

-- Examples
-- 01
SELECT * FROM
JSON_TABLE('{ "name" : "John", "age" : 22}', '$'
COLUMNS(
name VARCHAR(255) PATH '$.name',
age INT PATH '$.age'
)
) AS person;


-- 02
-- {
--   "id": 101,
--   "name": "John",
--   "age": 25
-- }

SELECT *
FROM JSON_TABLE(
'{"id": 101, "name": "John", "age": 25}',
'$'
COLUMNS(
id INT PATH '$.id',
name VARCHAR(100) PATH '$.name',
age INT PATH '$.age'
)
) t;

-- 03
SELECT *
FROM JSON_TABLE(
  '[{"id": 1, "name": "Alice"},
    {"id": 2, "name": "Bob"},
    {"id": 3, "name": "Charlie"}]',
  '$[*]'
  COLUMNS (
    id INT PATH '$.id',
    name VARCHAR(50) PATH '$.name'
  )
) AS people;

-- 04
SELECT *
FROM JSON_TABLE(
  '{"employee": {"id": 200, "info": {"name": "Emma", "dept": "HR"}}}',
  '$.employee'
  COLUMNS (
    emp_id INT PATH '$.id',
    emp_name VARCHAR(50) PATH '$.info.name',
    department VARCHAR(50) PATH '$.info.dept'
  )
) AS emp;


-- 05

INSERT INTO contacts 
SELECT
	employeeNumber,
	JSON_OBJECT(
    'firstName', firstName,
    'lastName', lastName
    )
    FROM employees;



SELECT c.employeeNumber, jason_table.*
FROM contacts c,
JSON_TABLE(
c.data, '$' COLUMNS(
first_name VARCHAR(50) PATH '$.firstName',
Last_name VARCHAR(50) PATH '$.lastName'
)) AS jason_table;












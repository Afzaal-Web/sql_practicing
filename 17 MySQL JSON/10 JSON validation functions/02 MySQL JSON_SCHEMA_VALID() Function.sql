-- Introduction to MySQL JSON_SCHEMA_VALID() function
/*
A JSON schema is a document that describes the structure of JSON data. It defines the data types, constraints, and relationships between different parts of the JSON document.
In short, it serves as a blueprint for validating the structure of a JSON document.
In MySQL, the JSON_SCHEMA_VALID() function allows you to check if a given JSON document is valid against a specified JSON schema. It returns true (1)
if the JSON document is valid according to the schema and false (0) otherwise.
*/

-- Syntax
JSON_SCHEMA_VALID(json_schema, json_document)

-- json_schema: This is the JSON schema against which the document is validated.
-- json_document: This is the JSON document you want to validate.

-- examples
CREATE TABLE persons (
    id INT PRIMARY KEY AUTO_INCREMENT,
    details JSON
);

INSERT INTO persons (details) 
VALUES ('{"name": "John", "age": 30, "department": "HR"}'),
       ('{"name": "Alice", "age": 25, "department": "IT"}');
       
SET @employee_schema = '
{
"type": "object",
"properties" :{
"name": {"type": "string"},
"age": {"type": "integer"},
"department":{"type": "string"}
},
"required": ["name", "age", "department"]
}';



SELECT 
  id, 
  JSON_SCHEMA_VALID(@employee_schema, details) AS is_valid 
FROM 
  persons;

INSERT INTO persons (details) 
VALUES ('{"name": "Bob", "department": "Finance"}');





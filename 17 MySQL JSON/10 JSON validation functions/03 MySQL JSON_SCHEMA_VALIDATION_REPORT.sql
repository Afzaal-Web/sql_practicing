-- Introduction to MySQL JSON_SCHEMA_VALIDATION_REPORT() function
/*
The JSON_SCHEMA_VALIDATION_REPORT() function validates JSON documents against a specified JSON schema and provides a detailed report
on validation failures.
*/

JSON_SCHEMA_VALIDATION_REPORT(json_schema, json_document)

-- If the JSON document is valid based on the JSON Schema, the JSON_SCHEMA_VALIDATION_REPORT() function returns a JSON object with one property 
-- valid having the value true.

-- EXAMPLES

SET @employee_schema = '{
"type": "object",
"properties": {
"name":{"type":"string"},
"age":{"type":"integer"},
"department":{"type":"string"}
},
"required":["name","age","department"]
}';

SELECT 
  id, 
  JSON_SCHEMA_VALIDATION_REPORT(@employee_schema, details) AS is_valid 
FROM 
  persons;
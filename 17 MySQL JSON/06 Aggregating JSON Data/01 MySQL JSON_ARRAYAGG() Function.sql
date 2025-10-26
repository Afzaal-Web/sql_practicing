-- MySQL JSON_ARRAYAGG() Function
-- Introduction to MySQL JSON_ARRAYAGG() function

-- The JSON_ARRAYAGG() function is used to aggregate values into a JSON array.

-- syntax
JSON_ARRAYAGG(value);

-- value: This value can be an expression or a column whose values you want to aggregate into a JSON array.

-- The JSON_ARRAYAGG() function returns a JSON array whose elements consist of the values.
-- The order of elements in the resulting array is undefined.

-- f the column has no rows, the JSON_ARRAYAGG() function returns NULL. If the value is NULL,
-- the function returns an array that contains null elements.

-- In practice, you often use the JSON_ARRAYAGG() function with the GROUP BY clause to create
-- JSON arrays for each group of rows based on a column or a set of columns.


-- example
/*
The following query retrieves data from the customers and employees tables, and uses the CONCAT_WS()
and JSON_ARRAYAGG() functions to generate a result set that includes a list of sales employees and the
customer numbers associated with each of them.*/

SELECT
		CONCAT_WS(' ', firstName, lastName) AS salesEmployee,
        JSON_ARRAYAGG(customerNumber) AS customerNumber
FROM
		customers c
        INNER JOIN employees e
        ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY
		salesRepEmployeeNumber
ORDER BY
		salesEmployee;
        


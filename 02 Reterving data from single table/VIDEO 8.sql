SELECT *
FROM customers
WHERE last_name LIKE '%FIELD%';

SELECT *
FROM customers
WHERE last_name REGEXP 'FIELD';

SELECT *
FROM customers
WHERE last_name REGEXP '^FIELD'; -- ^ means must start with field

SELECT *
FROM customers
WHERE last_name REGEXP 'FIELD$'; -- ends with field

SELECT *
FROM customers
WHERE last_name REGEXP 'FIELD|MAC';

SELECT *
FROM customers
WHERE last_name REGEXP 'FIELD|MAC|ROSE'; -- | mean OR

SELECT *
FROM customers
WHERE last_name REGEXP 'FIELD|^MAC|ROSE';

SELECT *
FROM customers
WHERE last_name REGEXP 'e';

SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e'; 
-- ge, ie, me the above will check this

SELECT *
FROM customers
WHERE last_name REGEXP 'e[lyt]'; 
-- el, ey, et the above will check this

SELECT *
FROM customers
WHERE last_name REGEXP 'e[a-h]'; 

SELECT *
FROM customers
WHERE last_name REGEXP 'a[a-hs]e'; 

-- ^ start with
-- $ end with
-- | logical OR
-- [abcdegfg] match any letters in string
-- [a-z] match character in range

-- EXERCISE

-- first name are ELKA or AMBUR
SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';

-- last name end with EY or ON

SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

-- last name start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';

-- last name contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'B[RU]';
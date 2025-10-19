SELECT *
FROM customers
WHERE points >= 1000 AND points <= 3000;

-- above is same as
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- EXERCISE

SELECT *
FROM customers
where birth_date BETWEEN '1990-01-01' AND '2000-01-01';

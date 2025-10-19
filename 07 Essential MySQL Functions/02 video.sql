SELECT LENGTH('ASDDDFGDFG');
SELECT UPPER('fsdgfdgfdgdf');
SELECT LOWER('ASDDDFGDFG');
SELECT LTRIM('   SDFD');
SELECT RTRIM('SDFD   ');
SELECT TRIM('   SDFD   ');
SELECT REGEXP_REPLACE('MUHAMMAD    AFZAAL', '\\s+', ' ') AS NAME;
SELECT LEFT('Kindergarten', 4);
SELECT RIGHT('Kindergarten', 6);
SELECT SUBSTRING('Kindergarten', 2,4);
SELECT LOCATE('G','Kindergarten');
SELECT LOCATE('g','Kindergarten');
SELECT LOCATE('garten','Kindergarten');
SELECT REPLACE('Kindergarten', 'garten', 'garden');

 -- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html




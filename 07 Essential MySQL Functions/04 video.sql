SELECT DATE_FORMAT(NOW(), '%y');
SELECT DATE_FORMAT(NOW(), '%Y');

SELECT DATE_FORMAT(NOW(), '%m %y');
SELECT DATE_FORMAT(NOW(), '%M %Y');
SELECT DATE_FORMAT(NOW(), '%M %d %Y');
SELECT DATE_FORMAT(NOW(), '%D %M %Y');

-- time

SELECT TIME_FORMAT(NOW(), '%H:%i:%s %p');

https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html
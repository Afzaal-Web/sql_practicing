CREATE USER bob@abc.com IDENTIFIED BY '1234';

DROP USER bob@abc.com;

DROP USER moon_app;

DROP USER john;

-- change password

SET PASSWORD FOR john = '12345'; -- for other user

SET PASSWORD = '12345'; -- for own
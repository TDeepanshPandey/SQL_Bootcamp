CREATE DATABASE dogs_db;
USE dogs_db;

CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
DESC dogs;

INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
SELECT * FROM dogs;

INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
SELECT * FROM dogs;

INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');
SELECT * FROM dogs;

INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
SELECT * FROM dogs;

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
SELECT * FROM people;

SELECT name, birthdate FROM people;
 
SELECT name, DAY(birthdate) FROM people;
 
SELECT name, birthdate, DAY(birthdate) FROM people;
 
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
 
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
 
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
 
SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;
 
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
 
SELECT name, birthdt, MONTH(birthdt) FROM people;
 
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
 
SELECT name, birthtime, HOUR(birthtime) FROM people;
 
SELECT name, birthtime, MINUTE(birthtime) FROM people;
 
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
 
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;

SELECT NOW();
SELECT CURDATE();
SELECT DAYOFWEEK(NOW());
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');
SELECT CONCAT(MONTHNAME(NOW()),' ',DAY(NOW()),' at ',CURTIME());

CREATE TABLE tweets (
    tweet varchar(140),
    username varchar(50),
    created TIMESTAMP DEFAULT NOW() PRIMARY KEY
);

DESC tweets;

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

INSERT INTO tweets (tweet, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (tweet, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;


DROP TABLE tweets;
DROP TABLE dogs;
DROP TABLE people;
DROP DATABASE dogs_db;
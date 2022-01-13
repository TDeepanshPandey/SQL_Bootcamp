/* Show Databases */
SHOW DATABASES;

/* Choose the database */
USE mysql;

/* Create a database */
CREATE DATABASE learn_it;

/* Show Databases */
SHOW DATABASES;

/* Delete Databases */
DROP DATABASE learn_it;


/* Show Databases */
SHOW DATABASES;


/* Create a database */
CREATE DATABASE practice;

/* Use created database */
USE practice;


/* Create Table */
CREATE TABLE first_table (
    name varchar(50),
    quantity int
);

/* Show Tables */
SHOW TABLES;

/* Show Tables */
DESC first_table;

/* Drop Tables */
DROP TABLE first_table;

/* Show Tables */
SHOW TABLES;

/* Create table people */
CREATE TABLE people (
    first_name varchar(20),
    last_name varchar(20),
    age int
);

/* Show Tables */
SHOW TABLES;

/* Insert values */
INSERT INTO people (first_name, last_name, age)
VALUES ('Tina','Belcher',13);

/* Selecting values */
SELECT * FROM people;

/* Insert values */
INSERT INTO people (first_name, last_name, age)
VALUES ('Bob','Belcher',42);

/* Selecting values */
SELECT * FROM people;

/* Insert values */
INSERT INTO people (first_name, last_name, age)
VALUES ('Linda','Belcher',45),
       ('Phillip','Frond',38),
       ('Calvin','Fischoeder',70);

/* Selecting values */
SELECT * FROM people;

DROP TABLE people;

/* Create table employees */ 
CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
);

DESC employees;
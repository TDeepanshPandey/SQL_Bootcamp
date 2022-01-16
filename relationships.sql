CREATE DATABASE customer_db;
USE customer_db;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );
    
# cross join
SELECT * FROM customers, orders;

# inner join 
SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;

# Joins Exercise 
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers(
    paper_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students (id)
);

DESC students;
DESC papers;

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;

SELECT * FROM papers;

SELECT first_name, title, grade FROM students, papers WHERE students.id = papers.student_id ORDER BY first_name DESC, grade DESC ;

SELECT first_name, title, grade FROM students LEFT JOIN papers ON students.id = papers.student_id;

SELECT first_name, CASE 
                    WHEN title IS NULL THEN 'Missing'
                    ELSE title
                    END AS title , IFNULL(grade,0) FROM students LEFT JOIN papers ON students.id = papers.student_id;

SELECT first_name, IFNULL(AVG(grade),0) FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY first_name;

SELECT first_name, IFNULL(AVG(grade),0) AS average, CASE 
                                            WHEN AVG(grade) > 75 THEN 'PASSING'
                                            ELSE 'FAILING' 
                                        END AS 'passing_status' FROM students LEFT JOIN papers ON students.id = papers.student_id
                                        GROUP  BY students.id 
ORDER  BY average DESC;

# Many to Many relationship 
CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

# Exercise Solution
SELECT title, rating FROM series JOIN reviews ON series.id = reviews.series_id ORDER BY title;

SELECT title, AVG(rating) FROM series JOIN reviews ON series.id = reviews.series_id GROUP BY title;

SELECT first_name, last_name, rating FROM reviewers JOIN reviews ON reviews.reviewer_id = reviewers.id;

SELECT title AS 'unreviewed_series' FROM series LEFT JOIN reviews ON series.id = reviews.series_id WHERE rating IS NULL;

SELECT genre, ROUND(AVG(rating),2) FROM series JOIN reviews ON series.id = reviews.series_id GROUP BY genre;

SELECT first_name, last_name, COUNT(*) AS 'Count', IFNULL(MIN(rating),0) AS 'MIN', IFNULL(MAX(rating),0) AS 'MAX', IFNULL(AVG(rating),0) AS 'AVG',
IF (COUNT(rating) > 0,  'ACTIVE', 'INACTIVE') AS 'STATUS'
FROM reviewers LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id GROUP BY reviewers.id;

SELECT title, rating, CONCAT(first_name,' ',last_name) FROM series 
INNER JOIN reviews ON series.id = reviews.series_id 
INNER JOIN reviewers on reviewers.id = reviews.reviewer_id
ORDER BY title;

DROP TABLE reviews;
DROP TABLE series;
DROP TABLE reviewers;
DROP TABLE orders;
DROP TABLE customers;
DROP DATABASE customer_db;

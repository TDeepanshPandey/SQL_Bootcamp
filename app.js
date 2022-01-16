var faker = require('faker');
console.log(faker.date.past);

var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});
/*
var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].time);
  console.log(results[0].date.toString());
  console.log(results[0].now.toString());
});

var person = {
    email: faker.internet.email(),
    created_at: faker.date.past()
};
 
var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
  if (err) throw err;
  console.log(result);
});

var data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}

var q = 'INSERT INTO users (email, created_at) VALUES ?';
 
connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});

var q = 'SELECT * FROM users ';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});
*/
/* Exercise */
var q = 'SELECT DATE_FORMAT(MIN(created_at),"%M %D %Y") AS earliest_date FROM users ';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].earliest_date);
});

var q = 'SELECT * FROM users WHERE created_at = (SELECT MAX(created_at) from users)';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  	console.log(results[0].email);
	console.log(results[0].created_at);
});

var q = 'SELECT * FROM users WHERE created_at = (SELECT MAX(created_at) from users)';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  	console.log(results[0].email);
	console.log(results[0].created_at);
});

var q = 'SELECT MONTHNAME(created_at) as month, COUNT(*) as count FROM users GROUP BY month';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  	console.log(results);
});

var q = 'SELECT COUNT(*) as yahoo_users FROM users WHERE email LIKE "%@yahoo.com"';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  	console.log(results[0]);
});

var q = "SELECT CASE WHEN email LIKE '%@gmail.com' THEN 'gmail' \
         WHEN email LIKE '%@yahoo.com' THEN 'yahoo' \
         WHEN email LIKE '%@hotmail.com' THEN 'hotmail' \
         ELSE 'other' \
       end      AS provider, \
       Count(*) AS total_users \
FROM   users \
GROUP  BY provider \
ORDER  BY total_users DESC"; 
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  	console.log(results);
});

var express = require('express');
 
var app = express();
 
app.get("/", function(req, res){
 res.send("HELLO FROM OUR WEB APP!");
});
 
app.listen(3000, function () {
 console.log('App listening on port 8080!');
});
# TABLE tags;
# TABLE photo_tags;
# TABLE follows;
# TABLE likes;
# TABLE comments;
# TABLE photos;
# TABLE users;

SELECT * FROM users ORDER BY created_at LIMIT 5;

SELECT DAYNAME(created_at) AS day, COUNT(*) as total FROM users GROUP BY day ORDER BY total DESC LIMIT 1;

SELECT username FROM photos RIGHT JOIN users ON photos.user_id = users.id WHERE photos.id IS NULL;

SELECT username, COUNT(*) AS total FROM likes INNER JOIN users ON likes.user_id = users.id GROUP BY photo_id ORDER BY total DESC LIMIT 1;

SELECT (SELECT Count(*) FROM   photos) / (SELECT Count(*) FROM   users) AS avg; 

SELECT tag_name, COUNT(photo_id) as total FROM photo_tags 
INNER JOIN tags ON  tags.id = photo_tags.tag_id 
GROUP BY tag_id ORDER BY total DESC LIMIT 5; 

SELECT username, 
       Count(*) AS num_likes 
FROM   users gi
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 

-- FOREIGN KEY
-- It is a column in table which points to another table's primary key

--EXAMPLE
-- users.id  ==> parent key i.e id is a primary key in users table
-- posts.user_id  ==> It is a foreign key which makes connection with users table.
-- every post u create must belong to an existing user.

SELECT id,name
FROM users;

SELECT id,user_id,title
FROM posts;
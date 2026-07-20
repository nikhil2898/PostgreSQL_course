------------------- INNER JOIN --------------------------
-- Inner join returns only matching rows from both tables

SELECT 
 u.name,
 p.title,
 p.status,
 p.views
FROM posts p
INNER JOIN users u
 ON p.user_id = u.id
WHERE p.status = 'published'
ORDER BY p.views DESC;


----------------------------------- LEFT JOIN ------------------------------
-- left join keeps all rows from left table
-- if the right table has matching data then postgres includes it
-- if it doesn't have matching data then it returns null

-- posts  ----> left table
-- comments ------> right table

-- because not every post is having comments
-- some have 100 but some have 0


SELECT 
 p.title AS post,
 c.body AS comment
FROM posts p
LEFT JOIN comments c
 ON p.id = c.post_id;



SELECT 
 p.title,
 c.body
FROM posts p
INNER JOIN comments c
 ON p.id = c.post_id;


SELECT 
 p.title AS post_title,
 p.status,
 p.views,
 u.name AS user_name,
 c.body AS comment
FROM posts p
INNER JOIN users u
 ON u.id = p.user_id
LEFT JOIN comments c
 ON c.post_id = p.id;

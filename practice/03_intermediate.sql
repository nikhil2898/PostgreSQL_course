INSERT INTO practice.posts(user_id,title,category,views,likes)
SELECT id,'Learning Postgres','Learning',900,587
FROM practice.users
WHERE name = 'Nikhil'
RETURNING 'post inserted successfully';

---- display each user's name and total posts

SELECT name,COUNT(*) AS total_posts
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY name;

----- display each user's total views
SELECT name,COALESCE(SUM(views),0) AS total_views
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY name
ORDER BY total_views DESC;

--- display each user's total likes
SELECT name,COALESCE(SUM(likes),0) AS total_likes
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY name
ORDER BY total_likes DESC;


--find users who are having 2 or more posts

SELECT name,COUNT(p.id) AS posts_number
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY name
HAVING COUNT(p.id) >= 2
ORDER BY posts_number DESC;


--- display category along with number of posts
SELECT category,COUNT(*) AS total_category_posts
FROM practice.posts AS p
GROUP By category
ORDER BY total_category_posts DESC;


-- find categories whose average likes are greater than 100

SELECT category,AVG(likes) AS average_likes
FROM practice.posts 
GROUP BY category
HAVING AVG(likes) > 100
ORDER BY average_likes DESC;

-- top5 users based on total views
-- using left join
SELECT name,COALESCE(SUM(views),0) AS total_views
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY name
ORDER BY total_views DESC
LIMIT 5;

-- using inner join
SELECT name,SUM(views) AS total_views
FROM practice.users AS u
INNER JOIN practice.posts as p
 ON p.user_id = u.id
GROUP BY name
ORDER BY total_views DESC
LIMIT 5

--- display users who haven't written any posts
SELECT name,COALESCE(COUNT(p.id),0) AS total_posts
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY name
HAVING COUNT(p.id) = 0;


-- display posts that have no comments
SELECT title,COALESCE(COUNT(c.id),0) AS total_comments
FROM practice.posts AS p
LEFT JOIN practice.comments AS c
 ON c.post_id = p.id
GROUP BY title
HAVING COUNT(c.id) = 0
ORDER BY title ASC;


-- display every post with it's author name
SELECT title AS post,name AS author_name 
FROM practice.posts AS p
INNER JOIN practice.users AS u
 ON u.id = p.user_id;



-- display every comment with comment, who commented && post title
SELECT comment,u.name AS commented,p.title AS post
FROM practice.posts AS p
LEFT JOIN practice.comments AS c
 ON c.post_id = p.id
LEFT JOIN practice.users AS u
 ON u.id = c.user_id
 

-- display the total comments on every post
SELECT p.title AS post,COALESCE(COUNT(c.id),0) AS total_comments
FROM practice.posts AS p
LEFT JOIN practice.comments AS c
 ON c.post_id = p.id
GROUP BY p.title
ORDER BY total_comments DESC;


-- find the post having highest number of comments
SELECT p.title AS post,COALESCE(COUNT(c.id),0) AS comments_number
FROM practice.posts AS p
LEFT JOIN practice.comments AS c
 ON c.post_id = p.id
GROUP BY p.id
ORDER BY comments_number DESC
LIMIT 1;


--- find users who have written posts in more than 1 category
SELECT u.name AS author,COALESCE(COUNT(p.category),0) AS category_number
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY u.name
HAVING COUNT(p.category) > 1
ORDER BY category_number DESC;


-- display total likes for every category
SELECT p.category,SUM(likes) AS total_likes
FROM practice.posts AS p
GROUP BY p.category
ORDER BY total_likes DESC;


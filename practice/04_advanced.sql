--- display user name, total posts, total likes, total views and result should be in descending order with views

SELECT u.name,COALESCE(COUNT(p.id),0) AS total_posts,SUM(p.likes) AS total_likes,SUM(p.views) AS total_views
FROM practice.posts AS p
LEFT JOIN practice.users AS u
 ON u.id = p.user_id
GROUP BY u.name
ORDER BY total_views DESC;


--- find users whose average likes are greater than 200

SELECT u.name,AVG(likes) AS average_likes
FROM practice.posts AS p
LEFT JOIN practice.users AS u
 ON u.id = p.user_id
GROUP BY u.name
HAVING AVG(likes) > 200
ORDER BY average_likes DESC;


-- find the top 3 categories by total views
SELECT category,SUM(views) AS total_views
FROM practice.posts AS p
GROUP BY category
ORDER BY total_views DESC
LIMIT 3;


--- Find the users who have atleast 2 posts && 1500 total views
SELECT u.name,COALESCE(COUNT(p.id),0) AS total_posts,SUM(p.views) AS total_views
FROM practice.posts AS p
LEFT JOIN practice.users AS u
 ON u.id = p.user_id
GROUP BY u.name
HAVING COUNT(p.id) >= 2 
 AND SUM(p.views) >= 1500;


-- Display users whose total likes exceed their total views.
SELECT u.name,SUM(p.likes) AS total_likes,SUM(p.views) AS total_views
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY u.name
HAVING SUM(p.views) < SUM(p.likes);


--- Display each country with total_users & total_posts
SELECT u.country,COUNT(u.id) AS total_users,COUNT(p.id) AS total_posts
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY u.country
ORDER BY total_posts DESC;


-- Display each category with total posts, average likes, maximum views

SELECT p.category,COALESCE(COUNT(p.id),0) AS total_posts,AVG(p.likes) AS average_likes,MAX(p.views) AS maximum_views
FROM practice.posts AS p
GROUP BY p.category
ORDER BY maximum_views DESC;


-- Find users who commented on their own posts.
SELECT u.name,p.title AS post,c.comment AS comment
FROM practice.posts AS p
LEFT JOIN practice.comments AS c
 ON c.post_id = p.id
LEFT JOIN practice.users AS u
 ON c.user_id = u.id
WHERE p.user_id = c.user_id;



--------------------------------------  NEW TYPE OF QUESTION ------------------------------------------
-- show most viewed post of every category
-- steps in solution
-- Finding max first and joining the table with common columns

SELECT p.category,p.title,p.views 
FROM practice.posts AS p
JOIN (
    SELECT category,MAX(views) AS max_views
    FROM practice.posts
    GROUP BY category
) AS m
ON p.category = m.category
 AND p.views = m.max_views;



-- display the least liked post of every category

SELECT p.category,p.title,p.likes
FROM practice.posts AS p
JOIN (
    SELECT category,MIN(likes) AS min_likes
    FROM practice.posts
    GROUP BY category
) AS m
 ON m.category = p.category
 AND m.min_likes = p.likes;


-- display users who have never commented
SELECT u.name AS user, COALESCE(COUNT(c.id),0) AS comments_number
FROM practice.users AS u
LEFT JOIN practice.comments AS c
 ON c.user_id = u.id
GROUP BY u.name
HAVING COUNT(c.id) = 0;


--Find the oldest user who has written at least one post.
SELECT u.name
FROM practice.users AS u
LEFT JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY u.name,u.create_at
HAVING COUNT(p.id) >= 1
ORDER BY u.create_at ASC
LIMIT 1;


-- Display the newest post of every user.
SELECT u.name,p.title,p.created_at 
FROM practice.posts AS p 
JOIN practice.users AS u
 ON p.user_id = u.id
JOIN (
    SELECT
     user_id,
     MAX(created_at) AS latest_post
    FROM practice.posts
    GROUP BY user_id
) AS latest
 ON latest.user_id = p.user_id
 AND p.created_at = latest.latest_post; 


-- Find the user with maximum total likes
SELECT u.name,SUM(p.likes) AS total_likes
FROM practice.users AS u
JOIN practice.posts AS p
 ON p.user_id = u.id
GROUP BY u.name
ORDER BY SUM(p.likes) DESC
LIMIT 1;
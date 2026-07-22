SELECT name
FROM practice.users
WHERE country = 'India';

SELECT title,views
FROM practice.posts
WHERE views >= 1000
ORDER BY views DESC;

SELECT title,likes
FROM practice.posts
ORDER BY likes DESC;

SELECT title,created_at
FROM practice.posts
ORDER BY created_at DESC
LIMIT 5;

SELECT name
FROM practice.users
WHERE name ILIKE '%a'
LIMIT 2;

SELECT title
FROM practice.posts
WHERE category = 'Nature'
 OR category = 'Trip';

SELECT title
FROM practice.posts
WHERE category IN ('Trip','Nature');

SELECT COUNT(*) FROM practice.users;

SELECT AVG(views) FROM practice.posts;

---- highest liked post
SELECT title,likes
FROM practice.posts
ORDER BY likes DESC
LIMIT 1;


------- least viewed post
SELECT title,views
FROM practice.posts
ORDER BY views ASC
LIMIT 1;
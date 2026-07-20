
-- groupby creates groups of rows
-- where -> filters normal rows before grouping
-- having -> filters groups after grouping


-- find authors who have written atleast 2 posts

SELECT
 u.name AS user_name,
 COUNT(p.id) AS total_posts,
 SUM(p.views) AS total_views
FROM users AS u
LEFT JOIN posts AS p
 ON p.user_id = u.id
GROUP BY u.id
HAVING COUNT(p.id) >= 2
ORDER BY total_posts DESC;
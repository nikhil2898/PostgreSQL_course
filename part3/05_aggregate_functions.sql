
-- calculate one result from many rows
-- COUNT() : number of rows
-- SUM()   : Total value
-- AVG()   : Average value
-- MIN()   : smallest value
-- MAX()   : highest value


-- SELECT 
--  COUNT(*) AS total_posts,
--  COUNT(*) FILTER (WHERE status='published') AS published_posts,
--  SUM(views) AS total_views,
--  MIN(views) AS lowest_views,
--  MAX(views) AS highest_views
-- FROM posts;


 
------------------------------ COUNT DISTINCT ------------------------
-- It is used when we need to count only unique rows.


-- Count how many unique posts are connected to each tag.

SELECT 
 t.name AS tag_name,
 COUNT(DISTINCT p.id) AS total_unique_posts
FROM tags AS t
LEFT JOIN post_tags AS pt
 ON t.id = pt.tag_id
LEFT JOIN posts AS p
 ON p.id = pt.post_id
GROUP BY t.id
ORDER BY total_unique_posts DESC;
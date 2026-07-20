
--- indexes helps postgres to find rows faster


SELECT 
  id,
  title,
  status
FROM posts
WHERE status = 'published';


-- idx_posts_status
-- idx   -> index
-- posts  -> table_name
-- status --> column name
CREATE INDEX IF NOT EXISTS idx_posts_status
ON posts(status);


SELECT
 title,
 status,
 views
FROM posts
WHERE status = 'published'
ORDER BY views DESC;

-- composite index
CREATE INDEX IF NOT EXISTS idx_posts_status_views
ON posts(status,views DESC);


SELECT 
 title,
 status,
 views
FROM posts
WHERE user_id = (
    SELECT id
    FROM users
    WHERE name = 'Nikhil'
);

-- foreign key relation
CREATE INDEX IF NOT EXISTS idx_posts_user_id
ON posts(user_id);

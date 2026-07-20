-- multiple sql statements runs as a same unit

--Examples
-- placing an order
-- reduce stock of that product
-- creating payments records
-- transfering money
-- creating user records with related profile data


BEGIN;

UPDATE posts
SET status = 'published'
WHERE title = 'Indexes for begineers'
  AND status = 'draft';

UPDATE posts
SET views = views + 100
WHERE title = 'Indexes for begineers';

COMMIT;
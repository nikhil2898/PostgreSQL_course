CREATE SCHEMA IF NOT EXISTS practice;

CREATE TABLE IF NOT EXISTS practice.users(
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name         TEXT NOT NULL,
    email        TEXT UNIQUE NOT NULL,
    country      TEXT NOT NULL,
    create_at    TIMESTAMP DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS practice.posts(
  id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id        UUID NOT NULL REFERENCES practice.users(id),
  title          TEXT NOT NULL,
  category       TEXT NOT NULL,
  views          INTEGER NOT NULL DEFAULT 0 CHECK(views >= 0),
  likes          INTEGER NOT NULL DEFAULT 0 CHECK(likes >= 0),
  created_at     TIMESTAMP DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS practice.comments(
  id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  post_id        UUID NOT NULL REFERENCES practice.posts(id),
  user_id        UUID NOT NULL REFERENCES practice.users(id),
  comment        TEXT,
  created_at     TIMESTAMP DEFAULT NOW()
);


INSERT INTO practice.users(name,email,country) 
 VALUES
  ('Nikhil','nikhil@gmail.com','India'),
  ('Disha','disha@gmail.com','India'),
  ('Navya','navya@gmail.com','India'),
  ('Siva','sivaramakrishna@gmail.com','India'),
  ('sai raju','sairaju@gmail.com','UK'),
  ('sai krishna','saikrishna@gmail.com','UK'),
  ('pavan','pavan@gmail.com','USA'),
  ('sashi','sashi@gmail.com','Germany');


INSERT INTO practice.posts(user_id,title,category,views,likes)
SELECT id,'Lovely Nature','Climate',890,470
FROM practice.users
WHERE name = 'Nikhil';


INSERT INTO practice.posts(user_id,title,category,views,likes)
SELECT id,'Trip completed','Trip',1000,899
FROM practice.users
WHERE name = 'Disha';

INSERT INTO practice.posts(user_id,title,category,views,likes)
SELECT id,'Had a funniest Trip with friends & colleques','Trip',885,349
FROM practice.users
WHERE name = 'Navya';

INSERT INTO practice.posts(user_id,title,category,views,likes)
SELECT id,'Exploring UK','Trip',75,34
FROM practice.users
WHERE name = 'sai raju';

INSERT INTO practice.posts(user_id,title,category,views,likes)
SELECT id,'Exploring beautiful sceneres in US','Nature',888,765
FROM practice.users
WHERE name = 'pavan';


INSERT INTO practice.comments(post_id,user_id,comment)
SELECT id,'610f3864-d778-4352-a3c0-b8d3bba6d71d','Beautiful'
FROM practice.posts
Where title = 'Exploring UK';


INSERT INTO practice.comments(post_id,user_id,comment)
SELECT id,'e0f90e38-29d9-4f61-995a-fa091f54fbb8','American Sceneres is Wonderful, great to watch..'
FROM practice.posts
Where title = 'Exploring beautiful sceneres in US';

INSERT INTO practice.comments(post_id,user_id,comment)
SELECT id,'effc3f46-f399-433a-9a63-13dcda469294','Indias sceneres is Better than Switzerland'
FROM practice.posts
Where title = 'Lovely Nature';

INSERT INTO practice.comments(post_id,user_id,comment)
SELECT id,'56e0efac-0d88-4201-a02c-1f561ae1ebcf','Looking Amazing'
FROM practice.posts
WHERE title = 'Lovely Nature';
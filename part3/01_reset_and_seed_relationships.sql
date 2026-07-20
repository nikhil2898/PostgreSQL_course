
CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE IF EXISTS posts_tags;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    id  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

-- one-to-many relation ship ==> 1 user -> multiple posts
CREATE TABLE posts (
    id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id   UUID NOT NULL REFERENCES users(id),
    title     TEXT NOT NULL,
    status    TEXT NOT NULL DEFAULT 'draft'
      CHECK(status IN ('draft','published')),
    views     INTEGER DEFAULT 0 NOT NULL 
      CHECK (views >= 0)
);

-- post has comments that to too many i.e one-to-many relationship of post with comments
CREATE TABLE comments (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id     UUID NOT NULL REFERENCES posts(id),
    body         TEXT NOT NULL
);

CREATE TABLE tags (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       TEXT NOT NULL UNIQUE
);

-- a post can contain multiple tags && a tag can use in multiple posts so it is many-many relationship
CREATE TABLE post_tags (
    post_id     UUID NOT NULL REFERENCES posts(id),
    tag_id      UUID NOT NULL REFERENCES tags(id),
    
    PRIMARY KEY(post_id,tag_id)   -- composite primary key
);



-- seeding data into tables

INSERT INTO users(name) VALUES ('Nikhil'),('Disha');


INSERT INTO posts(user_id,title,status,views)
SELECT id,'postgresql joins explained','published',100
FROM users
WHERE name = 'Nikhil';

INSERT INTO posts(user_id,title,status,views)
SELECT id,'Indexes for begineers','published',40
FROM users
WHERE name='Nikhil';

INSERT INTO posts(user_id,title,status,views)
SELECT id,'Backend APIs with postgresql','published',180
FROM users
WHERE name='Disha';



INSERT INTO comments (post_id,body)
SELECT id,'Very clear Explaination'
FROM posts
Where title='postgresql joins explained';


INSERT INTO comments(post_id,body)
SELECT id,'Please add more examples'
FROM posts
WHERE title = 'Backend APIs with postgresql';


INSERT INTO tags(name)
VALUES ('sql'),('backend');


INSERT INTO post_tags(post_id,tag_id)
SELECT p.id, t.id
FROM posts p, tags t
WHERE p.title = 'postgresql joins explained'
 AND t.name = 'sql';


INSERT INTO post_tags(post_id,tag_id)
SELECT p.id, t.id
FROM posts p, tags t
WHERE p.title = 'Indexes for begineers'
 AND t.name = 'sql';


INSERT INTO post_tags(post_id,tag_id)
SELECT p.id, t.id
FROM posts p, tags t
WHERE p.title = 'Backend APIs with postgresql'
 AND t.name = 'backend';


SELECT 'part 3 reduced database reset and sample data inserted successfully.' AS message;


SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM comments;
SELECT * FROM tags;
SELECT * FROM post_tags;
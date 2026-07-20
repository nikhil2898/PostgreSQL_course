-------------------- one-to-one relationship -----------------------

-- ex: A person has only one passport

-- CREATE TABLE user(
--     id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     name  TEXT NOT NULL
-- );

-- CREATE TABLE passport(
--     id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     user_id  UUID NOT NULL REFERENCES user(id) UNIQUE,
--     passport_number  TEXT NOT NULL UNIQUE
-- );



------------------------------- one-to-many relationship -------------------------

-- one parent row can have many child rows
-- one user can writes many posts
-- but one post will always belong to one user

-- users - parent table
-- posts - child table

--posts.user_id  --> user.id

--user.id is the original user id in users table
-- posts.user_id is the user id which is in users table we store it in posts table

-- CREATE TABLE User(
--     id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     name   VARCHAR(64) NOT NULL
-- );

-- CREATE TABLE Posts(
--     id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     title  TEXT NOT NULL,
--     user_id   UUID NOT NULL REFERENCES User(id),
--     views   INTEGER DEFAULT 0 CHECK(views >= 0) NOT NULL
-- );



--------------------------- Many-to-many relationship ---------------------------
-- Many records in table A can relates to Many records in table B
-- EX : one student can enroll in many courses && one course can enrolled by Many students
-- for many-to-many relationship we need a junction table


-- CREATE TABLE Students(
--     id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     name  VARCHAR(64) NOT NULL
-- );

-- CREATE TABLE courses(
--     id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     name    VARCHAR(256) NOT NULL
-- );

-- CREATE TABLE student_course(
--     student_id    UUID NOT NULL REFERENCES Students(id),
--     course_id     UUID NOT NULL REFERENCES courses(id),
--     PRIMAREY KEY (student_id,course_id)
-- );




-- EXAMPLE FOR MANY TO MANY RELATIONSHIP
-- EX : I need posts with tags name

SELECT 
 p.title,
 t.name
FROM posts p
INNER JOIN post_tags pt
 ON pt.post_id = p.id
INNER JOIN tags t
 ON pt.tag_id = t.id
ORDER BY t.name, p.title;
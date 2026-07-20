-- this is for learning purpose only don't use in production
DROP TABLE IF EXISTS basics.students;

CREATE TABLE basics.students (

     id SERIAL PRIMARY KEY,
     -- create an auto incrementing integer
     -- 1 -> 2 -> 3 and so on
     -- primary key simply means this col uniquely indentifies each row in table

     name TEXT NOT NULL,

     -- text is a string data
     -- not null means this col is required
     -- postgres is going to reject if this name value is not present

     email TEXT NOT NULL UNIQUE,
     -- unique means no two students is going to have same email 

     age INTEGER CHECK (age >= 18),

     created_at TIMESTAMP DEFAULT NOW()
     -- timestamp stores date and time format
     -- default means if you don't give any value it will take by default
);

-- insert some data into the table
INSERT INTO basics.students (name, email, age) 
VALUES 
 ('Nikhil','nikhilsai@gmail.com', 24), 
 ('Niha','niha@gmail.com', 18);

 -- retrieve or print the data
SELECT * FROM basics.students;
DROP TABLE IF EXISTS basics.products_basic;

CREATE TABLE basics.products_basic(
    id SERIAL PRIMARY KEY,
    -- string --> max length of 100 characters

    name VARCHAR(100) NOT NULL,

    description TEXT,
    -- only whole numbers are allowed

    stock INTEGER DEFAULT 0,
    -- whole numbers greater than INTEGER

    total_views BIGINT DEFAULT 0,
    -- decimal values 
    -- 10 means total digits
    -- 2 means digits after decimal point

    price NUMERIC(10,2) ,

    is_active BOOLEAN DEFAULT TRUE
);


INSERT INTO basics.products_basic 
(name,description,stock,total_views,price,is_active)
VALUES
  ('product 1', 'product 1 desc', 10,135, 1359.909, TRUE),
  ('product 2', 'product 2 desc', 45, 980, 99987.90, TRUE),
  ('product 3', 'product 3 desc', 0, 5, 980, FALSE);


SELECT * FROM basics.products_basic;

SELECT name, description, price, is_active 
 FROM basics.products_basic 
 Where is_active;

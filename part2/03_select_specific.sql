-- select * returns every column from the table
SELECT * FROM products;

-- this query returns only the name and price columns from the products table
SELECT name,price FROM products;


-- Aliases
-- AS creates an alias for the column
-- make the column name easier to read

SELECT 
 name AS product_name,
 price AS selling_price,
 stock AS available_quantity
FROM products;
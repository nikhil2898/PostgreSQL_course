-- SELECT category,price from products;

-- SELECT name,category,price FROM products
-- WHERE category = 'Electronics' AND price >= 1000;

-- SELECT name,category,price FROM products
-- WHERE category = 'furniture' OR price >= 1000;



-- SELECT name,category FROM products
-- WHERE NOT category = 'Electronics'

SELECT name,category,price,stock 
FROM products
WHERE price > 1000 AND (category = 'Electronics' OR category = 'Furniture');


SELECT name,category,price 
FROM products
WHERE (stock >= 100 OR price < 1000) AND is_active = true;
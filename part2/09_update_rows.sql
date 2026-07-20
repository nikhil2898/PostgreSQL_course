-- updating single row
select sku from products;


SELECT name,price,stock,sku
FROM products
WHERE sku = 'LAP123';

UPDATE products
SET price = 49999,
    stock = 15
WHERE sku = 'LAP123';

SELECT name,price,stock,sku
FROM products
WHERE sku = 'LAP123';




-- updating multiple rows

SELECT name,category,stock,is_active,price
FROM products
WHERE category = 'Electronics';

UPDATE products
SET price = ROUND(price * 1.10,2)
WHERE category = 'Electronics';

UPDATE products
SET is_active = False
WHERE stock = 0;

SELECT name,category,stock,is_active,price
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC
LIMIT 5;

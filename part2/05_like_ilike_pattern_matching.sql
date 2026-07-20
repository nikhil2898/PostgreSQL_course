--like  - case sensitive pattern match
--ilike  - case insensitive pattern match
-- %     - any no.of characters
-- _   - exactly one char


-- SELECT * FROM products;

SELECT name,category,price
FROM products
WHERE description LIKE 'Wireless%';



SELECT name,category,price 
FROM products
WHERE description ILIKE 'Wireless%';



SELECT name,category,price
FROM products
WHERE description ILIKE '%inch%';



SELECT name,category,price
FROM products
WHERE name ILIKE 'monitor'
 AND description ILIKE '%monitor%';
-- IN : Checks if a value matches any value in a list
-- NOT IN : Checks if a value does not match any value in a list
-- BETWEEN : Checks if a value falls within a range (inclusive)
-- NOT BETWEEN : Checks if a value is outside a range


-- SELECT name,category,price
-- FROM products
-- WHERE category IN ('furniture','Electronics');

-- SELECT name,category,price
-- FROM products
-- WHERE category NOT IN ('Electronics');

-- SELECT name,price
-- FROM products
-- WHERE price BETWEEN 100 AND 2000;

-- SELECT name,price
-- FROM products
-- WHERE price NOT BETWEEN 100 AND 2000;

-- SELECT * from products;

-- SELECT name,price,category,stock 
-- FROM products
-- WHERE category IN ('Electronics','stationery')
--   AND (price BETWEEN 100 AND 1499)
--    AND (stock BETWEEN 5 AND 40);



-- NULL : missing/unknown value
-- u should not check null using = null
-- IS NULL :
-- IS NOT NULL : 

SELECT name,description
FROM products
WHERE description IS NULL;

SELECT name,description
FROM products
WHERE description IS NOT NULL;

SELECT name,description,is_active
FROM products
WHERE is_active = true
 AND description IS NOT NULL;
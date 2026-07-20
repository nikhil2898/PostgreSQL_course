-- INSERT INTO products(name,category,price,stock,sku,description)
--  VALUES
--   ('Temp product to delete','Electronics',567,9,'ELEC-TEMP-03','must be deleted product'),
--   ('Dressing Table','Furniture',7890,5,'FURN-01','Man-made dressing table'),
--   ('Double cart BED','Furniture',9000,2,'FURN-02','Takewood Bed');


SELECT name,category,sku,price 
FROM products
WHERE sku = 'ELEC-TEMP-03';

DELETE FROM products
WHERE sku = 'ELEC-TEMP-03';

SELECT name,category,sku,price
FROM products
WHERE sku = 'ELEC-TEMP-03';
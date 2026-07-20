INSERT INTO products(name,category,price,stock,sku,description)
VALUES
 ('Keyboard','Electronics',50.00,30,'KBD678','Mechanical keyboard'),
 ('Mouse','Electronics',25.00,40,'MSE901','Wireless mouse');


SELECT * FROM products
WHERE sku IN ('KBD678', 'MSE901');
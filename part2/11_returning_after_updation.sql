
INSERT INTO products(name,category,price,stock,sku,description)
VALUES ('web camera','Electronics',456,4,'ELEC-WEB-009','Web camera with high resolution')
RETURNING id,name,category,created_at;


UPDATE products
SET stock = stock + 10
WHERE sku = 'ELEC-WEB-009'
RETURNING id,name,stock;
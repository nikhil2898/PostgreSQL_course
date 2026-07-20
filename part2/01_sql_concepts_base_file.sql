CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK(price >= 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0),
    is_active BOOLEAN DEFAULT true,
    sku TEXT UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO products(name,category,price,stock,sku,description) 
 VALUES
('Laptop','Electronics',1200.00,10,'LAP123','High performance laptop'),
('Smartphone','Electronics',800.00,20,'SMP456','Latest model'),
('Tablet','Electronics',400.00,15,'TBL789','Portable tablet'),
('Headphones','Electronics',100.00,25,'HPD012','Wireless headphones'),
('Monitor','Electronics',300.00,5,'MNR345','24-inch monitor');


SELECT * FROM products;

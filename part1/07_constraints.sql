DROP TABLE IF EXISTS basics.accounts;

CREATE TABLE basics.accounts(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name VARCHAR(100) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    age INTEGER CHECK(age >= 18),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO basics.accounts(full_name, email, age) VALUES ('Nikhil','nikhil@gmail.com', 24), ('Disha','disha@gmail.com',18);

SELECT * FROM basics.accounts;
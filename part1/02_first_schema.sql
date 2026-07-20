--db --> schema --> tables --> rows

-- if not exists is going to prevent an error if the schema is already exists
CREATE SCHEMA IF NOT EXISTS basics;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

SELECT schema_name
FROM information_schema.schemata
ORDER By schema_name;
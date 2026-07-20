--you should never do it in production app
-- this is only for learning purpose
DROP DATABASE IF EXISTS postgresql_part1;

--create new db inside postgresql server
CREATE DATABASE postgresql_part1;

-- psql -U postgres  ==> login as postgres user
-- psql -d postgres  ==> connect to postgres db in postgres user
-- psql -f part1/01_first_database.sql  ==> run the sql file in postgres db 

-- SELECT current_database();  ==> check current database
-- SELECT current_user;        ==> check current user
-- SELECT version();           ==> gives version ur using
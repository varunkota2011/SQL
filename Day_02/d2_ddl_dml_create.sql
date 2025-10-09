create table users(
id int,
first_name varchar,
last_name varchar,
email varchar,
mobile varchar,
password varchar,
avatar varchar,
dob date,
is_vendor varchar,
bio text,
status bool,
purchases numeric(10,2)
);

-- Creating a schema dwh
CREATE SCHEMA dwh AUTHORIZATION postgres;

ALTER TABLE users
SET SCHEMA dwh;



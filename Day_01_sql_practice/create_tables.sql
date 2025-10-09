-- create_tables.sql

create table employees(
emp_id int,
first_name varchar(20),
middle_name varchar(10),
last_name varchar(10),
age int,
email_id  varchar(30)
);


create table department(
id int,
dept varchar(20),
salary int
);

create table project(
project_id int,
project_name varchar(30),
emp_id int,
start_date date,
end_date date
);

select * from employees;

select * from department;

select * from project;

-- add new column
alter table employees
add column phone_no varchar(20);

-- add multiple columns
alter table department
add column location varchar(20),
add column head_name varchar(20);

-- rename columns
alter table employees
rename column email_id to email;

alter table employees
rename column phone_no to mobile_no;

-- change data_type
alter table department
alter column salary type numeric(10,2);

-- drop a column
alter table employees
drop column middle_name;

-- rename table
alter table department 
rename to dept_master;

alter table dept_master
rename to department;

-- Constraints(add and remove keys)

-- add primary key
alter table employees
add constraint pk_emp_id primary key (emp_id);

alter table department
add constraint pk_dept_id primary key (id);


-- add a unique constraint
alter table employees
add constraint unique_email unique (email);

-- add a foreign key
-- first adding a column in employees 

alter table employees
add column dept_it int;

-- adding foreign key
alter table employees
add constraint fk_dept foreign key (dept_it) references department(id);

-- drop a constraint
alter table employees
drop constraint fk_dept;

-- truncate table
truncate table employees;

-- drop tables

--drop table employees;
-- drop table department;




/* create table table_name(
 col_name1 data_type constraint,
 col_name2 data_type constraint,
 col_name3 data_type constraint 
 );
 
 */

-- Table 1 employees
create table employee (
	emp_id int,
	first_name varchar(20),
	last_name varchar(20),
	gender char(1),
	dob date,
	hire_date date,
	dept_id int,
	job_title varchar(30),
	salary numeric(10,2),
	email varchar(50)
);


-- Table 2 projects
create table projects (
	project_id int,
	project_name varchar(50),
	dept_id int,
	manager_id int,
	start_date date,
	end_date date,
	budget numeric(12,2),
	client_name varchar(50),
	status varchar(10)	
);

-- Table 3 departments 
	create table departments (
	dept_id int,
	dept_name varchar(50),
	manager_id int,
	location varchar(100),
	budget numeric(12,2),
	start_date date,
	phone_no varchar(15),
	status varchar(20)
);

-- Table 4 salaries
create table salaries (
	salary_id int,
	base_salary numeric(10,2),
	bonus numeric(10,2),
	deductions numeric(10,2),
	effictive_date date,
	pay_grade varchar(10),
	payment_mode varchar(20)
);

-- Table 5 attendance
create table attendance (
	emp_id int,
	date date,
	check_in time,
	check_out time,
	total_hours numeric(5,2),
	status varchar(20),
	remarks varchar(100)
);

-- Table 6 training_sessions
create table training_sessions (
	session_id int,
    topic varchar(100),
    trainer_name varchar(100),
    dept_id int,
    start_date date,
    end_date date,
    duration_hours numeric(5,2),
    mode varchar(20),
    feedback_rating numeric(3,1)
);

-- Table 7 performance_reviews
create table performance_reviews (
    review_id int,
    emp_id int,
    reviewer_id int,
    review_date date,
    performance_score numeric(4,2),
    next_review_date date
);

-- Table 8 products
create table products (
	product_id int,
    product_name varchar(100),
    category_id int,
    supplier_id int,
    price numeric(10,2),
    stock int,
    reorder_level int,
    manufactured_date date,
    expiry_date date,
    status varchar(20)
);

-- Table 9 suppliers
create table suppliers (
	supplier_id int,
    supplier_name varchar(100),
    contact_person varchar(100),
    phone varchar(20),
    email varchar(100),
    city varchar(50),
    country varchar(50),
    rating numeric(3,1)
);

-- Table 10 customers
create table customers (
	customer_id int,
    first_name varchar(10),
    last_name varchar(10),
    email varchar(50),
    phone varchar(20),
    city varchar(10),
    country varchar(10),
    registration_date date
);

drop table suppliers;






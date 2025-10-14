
CREATE TABLE orders (

    order_id INT PRIMARY KEY,

    item VARCHAR(255) NOT NULL

);


INSERT INTO orders (order_id, item) VALUES
(1, 'Pizza'),
(2, 'Rice'),
(3, 'Curry'),
(4, 'Fries'),
(5, 'coco'),
(6, 'chips'),
(7, 'egg puff');

select * from orders;

-- drop table orders;

select order_id,
	case 
		when order_id = 7 then 7
		when mod(order_id,2) = 0 then order_id -1
		when mod(order_id,2) != 0 then order_id+1
	end 
	as n_order_id, item
from orders
order by n_order_id;
	

------------------------------------------------------------------------------------------------------------

CREATE TABLE single_row_practice (
    emp_id          INT ,
    emp_name        VARCHAR(50),
    job_title       VARCHAR(50),
    salary          NUMERIC(10,2),
    commission      NUMERIC(8,2),
    hire_date       DATE,
    dept_name       VARCHAR(40),
    city            VARCHAR(40),
    phone_number    VARCHAR(20),
    email           VARCHAR(60)
);

INSERT INTO single_row_practice 
(emp_id, emp_name, job_title, salary, commission, hire_date, dept_name, city, phone_number, email)
VALUES
(1,'John Doe', 'Sales Executive', 55000, 3000, '2019-03-15', 'Sales', 'New York', '9876543210', 'john.doe@company.com'),
(2, 'Alice Smith', 'Manager', 75000, NULL, '2016-10-10', 'Operations', 'Chicago', '9898989898', 'alice.smith@company.com'),
(3, 'Robert Brown', 'Developer', 62000, 1500, '2020-07-01', 'IT', 'San Francisco', '9822334455', 'robert.brown@company.com'),
(4, 'Linda Johnson', 'HR Executive', 48000, NULL, '2018-01-20', 'HR', 'Boston', '9988776655', 'linda.johnson@company.com'),
(5, 'Michael Lee', 'Analyst', 53000, 1000, '2021-12-05', 'Finance', 'Seattle', '9112233445', 'michael.lee@company.com'),
(6, 'David Clark', 'Developer', 60000, 2000, '2017-09-25', 'IT', 'Austin', '9123456789', 'david.clark@company.com'),
(7, 'Sophia Turner', 'Sales Executive', 58000, 2500, '2020-02-10', 'Sales', 'New York', '9977553311', 'sophia.turner@company.com'),
(8, 'James Wilson', 'Analyst', 51000, NULL, '2019-06-30', 'Finance', 'Chicago', '9090909090', 'james.wilson@company.com'),
(9, 'Olivia Green', 'Manager', 80000, NULL, '2015-11-12', 'Operations', 'Dallas', '9887766554', 'olivia.green@company.com'),
(10, 'Emma Davis', 'HR Executive', 47000, NULL, '2022-04-25', 'HR', 'Boston', '9876501234', 'emma.davis@company.com');

------------------------- single row functions----------------------------------

select * from srp;

alter table single_row_practice
rename  to srp;

-- Q1. Display employee names in uppercase and job titles in lowercase.
select emp_name, upper(emp_name)as uper_name, job_title, lower(job_title) as lower_title from srp;

-- Q2. Display emp_name in InitCap format and extract only the first 5 characters of dept_name.
select emp_name, initcap(emp_name) as new_name , substr(dept_name,1,5) as sub_dept from srp;

-- Q3. Show employee names along with their name length.
select emp_name, length(emp_name) from srp;

-- Q4. Display employees’ email addresses but replace ‘@company.com’ with ‘@corp.com’.
select email, replace(email, '@company.com', '@corp.com') as new_email from srp;

-- Q5. Display city names after trimming leading and trailing spaces.
select city, length(city), trim(city) as new_city from srp;

-- Q6. Find the position of the letter 'a' in each employee’s emp_name.
select emp_name, position('a' in emp_name) as a_pos from srp;

-- Q7. Show each employee’s salary rounded to the nearest thousand.
select emp_name, salary, round(salary, -3) as rounded_salary from srp;

-- Q8. Display salary truncated to hundreds (no rounding).
select emp_name, salary, trunc(salary, -2) as trunc_salary from srp;

-- Q9. Show commission values and their absolute difference from 2000.	
select emp_name, commission, abs(commission -2000) as diff_from_2000 from srp;

-- Q10. Display the next highest and lowest integers for salary divided by 1000.
select emp_name, salary/1000 as salary_k , ceil(salary/1000) as ceil_sal, floor(salary/1000) as floor_sal from srp;

-- Q11. Display employee name, hire date, and extract the year they joined.
select emp_name, hire_date, extract(year from hire_date) as join_year from srp;

-- Q12. Calculate how many years each employee has been with the company.
select emp_name, age(current_date, hire_date) as expereince from srp;

-- Q13. Display hire date in the format 'DD-Mon-YYYY'.
select emp_name, hire_date,  to_char(hire_date, 'dd-mm-yyyy') as f_hire_date from srp;

-- Q14. Add 6 months to each employee’s hire date and show the new date.
select emp_name, hire_date,  hire_date + interval '6 MONTHS' as probation_endDate from srp;

-- Q15. Show the last day of the month for each employee’s hire date
select emp_name, 
	   hire_date, 
	   (date_trunc('month', hire_date) + interval '1 month - 1 day')::date as last_day
from srp;
				
-- Q16. Convert salary to a string and concatenate with ' USD'.
select emp_name, to_char(salary, '999999.99') || 'USD' as salary_text from srp;

-- Q17. Convert a string '2025-12-31' to a DATE and display in 'Mon DD, YYYY' format.
select hire_date, to_char(to_date('2025-12-31', 'yyyy-mm-dd'), 'Mon DD, YYYY') as formatted_date from srp;

-- Q18. Cast the salary column as an integer value.
select emp_name, salary, CAST(salary AS INT) AS salary_int from srp;

-- Q19. Display commission; if NULL, show 0 instead.
select emp_name, COALESCE(commission, 0) AS commission_value from srp;

-- Q20. Display the highest and lowest between salary and commission for each employee.
select emp_name,salary, commission,
       greatest(salary, COALESCE(commission,0)) AS max_value,
       least(salary, COALESCE(commission,0)) AS min_value
from srp;

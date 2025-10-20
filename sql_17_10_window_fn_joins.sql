-- departments table
create table departments (
    dept_id int primary key,
    dept_name varchar(50),
    location varchar(50)
);

-- employees table
create table employees (
    emp_id int primary key,
    first_name varchar(30),
    last_name varchar(30),
    gender char(1),
    hire_date date,
    dept_id int references departments(dept_id),
    manager_id int,
    job_title varchar(40)
);

-- salaries table
create table salaries (
    emp_id int references employees(emp_id),
    salary numeric(10,2),
    bonus numeric(10,2),
    effective_date date
);

-- projects table
create table projects (
    project_id int primary key,
    project_name varchar(50),
    dept_id int references departments(dept_id),
    start_date date,
    end_date date
);

-- employee_projects (many-to-many)
create table employee_projects (
    emp_id int references employees(emp_id),
    project_id int references projects(project_id),
    role varchar(30)
);


-- departments
insert into departments values
(10, 'HR', 'Chennai'),
(20, 'Finance', 'Bangalore'),
(30, 'IT', 'Hyderabad'),
(40, 'Marketing', 'Mumbai'),
(50, 'Operations', 'Delhi');

-- employees
insert into employees values
(101, 'Amit', 'Sharma', 'M', '2018-03-01', 10, null, 'HR Manager'),
(102, 'Priya', 'Menon', 'F', '2020-01-15', 10, 101, 'HR Executive'),
(103, 'Ravi', 'Kumar', 'M', '2019-06-10', 20, null, 'Finance Manager'),
(104, 'Sneha', 'Rao', 'F', '2021-02-20', 20, 103, 'Accountant'),
(105, 'Karan', 'Patel', 'M', '2017-11-11', 30, null, 'IT Manager'),
(106, 'Divya', 'Singh', 'F', '2020-05-05', 30, 105, 'Software Engineer'),
(107, 'Vikram', 'Joshi', 'M', '2021-06-18', 30, 105, 'Data Engineer'),
(108, 'Meera', 'Nair', 'F', '2019-09-25', 40, null, 'Marketing Manager'),
(109, 'Anil', 'Verma', 'M', '2021-07-07', 40, 108, 'Sales Executive'),
(110, 'Rohit', 'Ghosh', 'M', '2022-01-12', 50, null, 'Ops Manager'),
(111, 'Kavya', 'Das', 'F', '2022-02-02', 50, 110, 'Ops Analyst'),
(112, 'Nisha', 'Bhat', 'F', '2023-03-03', 30, 105, 'Data Analyst'),
(113, 'Arjun', 'Reddy', 'M', '2023-05-10', 30, 105, 'DevOps Engineer'),
(114, 'Sonia', 'Kapoor', 'F', '2023-04-04', 10, 101, 'Recruiter'),
(115, 'Manoj', 'Pillai', 'M', '2020-09-15', 20, 103, 'Auditor');

-- salaries
-- clear old salary data (optional)
truncate table salaries;

-- insert salary history for 2022, 2023, 2024 (3 years per emp)
insert into salaries (emp_id, salary, bonus, effective_date) values
-- 2022
(101, 85000, 4000, '2022-01-01'),
(102, 45000, 2000, '2022-01-01'),
(103, 90000, 5000, '2022-01-01'),
(104, 50000, 1500, '2022-01-01'),
(105, 95000, 8000, '2022-01-01'),
(106, 65000, 3000, '2022-01-01'),
(107, 66000, 2500, '2022-01-01'),
(108, 80000, 4000, '2022-01-01'),
(109, 47000, 1500, '2022-01-01'),
(110, 83000, 6000, '2022-01-01'),
(111, 45000, 1000, '2022-01-01'),
(112, 58000, 2500, '2022-01-01'),
(113, 60000, 2500, '2022-01-01'),
(114, 40000, 1000, '2022-01-01'),
(115, 52000, 1500, '2022-01-01'),

-- 2023
(101, 88000, 4500, '2023-01-01'),
(102, 48000, 2500, '2023-01-01'),
(103, 92000, 6000, '2023-01-01'),
(104, 52000, 2000, '2023-01-01'),
(105, 97000, 8500, '2023-01-01'),
(106, 68000, 4000, '2023-01-01'),
(107, 70000, 3000, '2023-01-01'),
(108, 83000, 5000, '2023-01-01'),
(109, 48000, 2000, '2023-01-01'),
(110, 85000, 7000, '2023-01-01'),
(111, 46000, 1200, '2023-01-01'),
(112, 60000, 2700, '2023-01-01'),
(113, 62000, 2800, '2023-01-01'),
(114, 43000, 1200, '2023-01-01'),
(115, 54000, 1800, '2023-01-01'),

-- 2024
(101, 90000, 5000, '2024-01-01'),
(102, 50000, 3000, '2024-01-01'),
(103, 95000, 7000, '2024-01-01'),
(104, 55000, 2000, '2024-01-01'),
(105, 100000, 10000, '2024-01-01'),
(106, 70000, 5000, '2024-01-01'),
(107, 72000, 4000, '2024-01-01'),
(108, 85000, 6000, '2024-01-01'),
(109, 50000, 2500, '2024-01-01'),
(110, 88000, 8000, '2024-01-01'),
(111, 48000, 1500, '2024-01-01'),
(112, 62000, 3000, '2024-01-01'),
(113, 64000, 3500, '2024-01-01'),
(114, 45000, 1500, '2024-01-01'),
(115, 56000, 2500, '2024-01-01');


-- projects
insert into projects values
(201, 'HRMS Upgrade', 10, '2024-01-01', '2024-12-31'),
(202, 'Audit Automation', 20, '2024-02-01', '2024-09-30'),
(203, 'Data Lake', 30, '2024-03-01', '2025-03-01'),
(204, 'Marketing Campaign', 40, '2024-05-01', '2024-11-01'),
(205, 'Warehouse Optimization', 50, '2024-04-15', '2024-12-15');

-- employee_projects
insert into employee_projects values
(101, 201, 'Project Lead'),
(102, 201, 'HR Analyst'),
(103, 202, 'Project Lead'),
(104, 202, 'Finance Analyst'),
(105, 203, 'Project Lead'),
(106, 203, 'Developer'),
(107, 203, 'Data Engineer'),
(112, 203, 'Data Analyst'),
(113, 203, 'DevOps'),
(108, 204, 'Project Lead'),
(109, 204, 'Sales Support'),
(110, 205, 'Project Lead'),
(111, 205, 'Analyst');

select*from employees;
---------------JOINS---------------------------------------------------------
-- List all employees with department names.
select e.emp_id, e.first_name, d.dept_name
from employees e
join departments d on e.dept_id = d.dept_id;

-- Employees without managers.
select first_name, job_title from employees where manager_id is null;

-- Show employee → manager name pairs.
select e.first_name as employee, m.first_name as manager
from employees e
left join employees m on e.manager_id = m.emp_id;

--- Departments with total employees.
select d.dept_name, count(e.emp_id) as total_emps
from departments d
left join employees e on d.dept_id = e.dept_id
group by d.dept_name;

-- Employees and the projects they work on.
select*from employees;
select*from projects;
select*from employee_projects;
select*from departments;
select*from salaries;

select e.first_name, p.project_name
from employees e
join employee_projects ep
on e.emp_id = ep.emp_id
join projects p on ep.project_id = p.project_id;

-- Projects without assigned employees.
select p.project_name
from projects p
left join employee_projects ep
on p.project_id = ep.project_id
where ep.emp_id is null;

-- List each project with department location.
select p.project_name, d.location
from projects p
join departments d
on p.dept_id = d.dept_id

-- List employees hired after 2020.
select first_name, hire_date from employees where hire_date > '2020-01-01';

-- Get employees whose names start with ‘A’
select * from employees where first_name like 'A%';

-- Departments with average salary above 70,000 (latest year).
select e.dept_id, avg(s.salary) avg_sal
from employees e
join salaries s on e.emp_id = s.emp_id
where s.effective_date = '2024-01-01'
group by e.dept_id
having avg(salary) > 70000;

--------------WINDOW FUNCTIONS------------------------------------------------------

-- Rank employees by salary within department.
select e.dept_id, e.first_name, s.salary,
rank() over (partition by e.dept_id order by s.salary desc) as dept_rank
from employees e
join salaries s on e.emp_id = s.emp_id;

-- Dense rank instead of rank.
select e.dept_id, e.first_name, s.salary,
dense_rank() over(partition by e.dept_id order by s.salary desc)as dense_rank
from employees e 
join salaries s on e.emp_id = s.emp_id;

-- Find the top 2 salaries per department.
select * from (
	select e.dept_id, e.first_name, s.salary,
	rank() over (partition by e.dept_id order by s.salary desc) as rnk
	from employees e
	join salaries s on e.emp_id = s.emp_id
) x
where rnk <= 2;

-- Running total of salary by department.
select e.dept_id, e.emp_id, s.salary,
sum(s.salary) over(partition by e.dept_id order by e.emp_id) as run_total
from employees e
join salaries s
on e.emp_id = s.emp_id;

-- Compare each employee’s salary to department average.
select e.emp_id, e.first_name, s.salary,
round(avg(s.salary) over (partition by e.dept_id),2) as dept_avg,
round(s.salary - avg(s.salary) over (partition by e.dept_id),2) as diff
from employees e join salaries s on e.emp_id = s.emp_id;

-- Get previous year’s salary using lag().
select emp_id, effective_date, salary,
lag(salary) over (partition by emp_id order by effective_date) as prev_sal
from salaries;

-- Calculate year-on-year salary growth %.
select emp_id, effective_date, salary,
round(((salary - lag(salary) over (partition by emp_id order by effective_date))/
		lag(salary) over (partition by emp_id order by effective_date))*100,2) as growth_pct
from salaries;

-- Show 3-year average salary per employee.
select emp_id,round(avg(salary) over (partition by emp_id),2) as avg_3r
from salaries;

-- Show max salary seen so far by employee.
select emp_id, effective_date, salary,
max(salary) over (partition by emp_id ) as running_max
from salaries;

-- Lead salary to see next year’s expected.
select emp_id, effective_date, salary,
lead(salary) over (partition by emp_id order by effective_date) as next_salary
from salaries;

-- Find employees whose salary dropped vs previous year.
select emp_id, effective_date, salary,
lag(salary) over (partition by emp_id order by effective_date) as prvs_salary
from salaries;

-- Department-wise total + running total.
select dept_id, e.emp_id, salary,
sum(salary) over (partition by dept_id) as dept_total,
sum(salary) over (partition by dept_id order by e.emp_id) as running_total
from employees e join salaries s on e.emp_id = s.emp_id;

-- Find nth highest salary overall.
select * from (
		select emp_id, salary,
		dense_rank() over (order by salary desc) rnk
		from salaries) x where rnk=3;

-- Average salary by gender.
select gender, round(avg(salary) over (partition by gender),2) as avg_gndr_sal
from employees e join salaries s on e.emp_id = s.emp_id;

-- Moving average (2-year window).
select emp_id, effective_date, salary,
avg(salary) over (
				partition by emp_id 
				order by effective_date  
				rows between 1 preceding and current row) as mov_avg
from salaries;

-- Employees whose 2024 salary > their dept’s 2024 average.




-- drop tables if they already exist
drop table if exists attendance, salaries, projects, employees, departments cascade;

-- 1️⃣ Departments
create table departments (
    dept_id serial primary key,
    dept_name varchar(50),
    location varchar(50)
);

-- 2️⃣ Employees
create table employees (
    emp_id serial primary key,
    first_name varchar(30),
    last_name varchar(30),
    gender char(1),
    hire_date date,
    dept_id int references departments(dept_id),
    manager_id int null
);

-- 3️⃣ Salaries (historical)
create table salaries (
    emp_id int references employees(emp_id),
    effective_date date,
    salary numeric(10,2),
    primary key(emp_id, effective_date)
);

-- 4️⃣ Projects
create table projects (
    proj_id serial primary key,
    proj_name varchar(50),
    start_date date,
    end_date date,
    budget numeric(12,2),
    dept_id int references departments(dept_id)
);

-- 5️⃣ Attendance
create table attendance (
    emp_id int references employees(emp_id),
    work_date date,
    hours_worked numeric(4,1)
);


-- departments
insert into departments (dept_name, location) values
('HR', 'Chennai'),
('Finance', 'Pune'),
('Engineering', 'Bangalore'),
('Sales', 'Hyderabad');

-- employees
insert into employees (first_name, last_name, gender, hire_date, dept_id, manager_id) values
('Amit', 'Kumar', 'M', '2019-01-15', 3, null),
('Priya', 'Sharma', 'F', '2020-03-10', 3, 1),
('Raj', 'Verma', 'M', '2018-07-12', 2, null),
('Sneha', 'Rao', 'F', '2021-06-01', 2, 3),
('Vikram', 'Singh', 'M', '2017-02-20', 1, null),
('Neha', 'Patil', 'F', '2022-01-05', 1, 5),
('Arjun', 'Das', 'M', '2019-09-18', 4, null),
('Meera', 'Iyer', 'F', '2020-12-11', 4, 7);

-- salaries
insert into salaries (emp_id, effective_date, salary) values
(1, '2023-01-01', 90000), (1, '2024-01-01', 100000),
(2, '2023-01-01', 65000), (2, '2024-01-01', 72000),
(3, '2023-01-01', 75000), (3, '2024-01-01', 81000),
(4, '2023-01-01', 55000), (4, '2024-01-01', 60000),
(5, '2023-01-01', 60000), (5, '2024-01-01', 63000),
(6, '2023-01-01', 40000), (6, '2024-01-01', 48000),
(7, '2023-01-01', 70000), (7, '2024-01-01', 75000),
(8, '2023-01-01', 50000), (8, '2024-01-01', 54000);

-- projects
insert into projects (proj_name, start_date, end_date, budget, dept_id) values
('Payroll Revamp', '2024-01-15', '2024-07-30', 1500000, 3),
('ERP Migration', '2024-02-10', '2024-12-31', 2000000, 2),
('Sales Portal', '2024-03-05', '2024-10-10', 800000, 4),
('Recruitment Drive', '2024-05-01', '2024-09-30', 300000, 1);

-- attendance (just few sample rows)
insert into attendance (emp_id, work_date, hours_worked) values
(1, '2024-10-01', 8), (1, '2024-10-02', 7.5),
(2, '2024-10-01', 9), (2, '2024-10-02', 8),
(3, '2024-10-01', 8), (3, '2024-10-02', 8),
(4, '2024-10-01', 7), (4, '2024-10-02', 6.5),
(5, '2024-10-01', 8), (5, '2024-10-02', 8),
(6, '2024-10-01', 7.5), (6, '2024-10-02', 8);

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- List all employee names using a simple CTE.
with emp_names as (
	select emp_id, first_name ||' '|| last_name as full_name from employees
)
select * from emp_names;

-- Find employees and their department names.
with emp_dept as (
	select e.first_name, e.last_name, d.dept_name
	from employees e join departments d on e.dept_id = d.dept_id
)
select * from emp_dept;

-- Department-wise average salary.
with dep_avg_sal as (
	select e.dept_id, round(avg(salary)) as avg_sal
	from employees e join salaries s on e.emp_id = s.emp_id 
	group by e.dept_id
)
select d.dept_name, avg_sal
from dep_avg_sal a join departments d on a.dept_id = d.dept_id ;

-- Employees with salary growth >10%.
with sal_gwt as (
	select emp_id,
	lag(salary) over (partition by emp_id order by effective_date) as prev_sal, salary
	from salaries
)
select emp_id, round((salary-prev_sal)/prev_sal*100,2) as gwt_pct
from sal_gwt 
where prev_sal  is not null and (salary-prev_sal)/prev_sal*100 > 10;

-- Recursive CTE

-- Find management hierarchy (employee → manager chain).
with recursive org_chart as (
	select emp_id, first_name ||' '|| last_name as emp_name,
			manager_id, 1 as level
	from employees 
	where manager_id is null 
	union all
	select e.emp_id, e.first_name || ' ' || e.last_name,
			e.manager_id, o.level+1
	from employees e 
	join org_chart o on e.manager_id = o.emp_id
)
select * from org_chart order by level, emp_id;

-- Multiple CTEs

-- Find top 3 highest paid employees per department.
with curr_sal as (
	select emp_id, salary
	from salaries
),
emp_dept_sal as (
	select e.first_name, e.last_name, e.dept_id, s.salary,
	rank() over (partition by e.dept_id order by s.salary desc) as rnk
	from employees e join curr_sal s on e.emp_id = s.emp_id 
)
select * from emp_dept_sal where rnk<=3;

-- Complex Business Case

-- Total monthly payroll cost for 2024.
with latest_salary as (
    select emp_id, max(effective_date) as latest_date
    from salaries where extract(year from effective_date) = 2024
    group by emp_id
),
current_salary as (
    select s.emp_id, s.salary
    from salaries s join latest_salary l
    on s.emp_id = l.emp_id and s.effective_date = l.latest_date
)
select sum(salary)/12 as monthly_payroll from current_salary;



















-- Find employees whose salary is greater than the average salary of all employees.
select e.first_name, s.salary, floor((select avg(s2.salary) from salaries s2)) as avg_salary
from employees e
join salaries s on e.emp_id = s.emp_id 
where s.salary > (select avg(s2.salary) from salaries s2)
group by e.first_name, s.salary;

-- Find employees who earn the maximum salary in the company.
select e.first_name, s.salary, round((select max(s2.salary) from salaries s2),2) as max_salary
from employees e
join salaries s on e.emp_id = s.emp_id 
where salary = (select max(s2.salary) from salaries s2);

-- Find employees who work in the same department as 'John'.
select e.first_name, d.dept_name
from employees e
join departments d on e.dept_id = d.dept_id
where d.dept_id in (
					select e2.dept_id 
					from employees e2 
					where e2.first_name = 'John'
					);

-- List employees who work in the same departments as employees whose job_title = 'Manager'.
select e.first_name, e.dept_id, d.dept_id, e.job_title, d.dept_name
from employees e
join departments d
on e.dept_id = d.dept_id 
where e.dept_id in (select distinct e2.dept_id 
					from employees e2 
					where e2.job_title like '%Manager');

-- Find employees whose salary is greater than ALL employees in dept 10.
select e.first_name, e.dept_id, s.salary
from employees e
join salaries s on e.emp_id = s.emp_id 
where s.salary > all (
			select salary
			from salaries s2
			join employees e2 on s2.emp_id = e2.emp_id 
			where e2.dept_id = 10);

-- Find employees whose salary is greater than ANY employee in dept 20.
select e.first_name, e.dept_id, s.salary
from employees e
join salaries s on e.emp_id = s.emp_id 
where s.salary > any (
			select salary
			from salaries s2
			join employees e2 on s2.emp_id = e2.emp_id 
			where e2.dept_id = 20);

-- Find employees who earn more than the average salary of their department.
select e.first_name, e.dept_id, s.salary
from employees e
join salaries s on e.emp_id = s.emp_id 
where s.salary > (
		select avg(s2.salary)
		from salaries s2
		join employees e2 on s2.emp_id = e2.emp_id
		where e2.dept_id = e.dept_id);

-- Find employees who have the highest salary in their department.
select e.first_name, e.dept_id, s.salary
from employees e
join salaries s on e.emp_id = s.emp_id 
where s.salary = (
		select max(s2.salary)
		from salaries s2
		join employees e2 on s2.emp_id = e2.emp_id
		where e2.dept_id = e.dept_id);

-- List employees who have at least one colleague in the same department.
select e.first_name, e.dept_id
from employees e
where exists (select 1 from employees e2  
			  where e2.dept_id = e.dept_id
              and e2.emp_id <> e.emp_id)
order by e.dept_id;

-- Find employees who work in departments located in 'NEW YORK'.
select e.first_name, d.dept_name
from employees e
join departments d on e.dept_id = d.dept_id
where d.dept_id in (
    select dept_id
    from departments
    where location_id = (
        select location_id
        from locations
        where city = 'NEW YORK'
    )
);

-- 








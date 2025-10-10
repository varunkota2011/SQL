-- Queries

--1. Display all the information of the EMP table?
select * 
from Vk_employee;

-- 2. Display unique Jobs from EMP table?
select distinct job 
from Vk_employee;

-- 3. List the emps in the asc order of their Salaries?
select e_name, salary 
from Vk_employee 
order by salary;

-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
select *  
from Vk_employee 
order by dept_no, job desc;

-- 5. Display all the unique job groups in the descending order?
select distinct job
from Vk_employee
order by job desc;

-- 6. Display all the details of all ‘Mgrs’
select *
from Vk_employee
where job = 'MANAGER';

-- 7. List the emps who joined before 1981.
select e_name, job, hire_date
from Vk_employee
where hire_date < '1981-01-01';

-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
select emp_no, e_name, salary, (salary/22) as Daily_salary, (salary*12) as Ann_salary
from Vk_employee
order by Ann_salary;

-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
select emp_no, e_name, job, hire_date, extract(year from age(current_date, hire_date)) as expereince
from Vk_employee
where job = 'MANAGER';

-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7839.
select emp_no, e_name, salary, extract(year from age(current_date, hire_date)) as expereince
from Vk_employee
where mgrs = '7839';

-- 11. Display all the details of the emps whose Comm. Is more than their Sal.
select *
from Vk_employee
where comm > salary;

-- 12. List the emps in the asc order of Designations of those joined after the second half of 1981.
select *
from Vk_employee
where hire_date > '1981-06-01'
order by job;

-- 13. List the emps along with their Exp and Daily Sal is more than Rs.100.
select emp_no, e_name, extract(year from age(current_date, hire_date)) as expereince, (salary/22) as Daily_sal
from Vk_employee
where (salary/22) > 100;

-- 14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Descorder.
select emp_no, e_name
from vk_employee 
--where job in ('CLERK', 'ANALYST');
where job = 'CLERK' or job = 'ANALYST';












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

-- 15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority. 
select emp_no, e_name, hire_date
from vk_employee ve 
where hire_date in ('1981-05-01','1981-12-03','1981-12-17','1980-01-19');

-- 16. List the emp who are working for the Deptno 10 or20.
select emp_no, e_name, dept_no
from vk_employee ve 
where dept_no = 10 OR dept_no = 20;
 
-- 17. List the emps who are joined in the year 81. 
select emp_no, e_name, dept_no, hire_date
from vk_employee ve 
--where hire_date between '1981-01-01' and '1981-12-31';
where extract(year from hire_date) = 1981;

-- 18. List the emps who are joined in the month of Aug 1980. 
select emp_no, e_name, dept_no, hire_date
from vk_employee ve 
where hire_date between '1980-08-01' and '1980-08-31';

SELECT emp_no, e_name, dept_no, hire_date
FROM vk_employee
WHERE EXTRACT(YEAR FROM hire_date) = 1980
  AND EXTRACT(MONTH FROM hire_date) = 8;

-- 19. List the emps Who Annual sal ranging from 22000 and 45000.
select emp_no, e_name, salary*12 as Annual_Sal
from vk_employee ve 
where salary*12 between 22000 and 45000;

-- 20. List the Enames those are having five characters in their Names.
select e_name
from vk_employee ve 
where length(e_name) = 5;
 

-- 21. List the Enames those are starting with ‘S’ and with five characters. 
select e_name
from vk_employee ve
where e_name like 'S%' and length(e_name) = 5;

-- 22. List the emps those are having four chars and third character must be ‘r’. 
select e_name
from vk_employee ve
where e_name like '__R_';

-- 23. List the Five character names starting with ‘S’ and ending with ‘H’. 
select e_name
from vk_employee ve
where e_name like 'S%%H';

-- 24. List the emps who joined in January. 
select emp_no, e_name, dept_no, hire_date
from vk_employee ve
where extract(month from hire_date) = 01; 

-- 25. List the emps who joined in the month of which second character is ‘a’.
SELECT emp_no, e_name, dept_no, hire_date, TO_CHAR(hire_date, 'Month') as month
FROM vk_employee
WHERE TO_CHAR(hire_date, 'Month') ILIKE '_a%'
order by month;


-- 26. List the emps whose Sal is four digit number ending with Zero.
 select *
 from Vk_employee
 where salary between 1000 and 9999
 and salary % 10 = 0;

-- 27. List the emps whose names having a character set ‘ll’ together. 
 select *
 from Vk_employee
 where e_name like '%LL%';

-- 28. List the emps those who joined in 80’s. 
select *
from vk_employee ve 
where extract(year from hire_date) between 1980 and 1989;

-- 29. List the emps who does not belong to Deptno 20.
select *
from vk_employee
where dept_no != 20;

-- 30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of
select *
from vk_employee
where job != 'PRESIDENT'
order by mgrs;

-- 31. List all the emps who joined before or after 1981. 
select *
from vk_employee ve 
where extract(year from hire_date) != 1981;

-- 32. List the emps whose Empno not starting with digit78. 
select * 
from vk_employee ve 
where emp_no::text not like '78%';

-- 33. List the emps who are working under ‘MGR’. 
select * 
from vk_employee ve 
where job = 'MANAGER';

-- 34. List the emps who joined in any year but not belongs to the month of December. 
select *
from vk_employee ve 
where extract(month from hire_date) != 12;

-- 35. List all the Clerks of Deptno 20. 
select * 
from vk_employee ve 
where job = 'CLERK' and dept_no = 20;

-- 36. List the emps of Deptno 30 or 10 joined in the year 1981. 
select * 
from vk_employee ve 
where extract(year from hire_date) = 1981 and dept_no in (10,30);

-- 37. Display the details of SMITH. 
select *
from vk_employee ve 
where e_name = 'SMITH';

select * from vk_dept vd ;

-- 38. Display the location of SMITH. 

/* 39. List the total information of EMP table along with DNAME and
	Loc of all the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno. */

/* 40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and‘ANALYST’ working in New York, Dallas with an exp more than 7
	years without receiving theComm asc order of Loc. */

/* 41. Display the Empno, Ename, Sal, Dname, Loc, Deptno,Job of all emps
	working at CHICAGO or working for ACCOUNTING dept with AnnSal>28000, 
	but the Sal should not be=3000 or 2800 who doesn’t belongs to the 
	Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order 
	of Deptno and desc orderof job. */

-- 42. Display the total information of the emps along with Grades in the asc


-- 43. List all the Grade2 and Grade 3 emps. 
select emp_no, e_name, grade
from vk_employee ve 
where grade in (2,3);


--44. Display all Grade 4,5 Analyst and Mgr. 
select *
from vk_employee ve
where grade in (4,5) and (job = 'ANALYST' or job = 'MANAGER');

-- 45. List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of emps working for Dept10 or20.
select emp_no, e_name, salary,  

/*46. List all the information of emp with Loc and the Grade of all the emps belong to the Grade range from 2 to 4 working at the Dept those are
	not starting with char set ‘OP’ and not ending with ‘S’ with the designation having a char ‘a’ any where joined in the year 1981 but
	not in the month of Mar or Sep and Sal not end with ‘00’ in the asc order of Grades
*/

-- 47. List the details of the Depts along with Empno, Ename or without the emps

-- 48. 48. List the details of the emps whose Salaries more than the employee BLAKE. 
select *
from vk_employee ve 
where salary > (select ve.salary 
				from vk_employee
				where e_name = 'BLAKE');

-- 49. List the emps whose Jobs are same as ALLEN. 
select e_name
from vk_employee ve 
where job = (select job
			from vk_employee 
			where e_name = 'ALLEN');
		

-- 50. List the emps who are senior to King. 
select e_name, hire_date
from vk_employee
where hire_date  < (select  hire_date
					from vk_employee 
					where e_name = 'KING');

-- 51. List the Emps who are senior to their own MGRS. 

-- 52. List the Emps of Deptno 20 whose Jobs are same as Deptno10.
select e_name , job
from vk_employee
where dept_no = 20 
	and job in (
				select job 
				from vk_employee
				where dept_no = 10 );
			
-- 53. List the Emps whose salary is same as FORD and SMITH in desc order of salary.
select e_name, salary
from vk_employee
where salary in (
				select salary 
				from vk_employee
				where e_name in ('FORD','SMITH'))
order by salary desc;

-- 54. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
 select e_name, job, salary
from vk_employee
where job = (select job 
			 from vk_employee 
			 where e_name = 'MILLER') 
			 or 
	  salary > (select salary 
				from vk_employee 
				where e_name = 'ALLEN');

-- 55. List the Emps whose Sal is > the total remuneration of the SALESMAN. 

-- 56. List the emps who are senior to BLAKE working at CHICAGO & BOSTON. 

/*57. List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and
	RESEARCH whose Sal is more than ALLEN and exp more than
	SMITH in the asc order of EXP. */

-- 58. List the emps whose jobs same as SMITH or ALLEN. 

-- 59. Write a Query to display the details of emps whose Sal is same as of Any jobs of deptno 10 those that are not found in deptno 20.


















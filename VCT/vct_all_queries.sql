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

-- 30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of salaries
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
join vk_dept vd 
on vd.dept_no = ve.dept_no
where e_name = 'SMITH';


-- 38. Display the location of SMITH. 
select ve.e_name, vd.loc
from vk_employee ve  
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where ve.e_name = 'SMITH';


/* 39. List the total information of EMP table along with DNAME and
	Loc of all the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno. */
select *
from vk_employee ve 
left join vk_dept vd 
on
vd.dept_no = ve.dept_no
where d_name IN ('ACCOUNTING', 'RESEARCH');

/* 40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and‘ANALYST’ working in New York, Dallas with an exp more than 7
	years without receiving theComm asc order of Loc. */
select emp_no, e_name, salary, d_name
from vk_employee ve 
left join vk_dept vd 
on
vd.dept_no = ve.dept_no
where job in ('MANAGER', 'ANALYST') and loc = 'NEWYORK' and extract(year from age(current_date, hire_date)) >7;

/* 41. Display the Empno, Ename, Sal, Dname, Loc, Deptno,Job of all emps working at CHICAGO or working for ACCOUNTING dept with AnnSal>28000, 
	but the Sal should not be=3000 or 2800 who doesn’t belongs to the 	Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order 
	of Deptno and desc orderof job. */
select emp_no, e_name, salary, d_name, loc, ve.dept_no, job
from vk_employee ve 
left join vk_dept vd 
on
vd.dept_no = ve.dept_no
where 
(loc = 'CHICAGO' or d_name = 'ACCOUNTING')
and salary not in (3000, 2800) 
and salary*12 > 28000 
and (mgrs::text like '__7%' or mgrs::text like '__8%')
order by dept_no, job desc;

-- 42. Display the total information of the emps along with Grades in the asc
select *
from vk_employee ve 
left join vk_dept vd 
on
vd.dept_no = ve.dept_no
order by grade;


-- 43. List all the Grade2 and Grade 3 emps. 
select emp_no, e_name, grade
from vk_employee ve 
where grade in (2,3);


--44. Display all Grade 4,5 Analyst and Mgr. 
select *
from vk_employee ve
where grade in (4,5) and (job in ('ANALYST' , 'MANAGER');

-- 45. List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of emps working for Dept10 or20.
select emp_no, e_name, salary,d_name, grade, extract(year from age(current_date, hire_date)) exp, salary*12 as AnnSal, ve.dept_no
from vk_employee ve
left join vk_dept vd 
on
vd.dept_no = ve.dept_no
where ve.dept_no in (10,20);

/*46. List all the information of emp with Loc and the Grade of all the emps belong to the Grade range from 2 to 4 working at the Dept those are
	not starting with char set ‘OP’ and not ending with ‘S’ with the designation having a char ‘a’ any where joined in the year 1981 but
	not in the month of Mar or Sep and Sal not end with ‘00’ in the asc order of Grades
*/
select *
from vk_employee ve 
left join vk_dept vd 
on
vd.dept_no = ve.dept_no
where grade between 2 and 4
and (d_name not like 'OP%' and d_name not like '%S')
and job like '%A%'
and extract(year from hire_date) = 1981
and extract(month from hire_date) not in (3,9)
and salary:: text not like '%00'
order by grade;

-- 47. List the details of the Depts along with Empno, Ename or without the emps
select d_name, emp_no, e_name
from vk_employee ve 
full join vk_dept vd 
on
vd.dept_no = ve.dept_no

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
select e.e_name as emp_name, e.hire_date as emp_date, m.e_name as mgr_name, m.hire_date as mgr_date
from vk_employee e
left join vk_employee m
on e.mgrs = m.emp_no
where e.hire_date < m.hire_date ;

-- 52. List the Emps of Deptno 20 whose Jobs are same as Deptno10.
select e_name , job, dept_no
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
select e_name , salary
from vk_employee
where salary > (
				select sum(salary) as totalSal
				from vk_employee
				where job = 'SALESMAN'
				);

-- 56. List the emps who are senior to BLAKE working at CHICAGO & BOSTON. 
select e_name, emp_no, hire_date, loc
from vk_employee ve 
full join vk_dept vd 
on
vd.dept_no = ve.dept_no
where hire_date < (select hire_date from vk_employee ve2 where e_name = 'BLAKE')
	and loc in ('CHICAGO', 'BOSTON');

/*57. List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and
	RESEARCH whose Sal is more than ALLEN and exp more than
	SMITH in the asc order of EXP. */
select emp_no, e_name, grade, d_name, salary
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where grade in (3,4)
	and d_name in ('ACCOUNTING', 'RESEARCH')
	and salary > (select salary from vk_employee ve2 where e_name = 'ALLEN')
	and hire_date < (select hire_date from vk_employee where e_name = 'SMITH')
order by hire_date;

-- 58. List the emps whose jobs same as SMITH or ALLEN. 
select e_name, job
from vk_employee
where job in (
				select job 
				from vk_employee
				where e_name in ('ALLEN', 'SMITH')
				);


-- 59. Write a Query to display the details of emps whose Sal is same as of Any jobs of deptno 10 those that are not found in deptno 20.
select emp_no, e_name, job, salary, dept_no
from vk_employee
where salary in  (
				  select salary 
				  from vk_employee
				  where dept_no = 10 
				  
				  and 
				  
				  salary not in (
				  				  select salary
				  				  from vk_employee
				  				  where dept_no = 20)
				  );
				  
-- 60. List of emps of emp1 who are not found in emp2. 
select ve1.emp_no, ve1.e_name
from vk_employee ve1
where ve1.e_name not in (
select ve2.e_name
from vk_employee ve2
);
				  
-- 61. Find the highest sal of EMP table.
select max(salary) from vk_employee;
				  
-- 62. Find details of highest paid employee. 
select *
from vk_employee
order by salary desc limit 1;
				  
-- 63. Find the highest paid employee of sales department. 
select *
from vk_employee
where dept_no = 30
order by salary desc limit 1;
				  
-- 64. List the most recently hired emp of grade3 belongs to location CHICAGO.
select *
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where grade = 3 and loc = 'CHICAGO'
order by hire_date desc limit 1;
 
-- 65. List the employees who are senior to most recently hired employee working under king. 
select e_name,emp_no, hire_date
from vk_employee
where hire_date < (	select hire_date 
				   	from vk_employee ve 
					where mgrs = 7839 
					order by hire_date desc limit 1);
				  
/*66. List the details of the employee belongs to newyork with grade 3 to 5 except ‘PRESIDENT’ 
whose sal> the highest paid employee of Chicago in a group 
where there is manager and salesman not working under king*/
select *
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where grade between 3 and 5
	and loc = 'NEWYORK'
	and job != 'PRESIDENT'
	and salary > ( 	select max(salary) 
					from vk_employee ve
					join vk_dept vd on vd.dept_no = ve.dept_no 
					where loc = 'CHICAGO' )
	and mgrs = 7839 
	and job not in ('MANAGER', 'SALESMAN');
	

-- 67. List the details of the senior employee belongs to 1981. 
select *
from vk_employee ve 
where extract(year from hire_date) = '1981'
order by hire_date limit 1;

--68. List the employees who joined in 1981 with the job same as the most seniorperson of the year 1981.
select e_name , job, hire_date 
from vk_employee
where extract(year from hire_date)= '1981' 
and 
job = (
		select job	
		from vk_employee
		where extract(year from hire_date) = '1981'
		order by hire_date limit 1
	 );

--69. List the most senior empl working under the king and grade is more than 3.
select emp_no, e_name, mgrs, hire_date, grade
from vk_employee
where mgrs = 7839 and grade > 3
order by hire_date limit 1 ;

-- 70. Find the total sal given to the MGR. 
select job, sum(salary)
from vk_employee ve 
where job = 'MANAGER'
group by job;

-- 71. Find the total annual sal to distribute job wise in the year 81.
 select job, extract(year from hire_date) as Yr, sum(salary*12)
 from vk_employee ve 
 where extract(year from hire_date) = 1981
 group by job, Yr;

-- 72. Display total sal employee belonging to grade 3.
select grade , sum(salary) total_Sal from vk_employee where grade = 3 group by grade ;

-- 73. Display the average salaries of all the clerks. 
select job, avg(salary) avg_Sal
from vk_employee ve 
where job = 'CLERK'
group by job;

-- 74. List the employeein dept 20 whose sal is >the average sal 0f dept 10 emps. 
select e_name
from vk_employee ve 
where dept_no = 20 
and 
salary > (
		  select avg(salary)
		  from vk_employee
		  where dept_no = 10
		  );

-- 75. Display the number of employee for each job group deptno wise. 
select dept_no ,job ,count(*)
from vk_employee
group by dept_no, job;

-- 76. List the manager no and the number of employees working for those mgrs in the ascending Mgrno. 
select mgrs, count(emp_no)
from vk_employee
group by mgrs 
order by mgrs;

-- 77. List the department,details where at least two emps are working
select d_name, ve.dept_no, loc
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
group by d_name, ve.dept_no, loc
having count(d_name) >= 2;

-- 78. Display the Grade, Number of emps, and max sal of each grade.
select grade, count(emp_no) no_emps, max(salary) as max_Sal
from vk_employee ve 
group by grade;

-- 79. Display dname, grade, No. of emps where at least two emps are clerks. 
select d_name, grade 
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where job = 'CLERK'
group by d_name, grade 
having count(emp_no) >= 2;

-- 80. List the details of the department where maximum number of emps are working. 
select d_name, count(ve.emp_no) as emp_count
from vk_employee ve 
join vk_dept vd 
on vd.dept_no = ve.dept_no
group by d_name
order by emp_count desc limit 1;


--81. Display the emps whose manager name is jones. 
select emp_no, e_name, mgrs
from vk_employee ve 
where mgrs = (select emp_no from vk_employee where e_name = 'JONES');

-- 82. List the employees whose salary is more than 3000 after giving 20% increment. 
select emp_no, e_name, salary, salary+(salary*0.2) increment_Sal
from vk_employee ve 
where salary+(salary*0.2) > 3000;

-- 83. List the emps with dept names. 
select e_name, d_name 
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where d_name is not null;

-- 84. List the emps who are not working in sales dept.
select e_name, d_name 
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where d_name != 'SALES'

-- 85. List the emps name ,dept, sal and comm. For those whose salary is between 2000 and 5000 while loc is Chicago. 
select e_name, d_name , salary, comm, loc
from vk_employee ve 
join vk_dept vd 
on
vd.dept_no = ve.dept_no
where salary between 2000 and 5000
and loc = 'CHICAGO';

-- 86. List the emps whose sal is greater than his managers salary
select ve.e_name, ve.salary, vm.e_name as Manager, vm.salary as Mgr_salary
from vk_employee ve 
join vk_employee vm
on ve.mgrs = vm.mgrs
where ve.salary > vm.salary;


-- 87. List the grade, EMP name for the deptno 10 or deptno 30 but sal grade is not 4 while they joined the company before ’31-dec-82’.
select grade, e_name, dept_no, salary, hire_date
from vk_employee ve 
where dept_no in (10,30)
	and grade != 4
	and hire_date < '1982-12-31';

-- 88. List the name ,job, dname, location for those who are working as MGRS. 
select e_name, job, d_name, loc
from vk_employee ve 
join vk_dept vd 
on vd.dept_no = ve.dept_no
where job = 'MANAGER';

-- 89. List the emps whose mgr name is jones and also list their manager name. 
select ve.emp_no, ve.e_name, vm.emp_no as Mgr_no, vm.e_name Mgr_name
from vk_employee ve 
join vk_employee vm
on ve.mgrs = vm.mgrs 
where vm.e_name = 'JONES';

-- 90. List the name and salary of ford if his salary is equal to his sal of his grade. 
select e_name, salary , grade
from vk_employee ve  
where e_name = 'FORD'
and salary = (select round(avg(salary)) from vk_employee 
where grade = (select grade from vk_employee where e_name = 'FORD'));

-- 91. List the name, job, dname ,sal, grade dept wises
select e_name, job, d_name, salary, grade
from vk_employee ve 
join  vk_dept vd 
on ve.dept_no = vd.dept_no 
order by d_name;	

-- 92. List the emp name, job, sal, grade and dname except clerks and sort on the basis of highest sal. 
select e_name, job, salary, grade, d_name
from vk_employee ve 
join vk_dept vd 
on vd.dept_no = ve.dept_no 
where job != 'CLERK' 
order by salary desc;

-- 93. List the emps name, job who are with out manager. 
select e_name, job
from vk_employee ve 
where mgrs is null;

-- 94. List the names of the emps who are getting the highest sal dept wise. 
select e_name, dept_no, grade ,max(salary) highest_Sal
from vk_employee ve 
where grade = 1
group by e_name, dept_no, grade
order by dept_no ;	
-- 95. List the emps whose sal is equal to the average of max and minimum
select e_name
from vk_employee
where salary = (select round((max(salary) + min(salary))/2.0,2) from vk_employee);

-- 96. List the no. of emps in each department where the no. is more than 3. 
select ve.dept_no, count(*) from vk_employee ve group by ve.dept_no having count(*)>3;

-- 97. List the names of depts. Where atleast 3 are working in that department.
select d_name, ve.dept_no, count(emp_no)
from vk_employee ve 
join vk_dept vd 
on vd.dept_no = ve.dept_no 
group by d_name, ve.dept_no having count(emp_no)>3; 

-- 98. List the managers whose sal is more than his employess avg salary. 
select distinct m.emp_no, m.e_name, m.salary
from vk_employee m
join vk_employee e 
on m.emp_no = e.mgrs 
group by m.emp_no, m.e_name, m.salary
having m.salary > avg(e.salary);

-- 99. List the name,salary,comm. For those employees whose net pay is greater than or equal to any other emp salary of the company.
select e_name, salary, comm
	

-- 100. List the emp whose sal < his manager but more than any other manager. 
select e.emp_no, e.e_name, e.salary
from vk_employee e
join vk_employee m
on e.mgrs = m.emp_no 
where e.salary < m.salary 
and e.salary > any(select salary from vk_employee where emp_no in (select distinct mgrs from vk_employee) and emp_no != m.emp_no);

-- 101. List the employee names and his average salary department wise. 
select e.e_name, e.dept_no, d.avg_salary   
from vk_employee e 
join (select e.dept_no, round(avg(salary)) as avg_salary from vk_employee e group by e.dept_no) d
on e.dept_no = d.dept_no
order by dept_no;

-- 102. Find out least 5 earners of the company. 
select e_name, salary
from vk_employee ve 
order by salary limit 5;

-- 103. Find out emps whose salaries greater than salaries of their managers. 
select e.e_name emp_name, e.salary emp_sal, m.e_name mgr_name, m.salary mgr_sal
from vk_employee e
join vk_employee m
on e.mgrs = m.emp_no
where e.salary > m.salary;

-- 104. List the managers who are not working under the president. 
select e_name
from vk_employee ve 
where job = 'MANAGER' and mgrs not in (select emp_no from vk_employee where job = 'PRESIDENT');

-- 105. List the records from emp whose deptno is not in dept.
select *
from vk_employee ve 
left join vk_dept vd 
on ve.dept_no = vd.dept_no 
where vd.dept_no is null;

-- 106. List the Name , Salary, Comm and Net Pay is more than any other employee. 
select e_name, salary, comm , (salary + coalesce(comm, 0)) as net_pay
from vk_employee ve  
order by net_pay desc limit 1;

-- 107. List the Enames who are retiring after 31-Dec-89 the max Job period is 20Y. 
select * , (hire_date + interval '20 years') as aft_20_yrs from vk_employee ve 
where  hire_date + interval '20 years' > to_date('31-DEC-1989', 'DD-MON-YYYY');

-- 108. List those Emps whose Salary is odd value. 
select e_name, salary
from vk_employee ve 
where (salary%2) = 1;

-- 109. List the emp’s whose Salary contain 3 digits.
select e_name, salary
from vk_employee ve 
where salary between 100 and 999;
 
-- 110. List the emps who joined in the month of DEC.
select *
from vk_employee ve 
where extract(month from hire_date) = 12;
 
-- 111. List the emps whose names contains ‘A’. 
select *
from vk_employee
where e_name like '%A%';

-- 112. List the emps whose Deptno is available in his Salary.


-- 113. List the emps whose first 2 chars from Hiredate=last 2 characters of Salary. 
select * from (
select e_name,
hire_date, substr(to_char(hire_date, 'YYYY-MM-DD'),1, 2) as first_2_char,
salary , substr(salary::text, length(salary::text) -1 , 2) as last_2_char
from vk_employee ve 
) as dummy_table where first_2_char = last_2_char;

-- 114. List the emps Whose 10% of Salary is equal to year of joining. 
select * 
from (
	select e_name, 
			salary, 
			round(salary * 10/100) as sal_10_per,
			hire_date, 
			extract(year from hire_date) as year_date 
			from vk_employee
			) as dummy_table
where sal_10_per = year_date;

-- 115. List first 50% of chars of Ename in Lower Case and remaining are upper Case

-- 116. List the Dname whose No. of Emps is = to number of chars in the Dname.
select d.d_name, count(*)
from vk_employee e
join vk_dept d
on e.dept_no = d.dept_no 
group by d.d_name 
having count(*) = length(trim(d.d_name))  ;

-- 117. List the emps those who joined in company before 15 th of the month. 
select e_name, hire_date
from vk_employee
where extract(day from hire_date) <15;

-- 118. List the Dname, no of chars of which is = no. of emp’s in any other Dept. 


-- 119. List the emps who are working as Managers. 
select e_name from vk_employee ve where job='MANAGER';

-- 120. List THE Name of dept where highest no.of emps are working. 
select d.d_name, count(*)
from vk_employee e
join vk_dept d
on e.dept_no = d.dept_no 
group by d.d_name 
order by count(*) desc limit 1;

-- 121. Count the No.of emps who are working as ‘Managers’(using set option). 
select count(*) as mgr_count
from (
	select emp_no from vk_employee ve 
	intersect
	select mgrs from vk_employee ve 
);

-- 122. List the emps who joined in the company on the same date.
select e_name, hire_date
from vk_employee 
where hire_date = (select hire_date from vk_employee group by hire_date having count(hire_date)>1);

select e.e_name from vk_employee e join vk_employee e1 on e.hire_date = e1.hire_date WHERE
e.emp_no <> e1.emp_no;

-- 123. List the details of the emps whose Grade is equal to one tenth of Sales Dept. 
select e_name, grade
from vk_employee where grade in (select distinct round(dept_no/10)
from vk_dept where d_name = 'sales');

-- 124. List the name of the dept where more than average no. of emps are working.
with no_of_emp_in_dept as (
	select dept_no, count(emp_no) as emp_count 
	from vk_employee e 
	group by dept_no
),
avg_emp as (
	select avg(emp_count) as avg_count
	from no_of_emp_in_dept 
)
select d.d_name, emp_count
from vk_dept d 
join no_of_emp_in_dept n on d.dept_no = n.dept_no 
where n.emp_count > (select avg_count from avg_emp);
------------------------------------------------------------------
select d_name, count(*) 
from vk_employee e 
join vk_dept d on e.dept_no = d.dept_no 
group by d_name 
having count(*) > (select round(count(*)/count(distinct dept_no)) as avg_no_emp_in_dept from vk_employee);


-- 125. List the Managers name who are having max no.of emps working under him. 
with no_emp_mgr as (
	select mgrs , count(emp_no) as emp_count
	from vk_employee e
	where mgrs is not null
	group by mgrs
	)
select e.emp_no, e.e_name, emp_count
from vk_employee e 
join no_emp_mgr n on n.mgrs = e.emp_no
where n.emp_count = (
    select max(emp_count)
    from no_emp_mgr) ;

-- 126. List the Ename and Sal is increased by 15% and expressed as no.of Dollars. 
select 
    e_name,
    salary,
    round(salary * 1.15, 2) as increased_salary,
    concat('$', round(salary * 1.15, 2)) as salary_in_dollars
from vk_employee;

-- 127. Produce the output of EMP table ‘EMP_AND_JOB’ for Ename and Job. 
select e_name , job , concat(e_name,'_AND_',job) from vk_employee;

/* 128. Produce the following output from EMP.
					EMPLOYEE
					SMITH (clerk)
					ALLEN(Salesman)
*/
select concat(e_name, ' ( ', job, ' )') as concat_emp_dept from vk_employee;

-- 130. List the emps with Hire date in format June 4, 1988. 
select e_name,
	   to_char(hire_date, 'Month DD, YYYY') as f_hire_date
from vk_employee ;
 
/* 131)Print a list of emp’s Listing ‘just salary’ if Salary is more than 1500, 
 on target if Salary is 1500 and ‘Below 1500’ if Salary is less than 1500.*/
select e_name, salary,
	case 
		when salary > 1500 then 'Just Salary'
		when salary = 1500 then 'On target'
		else 'Below 1500'
	end salary_analysis
from vk_employee;

-- 132. Write a query which return the day of the week for any date entered in format‘DD-MM-YY’. 
select e_name, hire_date, to_char(hire_date, 'Day') as day_of_week from vk_employee;

-- 133. Write a query to calculate the length of service of any employee with thecompany, use DEFINE to avoid repetitive typing of functions.


/* 134. Give a string of format ‘NN/NN’, verify that the first and last two characters are numbers and that the middle character is’/’. Print the
	expression ‘YES’ if valid, ‘NO’ if not valid. Use the following values to test your solution. ‘12/34’,’01/1a’, ‘99/98’. */
select 
    test_value,
    case 
        when test_value ~ '^[0-9]{2}/[0-9]{2}$' then 'YES'
        else 'NO'
    end as is_valid
from (
    values 
        ('12/34'),
        ('01/1a'),
        ('89/98')
) as t(test_value);


/* 135. Emps hired on or before 15th of any month are paid on the last Friday of that month those hired after 15th are paid on the 
	first Friday of the following month. Print a list of emps their hire date and the first pay date. sort on hire date.*/
select 
    emp_no,
    e_name,
    hire_date,
    case
        when extract(day from hire_date) <= 15 then 
            -- Last Friday of the same month
            (
                date_trunc('month', hire_date) 
                + interval '1 month' - interval '1 day'
            ) 
            - ((extract(dow from (date_trunc('month', hire_date) + interval '1 month' - interval '1 day'))::int + 2) % 7)
            * interval '1 day'
        else
            -- First Friday of the next month
            (
                date_trunc('month', hire_date) 
                + interval '1 month'
            ) 
            + ((5 - extract(dow from (date_trunc('month', hire_date) + interval '1 month'))) % 7)
            * interval '1 day'
    end as first_pay_date
from vk_employee
order by hire_date;


-- 136. Count the no. of characters without considering spaces for each name. 
select e_name, trim(e_name), length(trim(e_name)) as len_without_space from vk_employee;

-- 137. Find out the emps who are getting decimal value in their Sal without using like operator. 
select * from vk_employee where MOD(Salary, 1) <> 0;

-- 138. List those emps whose Salary contains first four digit of their Deptno
select 
    emp_no,
    e_name,
    dept_no,
    salary
from vk_employee
where salary::text like '%' || substring(dept_no::text from 1 for 2) || '%';

-- 139. List those Managers who are getting less than his emps Salary. 
select 
	m.e_name as mgr_name,
	m.salary as mgr_sal,
	e.e_name as emp_name,
	e.salary as emp_sal
from vk_employee e
join vk_employee m on e.mgrs = m.emp_no 
where m.salary < e.salary;

-- 140. Print the details of all the emps who are sub-ordinates to Blake.
select 
	emp_no,
	e_name,
	mgrs,
	salary
from vk_employee ve 
where mgrs = (select emp_no from vk_employee where e_name = 'BLAKE');

-- 141. List the emps who are working as Managers using co-related sub- query.
select 
	e_name,
	emp_no
from vk_employee e 
where exists (select mgrs from vk_employee m where m.mgrs = e.emp_no  );

-- 142. List the emps whose Mgr name is ‘Jones’ and also with his Manager name.
select 
	e.e_name as emp_name,
	m.e_name as mgr_name,
	mm.e_name as mgrs_mgr_name
from vk_employee e
join vk_employee m on m.emp_no = e.mgrs 
join vk_employee mm on mm.emp_no = m.mgrs
where m.e_name = 'JONES';

/* 143. Define a variable representing the expression used to calculate on emps total annual remuneration use the variable in a statement, 
	which finds all emps who can earn 30000 a year or more. */
with params as (select 3000 as annual_limit)
select 
	 e.e_name,
	 e.salary, 
	(e.salary * 12) as annual_salary,
	case
		when (e.salary*12) > p.annual_limit then 'Above 3000'
		else 'Below 3000'
	end as salary_cat
from vk_employee e
cross join params p;

-- 144. Find out how may Managers are their in the company. 
select count(*) as count_of_mgr 
from vk_employee 
where job = 'MANAGER' 
group by job;

-- 145. Find Average salary and Average total remuneration for each Job type.Remember Salesman earn commission.

-- 146. Check whether all the emps numbers are indeed unique. 
select emp_no , count(*) as duplicate 
from vk_employee  
group by emp_no 
having count(*) > 1;

-- 147. List the emps who are drawing less than 1000 Sort the output by Salary.
select 
	e_name,
	salary
from vk_employee
where salary < 1000
order by salary;

-- 148. List the employee Name, Job, Annual Salary, deptno, Dept name and grade who earn 36000 a year or who are not CLERKS. 
select 
	e.e_name,
	e.job,
	(e.salary*12) as AnnSal,
	e.dept_no,
	d.d_name,
	e.grade
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no 
where e.salary*12 > 36000 and e.job != 'CLERK';

-- 149. Find out the Job that was filled in the first half of 1983 and same job that was filled during the same period of 1984. 
(
    select distinct job
    from vk_employee
    where hire_date between '1983-01-01' and '1983-06-30'
)
intersect
(
    select distinct job
    from vk_employee
    where hire_date between '1984-01-01' and '1984-06-30'
);


-- 150. Find out the emps who joined in the company before their Managers. 
select 
	e.e_name as emp_name,
	e.hire_date as emp_hire_date,
	m.e_name as mgr_name,
	m.hire_date as mgr_hire_date
from vk_employee e
join vk_employee m on e.mgrs = m.emp_no 
where e.hire_date < m.hire_date ;

-- 151. List all the emps by name and number along with their Manager’s name and number. Also List KING who has no ‘Manager’. 
select 
	e.emp_no as emp_no,
	e.e_name as emp_name,
	m.emp_no as mgr_no,
	m.e_name as mgr_name	
from vk_employee e
left join vk_employee m on e.mgrs = m.emp_no ;

-- 152. Find all the emps who earn the minimum Salary for each job wise in ascending order.
with ranked_sal as (
	select
		e_name,
		job,
		salary,
		dense_rank() over (partition by job order by salary) as rnk
	from vk_employee
)
select 
	e_name,
	job,
	salary
from ranked_sal 
where rnk = 1
order by job, salary;

-- 153. Find out all the emps who earn highest salary in each job type. Sort in descending salary order.
with ranked_sal as (
	select
		e_name,
		job,
		salary,
		dense_rank() over (partition by job order by salary desc) as rnk
	from vk_employee
)
select 
	e_name,
	job,
	salary
from ranked_sal 
where rnk = 1
order by salary desc;

-- 154. Find out the most recently hired emps in each Dept order by Hiredate. 
with recent_hire as (
	select
		e_name,
		job,
		hire_date,
		dense_rank() over (partition by job order by hire_date desc) as rnk
	from vk_employee
)
select 
	e_name,
	job,
	hire_date
from recent_hire 
where rnk = 1
order by hire_date desc;

-- 155. List the employee name,Salary and Deptno for each employee who earns salary greater than the average for their department order by Deptno. 
with avg_dept_sal as (
	select 
		dept_no,
		round(avg(salary)) as avgSal
	from vk_employee 
	group by dept_no 
	order by dept_no
)
select 
	e.e_name,
	e.dept_no,
	e.job,
	e.salary,
	a.avgSal
from avg_dept_sal a 
join vk_employee e 
on a.dept_no = e.dept_no
where e.salary > a.avgSal
order by e.dept_no;

-- 156. List the Deptno where there are no emps. 
select d.dept_no 
from vk_dept d 
left join vk_employee e 
on d.dept_no = e.dept_no 
where e.emp_no is null;

-- 157. List the No.of emp’s and Avg salary within each department for each job. 
select 
	dept_no,
	count(*) as no_of_emp,
	round(avg(salary)) as avgSal
from vk_employee 
group by dept_no 
order by dept_no;

-- 158. Find the maximum average salary drawn for each job except for ‘President’. 
with avg_dept_sal as (
	select 
		job,
		round(avg(salary)) as avgSal
	from vk_employee 
	group by job
	order by job
)
select 
	distinct e.job,
	a.avgSal
from avg_dept_sal a 
join vk_employee e 
on a.job = e.job
where e.job != 'PRESIDENT'
group by e.e_name, e.dept_no,	 e.job, e.salary, a.avgSal
order by e.job;
--
select job, avg(salary) as avg_sal
from vk_employee e where job <> 'president' group by job order by avg_sal desc limit 1;

-- 159. Find the name and Job of the emps who earn Max salary and Commission. 
select 
	e_name, 
	job,
	max(salary) max_salary,
	comm
from vk_employee ve
where comm is not null
group by e_name, job, salary, comm
order by salary desc limit 1;

--
select * from vk_employee  
where salary = (select max(salary) from vk_employee) 
				or comm = (select max(comm) from vk_employee);

-- 160. List the Name, Job and Salary of the emps who are not belonging to the department 10 but who have the same job and Salary as the emps of dept 20. 
select e_name, dept_no , job, salary 
from vk_employee 
where dept_no != 10 
and job in (select job from vk_employee where dept_no = 20) 
and salary in (select salary from vk_employee where dept_no = 20);

-- 161. List the Deptno, Name, Job, Salary and Sal+Comm of the SALESMAN who are earning maximum salary and commission in descending order. 
select 
	dept_no,
	e_name,
	job,
	salary,
	comm,
	salary+comm  t_sal
from vk_employee 
where job = 'SALESMAN'
and salary = (select max(salary) from vk_employee where job = 'SALESMAN' )
or comm = (select max(comm) from vk_employee where job = 'SALESMAN' )
order by comm desc;

-- 162. List the Deptno, Name, Job, Salary and Sal+Comm of the emps who earn the second highest earnings (sal + comm.). 
select
	dept_no,
	e_name,
	job,
	salary,
	salary+comm as t_sal
from vk_employee
order by t_sal
limit 1 offset 1;

-- 163. List the Deptno and their average salaries for dept with the average salary less than the averages for all department
select 
	dept_no,
	round(avg(salary)) as dep_avg_sal
from vk_employee 
group by dept_no 
having avg(salary) < (select avg(salary) from vk_employee);

-- 164. List out the Names and Salaries of the emps along with their manager names and salaries for those emps who earn more salary than their Manager. 
select 
	e.e_name as emp_name,
	e.salary as emp_sal,
	m.e_name as mgr_name,
	m.salary as mgr_sal
from vk_employee e 
join vk_employee m on m.emp_no = e.mgrs 
where e.salary > m.salary;

-- 165. List out the Name, Job, Salary of the emps in the department with the highest average salary. 
select 
	e_name,
	job,
	salary,
	dept_no,
	avg(salary) as avg_d_sal
from vk_employee ve 
group by e_name, job, salary, dept_no 
order by avg_d_sal desc limit 1;

-- 166. List the empno,sal,comm. Of emps. 
select 
	emp_no,
	e_name,
	salary,
	comm
from vk_employee ve ;

-- 167. List the details of the emps in the ascending order of the sal. 
select * from vk_employee order by salary;

-- 168. List the dept in the ascending order of the job and the desc order of the emps print empno, ename.
select
	dept_no,
	emp_no,
	e_name
from vk_employee ve 
order by job, emp_no desc, e_name desc;

-- 169. Display the unique dept of the emps. 
select distinct dept_no from vk_employee ve ;

-- 170. Display the unique dept with jobs.
select distinct dept_no, job from vk_employee;

-- 171. Display the details of the blake. 
select * from vk_employee where e_name = 'BLAKE';

-- 172. List all the clerks. 
select * from vk_employee where job = 'CLERK';

-- 173. list all the employees joined on 1st may 81. 
select * from vk_employee where hire_date = '1981-05-01';

-- 174. List the empno,ename,sal,deptno of the dept 10 emps in the ascending order of salary.
select * from vk_employee where dept_no = 10 order by salary;

-- 175. List the emps whose salaries are less than 3500. 
select * from vk_employee where salary < 3500;

-- 176. List the empno,ename,sal of all the emp joined before 1 apr 81. 
select * from vk_employee where hire_date < '1981-04-01';

-- 177. List the emp whose annual sal is <25000 in the asc order of the salaries. 
select e_name, salary Mon_Sal, salary*12 as Ann_Sal from vk_employee where salary*12 < 25000

-- 178. List the empno,ename,annsal,dailysal of all the salesmen in the asc ann sal
select emp_no, e_name, salary*12 as Ann_sal, salary/30 as daily_sal from vk_employee where job = 'SALESMAN' order by salary*12;

-- 179. List the empno,ename,hiredate,current date & exp in the ascending order of experience.
select emp_no, e_name, hire_date, current_date, extract(year from age(current_date, hire_date) ) exp from vk_employee order by exp;

-- 180. List the emps whose exp is more than 10 years. 
select e_name, extract(year from age(current_date, hire_date) ) exp 
from vk_employee
where extract(year from age(current_date, hire_date) ) > 10;

-- 181. List the empno,ename,sal,TA30%,DA 40%,HRA50%,GROSS,LIC,PF,net,deduction,net allow and net sal in the ascending order of the net salary.

-- 182. List the emps who are working as managers. 
select e_name, job from vk_employee ve where job = 'MANAGER';

-- 183. List the emps who are either clerks or managers. 
select e_name, job from vk_employee ve where job in ('MANAGER' , 'CLERK');

-- 184. List the emps who have joined on the following dates 1 may 81,17 nov 81,30 dec 81
select e_name, hire_date from vk_employee ve where hire_date in ('1981-05-01', '1981-11-17', '1981-12-30' );

-- 185. List the emps who have joined in the year 1981. 
select e_name, extract(year from hire_date) hire_year from vk_employee ve where extract(year from hire_date) = 1981;

-- 186. List the emps whose annual sal ranging from 23000 to 40000. 
select e_name, salary*12 as Ann_sal from vk_employee where salary*12 between 23000 and 40000;

-- 187. List the emps working under the mgrs 7369,7890,7654,7900. 
select e_name, mgrs from vk_employee ve where mgrs in (7369,7890,7654,7900);

-- 188. List the emps who joined in the second half of 82. 
select e_name, hire_date from vk_employee where hire_date >= '1982-06-01' and hire_date <= '1982-12-31';

-- 189. List all the 4char emps. 
select e_name from vk_employee ve where e_name like '____';

-- 190. List the emp names starting with ‘M’ with 5 chars. 
select e_name from vk_employee ve where e_name like 'M_____';

-- 191. List the emps end with ‘H’ all together 5 chars. 
select e_name from vk_employee ve where e_name like '____H';

-- 192. List names start with ‘M’. 
select e_name from vk_employee ve where e_name like 'M%';

-- 193. List the emps who joined in the year 81.
select e_name, extract(year from hire_date) hire_year from vk_employee ve where extract(year from hire_date) = 1981; 

-- 194. List the emps whose sal is ending with 00. 
select e_name, salary from vk_employee where salary::text like '%00';

-- 195. List the emp who joined in the month of JAN. 
select e_name, to_char(hire_date, 'Month') as hire_month from vk_employee ve where extract(month from hire_date) = 01; 

-- 196. Who joined in the month having char ‘a’.
 select e_name, to_char(hire_date, 'Month') as hire_month from vk_employee ve where to_char(hire_date, 'Month') like '%a%';

-- 197. Who joined in the month having second char ‘a’ 
select e_name, to_char(hire_date, 'Month') as hire_month from vk_employee ve where to_char(hire_date, 'Month') like '_a%';

-- 198. List the emps whose salary is 4 digit number.
 select e_name, salary from vk_employee where salary::text like '____';

-- 199. List the emp who joined in 80’s. 
select e_name, extract(year from hire_date) hire_year from vk_employee ve where extract(year from hire_date) = 1980;

-- 200. List the emp who are clerks who have exp more than 8ys. 
select e_name, job, extract(year from age(current_date, hire_date) ) exp 
from vk_employee
where extract(year from age(current_date, hire_date) ) > 8 and job = 'CLERK';

-- 201. List the mgrs of dept 10 or 20. 
select mgrs, dept_no  from vk_employee where dept_no in (10, 20) order by dept_no;

-- 202. List the emps joined in jan with salary ranging from 1500 to 4000. 
select e_name, salary,  to_char(hire_date, 'Month') as hire_month 
from vk_employee ve 
where extract(month from hire_date) = 01 and salary between 1500 and 4000; 

-- 203. List the unique jobs of dept 20 and 30 in desc order. 
select distinct job , dept_no from vk_employee ve where dept_no in (20,30) order by dept_no desc;

-- 204. List the emps along with exp of those working under the mgr whose number is starting with 7 but should not have a 9 joined before 1983.
select e_name, extract(year from age(current_date, hire_date) ) exp, mgrs, hire_date
from vk_employee 
where mgrs::text like '7%' 
and mgrs::text not like '%9%' 
and extract(year from hire_date) < 1983;

-- 205. List the emps who are working as either mgr or analyst with the salary ranging from 2000 to 5000 and without commission.
select e_name, job, salary
from vk_employee
where job in ('MANAGER', 'ANALYST')
and salary between 2000 and 5000
and comm is null;

-- 206. List the empno,ename,sal,job of the emps with ann sal <34000 but receiving some comm. Which should not be>sal and desg should be sales man workingfor dept 30.
select emp_no, e_name, salary*12  Ann_sal, job, dept_no 
from vk_employee ve 
where salary*12 < 34000
and job = 'SALESMAN' and dept_no = 30;

/* 207. List the emps who are working for dept 10 or 20 with desgs as clerk or analyst with a sal is either 3 or 4 digits with an exp>8ys but does
		not belong to mons of mar,apr,sep and working for mgrs &no is not ending with 88 and 56.*/
select e_name,mgrs, dept_no, job, salary, extract(year from age(current_date, hire_date) ) exp, to_char(hire_date, 'Month') as hire_month
from vk_employee
where dept_no in (20, 30)
and job in ('CLERK', 'ANALYST')
and (salary::text like '___' or salary::text like '____')
and extract(year from age(current_date, hire_date) ) > 8
and (mgrs::text not like '%88' and mgrs::text not like '%56')
and to_char(hire_date, 'Month') not in ('March', 'April', 'September');

/* 208)List the empno,ename,sal,job,deptno&exp of all the emps belongs to dept 10 or 20 with an exp 6 to 10 y working under the same mgr
		with out comm. With a job not ending irrespective of the position with comm.>200 with exp>=7y and sal<2500 but not belongs to the
		month sep or nov working under the mgr whose no is not having digits either 9 or 0 in the asc dept& desc dept */
select e_name,mgrs, dept_no, job, salary, extract(year from age(current_date, hire_date) ) exp, to_char(hire_date, 'Month') as hire_month
from vk_employee
where (
	dept_no in (20, 10)
	and extract(year from age(current_date, hire_date) ) between 6 and 10 
	and (comm is null and comm = 0)
	)
	or
	(
	(comm > 200)
	and extract(year from age(current_date, hire_date)) >= 7
	and salary < 2500
	and to_char(hire_date, 'Mon') not in ('Sep', 'Nov')
	and mgrs::text not like '%9%'
    and mgrs::text not like '%0%'
	)
order by dept_no, emp_no desc;

-- 209. List the details of the emps working at Chicago. 
select *
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no 
where d.loc = 'CHICAGO';

-- 210. List the empno,ename,deptno,loc of all the emps.
select e.emp_no, e.e_name, e.dept_no, d.loc 
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no; 

-- 211. List the empno,ename,loc,dname of all the depts.,10 and 20. 
select e.emp_no, e.e_name, e.dept_no, d.loc , d.d_name
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no 
where e.dept_no in (10,20);

--212. List the empno, ename, sal, loc of the emps working at Chicago dallas with an exp>6ys. 
select e.emp_no, e.e_name, e.salary, e.dept_no, d.loc 
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no
where d.loc in ('CHICAGO', 'DALLAS')
and extract(year from age(current_date, hire_date)) > 6;

-- 213. List the emps along with loc of those who belongs to dallas ,newyork with salranging from 2000 to 5000 joined in 81. 
select e.emp_no, e.e_name, e.salary, e.dept_no, d.loc , e.hire_date
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no
where d.loc in ('NEWYORK', 'DALLAS')
and e.salary between 2000 and 5000
and extract(year from hire_date) = 1981;

-- 214. List the empno,ename,sal,grade of all emps. 
select emp_no, e_name, salary, grade
from vk_employee;

-- 215. List the grade 2 and 3 emp of Chicago. 
select e.emp_no, e.e_name, e.grade, d.loc 
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no
where d.loc = 'CHICAGO'
and e.grade in (2,3);

-- 216. List the emps with loc and grade of accounting dept or the locs dallas orChicago with the grades 3 to 5 &exp >6y
select e.emp_no, e.e_name, e.dept_no, e.grade, d.d_name, d.loc 
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no
where d.d_name = 'ACCOUNTING'
or d.loc in ('CHICAGO', 'DALLAS')  
and e.grade between 3 and 5
and extract(year from age(current_date, hire_date)) > 6;

-- 217. List the grades 3 emps of research and operations depts.. joined after 1987 and whose names should not be either miller or allen. 
select e.emp_no, e.e_name, e.grade, d.d_name, e.hire_date 
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no
where e.grade = 3
and d.d_name in ('RESEARCH', 'OPERATIONS')
and extract(year from hire_date) > 1987
and e.e_name not in ('MILLER', 'ALLEN');

-- 218. List the emps whose job is same as smith.
select e_name, job
from vk_employee ve 
where job = (select job from vk_employee where e_name = 'SMITH');

-- 219. List the emps who are senior to miller.
select e_name, hire_date
from vk_employee ve 
where hire_date < (select hire_date from vk_employee where e_name = 'MILLER');

-- 220. List the emps whose job is same as either allen or sal > allen. 
select e_name, job, salary
from vk_employee ve 
where job = (select job from vk_employee where e_name = 'ALLEN')
or salary >  (select salary from vk_employee where e_name = 'ALLEN');

-- 221. List the emps who are senior to their own manager.
select
	e.emp_no as emp_no,
	e.e_name as emp_name,
	e.hire_date as emp_hiredate,
	m.emp_no as mgr_no,
	m.e_name as mgr_name,
	m.hire_date as mgrs_hiredate
from vk_employee e
join vk_employee m on m.emp_no = e.mgrs 
where e.hire_date < m.hire_date;

-- 222. List the emps whose sal greater than blakes sal. 
select e_name, job, salary
from vk_employee ve 
where salary >  (select salary from vk_employee where e_name = 'BLAKE');

-- 223. List the dept 10 emps whose sal>allen sal. 
select e_name, job, salary, dept_no
from vk_employee ve 
where salary >  (select salary from vk_employee where e_name = 'ALLEN') and dept_no = 10;

-- 224. List the mgrs who are senior to king and who are junior to smith. 
select
	emp_no,
	e_name,
	mgrs, 
	hire_date
from vk_employee 
where hire_date 

-- 225. List the empno,ename,loc,sal,dname,loc of the all the emps belonging to king's dept.
select e.emp_no, e.e_name, e.salary,e.dept_no,  d.d_name , d.loc
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no
where e.dept_no = (select e2.dept_no from vk_employee e2 where e2.e_name = 'KING');

-- 226. List the emps whose sal grade are greater than the grade of miller. 
select e.emp_no, e.e_name, e.grade
from vk_employee e
where e.grade > (select grade from vk_employee where e_name = 'MILLER');

-- 227. List the emps who are belonging dallas or Chicago with the grade same as adams  or exp more than smith. 
select e.emp_no, e.e_name, e.salary,e.grade,e.dept_no,  d.d_name , d.loc, extract(year from age(current_date, hire_date)) as exp
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no
where d.loc in ('CHICAGO', 'DALLAS') 
and e.grade = (select e1.grade from vk_employee e1 where e1.e_name = 'ADAMS')
or extract(year from age(current_date, hire_date)) > (select extract(year from age(current_date, hire_date)) from vk_employee e2 where e2.e_name = 'SMITH');
)

-- 228. List the emps whose sal is same as ford or blake. 
select e_name, salary
from vk_employee 
where salary in (select salary from vk_employee where e_name in ('FORK', 'BLAKE'));

-- 229. List the emps whose sal is same as any one of the following. 
select *
from vk_employee 
where salary in (select salary from vk_employee group by salary having count(*) >1);

-- 230. Sal of any clerk of emp1 table. 
select * from vk_employee where job = 'CLERK';

-- 231. Any emp of emp2 joined before 82. 
select *
from vk_employee 
where hire_date < '1982-01-01';

-- 232. The total remuneration (sal+comm.) of all sales person of Sales dept belongingto emp3 table. 
select sum(salary + coalesce(comm,0)) t_rem
from vk_employee 
where job = 'SALESMAN'
and dept_no = (select dept_no from vk_dept where d_name = 'SALES');

-- 233. Any Grade 4 emps Sal of emp 4 table. 
select e_name from vk_employee ve where grade = 4;

-- 234. Any emp Sal of emp5 table. 
select e_name, salary from vk_employee ve ;

-- 235. List the highest paid emp. 
select e_name, salary from vk_employee order by salary desc limit 1;

-- 236. List the details of most recently hired emp of dept 30. 
select * from vk_employee where dept_no = 30 order by hire_date desc limit 1;

-- 237. List the highest paid emp of Chicago joined before the most recentlyhired emp of grade 2.
select e.e_name, e.salary, e.grade, e.hire_date, d.loc 
from vk_employee e
join vk_dept d on e.dept_no = d.dept_no 
and d.loc = 'CHICAGO'
and e.hire_date < (select e1.hire_date from vk_employee e1 where e1.grade =2 order by hire_date desc limit 1)
order by e.salary desc limit 1;


-- 238. List the highest paid emp working under King
select e_name, salary 
from vk_employee ve 
where mgrs = (select emp_no from vk_employee  where e_name = 'KING') 
order by salary desc limit 1;




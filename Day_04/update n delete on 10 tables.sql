/* 
update table_name
set col1 = v1, col2 = v2,...
where condition;
 */

-- employee--------------------------------------------------

-- updating salary and email for specific employees
update employee
set salary = salary + 5000, email = 'amit.sharma@corp.com'
where emp_id = 1;

update employee
set job_title = 'Senior Developer', salary = salary + 7000
where emp_id = 3;

-- departments--------------------------------------------------

-- updating budget and status for two departments
update departments
set budget = budget + 200000, status = 'Active'
where dept_id = 1;

update departments
set location = 'Hyderabad', manager_id = 105
where dept_id = 3;

-- salaries--------------------------------------------------

-- updating base salary and bonus
update salaries
set base_salary = base_salary + 10000, bonus = bonus + 1500
where salary_id = 2;

update salaries
set deductions = deductions + 500, payment_mode = 'Bank Transfer'
where salary_id = 4;

-- attendance--------------------------------------------------

-- updating remarks and status
update attendance
set remarks = 'Came Late', status = 'Present'
where emp_id = 1 AND date = '2025-10-09';

update attendance
set total_hours = 9.5, remarks = 'Overtime'
where emp_id = 2 AND date = '2025-10-08';

-- training_sessions--------------------------------------------------

-- updating feedback rating and mode
update training_sessions
set feedback_rating = 4.8, mode = 'Online'
where session_id = 1;

update training_sessions
set trainer_name = 'Anita Rao', duration_hours = duration_hours + 1
where session_id = 3;

-- performance_reviews--------------------------------------------------

-- updating performance score and reviewer
update performance_reviews
set performance_score = 4.5, reviewer_id = 201
where review_id = 1;

update performance_reviews
set next_review_date = review_date + INTERVAL '6 months'
where review_id = 2;

-- projects--------------------------------------------------

-- updating project status and budget
update projects
set status = 'Completed', budget = budget + 50000
where project_id = 2;

update projects
set manager_id = 101, client_name = 'GlobalTech Ltd'
where project_id = 4;

-- products--------------------------------------------------

-- updating price and status
update products
set price = price * 1.10, status = 'Updated'
where product_id = 3;

update products
set stock = stock + 25, reorder_level = 10
where product_id = 5;

-- suppliers--------------------------------------------------

-- updating rating and contact details
update suppliers
set rating = 4.9, contact_person = 'Vikas Sharma'
where supplier_id = 1;

update suppliers
set phone = '+91-9988776655', city = 'Mumbai'
where supplier_id = 4;

-- customers--------------------------------------------------

-- updating phone and city
update customers
set phone = '+91-9876543210', city = 'Delhi'
where customer_id = 1;

update customers
set email = 'pooja.verma@clientmail.com', country = 'India'
where customer_id = 2;


------------------------------------------------------------------------------------------------------------------------------------------------------
/* 
delete from table_name
where condition;
 */

delete from employee
where emp_id = 5;

delete from departments
where dept_id = 6;

delete from salaries
where salary_id = 5;

delete from attendance
where emp_id = 3 and date = '2025-10-08';

delete from training_sessions
where session_id = 5;

delete from performance_reviews
where review_id = 4;

delete from projects
where project_id = 5;

delete from products
where product_id = 4;

delete from suppliers
where supplier_id = 3;

delete from customers
where customer_id = 5;

































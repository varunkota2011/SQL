/* insert into table_name (col1, col2, col3,..coln) 
values 
(v1, v2, v3,...vn),
(v1, v2, v3,...vn);

*/
-- 1️ employee
INSERT INTO employee (emp_id, first_name, last_name, gender, dob, hire_date, dept_id, job_title, salary, email)
VALUES
(1, 'Amit', 'Sharma', 'M', '1990-03-15', '2015-06-01', 1, 'HR Manager', 65000, 'amit.sharma@corp.com'),
(2, 'Priya', 'Patel', 'F', '1992-07-22', '2018-09-12', 2, 'Software Engineer', 75000, 'priya.patel@corp.com'),
(3, 'Rahul', 'Verma', 'M', '1988-11-10', '2012-03-14', 3, 'Project Lead', 90000, 'rahul.verma@corp.com'),
(4, 'Sneha', 'Nair', 'F', '1995-02-05', '2020-08-20', 4, 'Sales Executive', 48000, 'sneha.nair@corp.com'),
(5, 'Karan', 'Singh', 'M', '1985-09-17', '2010-05-10', 5, 'Marketing Manager', 83000, 'karan.singh@corp.com');


-- 2️ projects
INSERT INTO projects (project_id, project_name, dept_id, manager_id, start_date, end_date, budget, client_name, status)
VALUES
(101, 'HR System Upgrade', 1, 1, '2023-01-15', '2023-06-30', 250000, 'Tech Solutions Ltd', 'Active'),
(102, 'Mobile App Development', 2, 3, '2023-02-01', '2023-12-31', 600000, 'FinTech Corp', 'Active'),
(103, 'ERP Implementation', 3, 3, '2022-09-10', '2023-05-15', 450000, 'Global Enterprises', 'Closed'),
(104, 'Sales CRM Integration', 4, 4, '2023-03-20', '2023-09-30', 200000, 'Bright Sales', 'Active'),
(105, 'Digital Marketing Campaign', 5, 5, '2023-04-01', '2023-10-15', 300000, 'BrandBoost Ltd', 'Active');


-- 3️ departments
INSERT INTO departments (dept_id, dept_name, manager_id, location, budget, start_date, phone_no, status)
VALUES
(1, 'HR', 1, 'Mumbai', 1000000, '2020-01-01', '9876543210', 'Active'),
(2, 'IT', 2, 'Bangalore', 2500000, '2019-06-10', '8765432109', 'Active'),
(3, 'Finance', 3, 'Delhi', 1500000, '2018-03-15', '7654321098', 'Active'),
(4, 'Sales', 4, 'Pune', 1200000, '2021-07-20', '6543210987', 'Active'),
(5, 'Marketing', 5, 'Hyderabad', 1800000, '2017-09-05', '5432109876', 'Active');


-- 4️ salaries
INSERT INTO salaries (salary_id, base_salary, bonus, deductions, effictive_date, pay_grade, payment_mode)
VALUES
(1, 60000, 5000, 2000, '2023-01-01', 'A1', 'Bank Transfer'),
(2, 75000, 7000, 3000, '2023-01-01', 'A2', 'Bank Transfer'),
(3, 90000, 8000, 4000, '2023-01-01', 'A3', 'Cheque'),
(4, 48000, 4000, 1500, '2023-01-01', 'B1', 'Cash'),
(5, 83000, 6000, 2500, '2023-01-01', 'A2', 'Bank Transfer');


-- 5️ attendance
INSERT INTO attendance (emp_id, date, check_in, check_out, total_hours, status, remarks)
VALUES
(1, '2023-10-01', '09:00', '17:30', 8.5, 'Present', 'On time'),
(2, '2023-10-01', '09:15', '18:00', 8.0, 'Present', 'Late arrival'),
(3, '2023-10-01', '08:45', '17:00', 8.25, 'Present', 'Worked extra'),
(4, '2023-10-01', '09:30', '17:30', 7.5, 'Present', 'Client call'),
(5, '2023-10-01', NULL, NULL, 0, 'Absent', 'Sick leave');


-- 6️ training_sessions
INSERT INTO training_sessions (session_id, topic, trainer_name, dept_id, start_date, end_date, duration_hours, mode, feedback_rating)
VALUES
(1, 'Leadership Skills', 'Anil Kapoor', 1, '2023-03-01', '2023-03-05', 20, 'Offline', 4.5),
(2, 'Python for Developers', 'Ravi Kumar', 2, '2023-04-10', '2023-04-12', 15, 'Online', 4.7),
(3, 'Financial Analysis', 'Manoj Mehta', 3, '2023-05-01', '2023-05-03', 12, 'Offline', 4.2),
(4, 'Sales Communication', 'Ritu Jain', 4, '2023-06-15', '2023-06-17', 10, 'Online', 4.8),
(5, 'Digital Marketing', 'Rakesh Yadav', 5, '2023-07-10', '2023-07-12', 16, 'Offline', 4.4);


-- 7️ performance_reviews
INSERT INTO performance_reviews (review_id, emp_id, reviewer_id, review_date, performance_score, next_review_date)
VALUES
(1, 1, 3, '2023-03-15', 4.2, '2024-03-15'),
(2, 2, 1, '2023-04-10', 4.5, '2024-04-10'),
(3, 3, 2, '2023-05-20', 4.0, '2024-05-20'),
(4, 4, 5, '2023-06-18', 3.8, '2024-06-18'),
(5, 5, 4, '2023-07-25', 4.3, '2024-07-25');


-- 8️ products
INSERT INTO products (product_id, product_name, category_id, supplier_id, price, stock, reorder_level, manufactured_date, expiry_date, status)
VALUES
(1, 'Laptop Pro 14', 1, 1, 1200.00, 50, 10, '2023-03-10', '2026-03-10', 'Active'),
(2, 'Wireless Mouse', 1, 2, 25.00, 300, 50, '2023-04-01', '2026-04-01', 'Active'),
(3, 'Desk Chair', 2, 3, 150.00, 120, 20, '2023-02-15', '2027-02-15', 'Active'),
(4, 'Monitor 24"', 1, 2, 180.00, 80, 15, '2023-05-20', '2026-05-20', 'Active'),
(5, 'Office Desk', 2, 3, 250.00, 60, 10, '2023-01-05', '2028-01-05', 'Active');


-- 9️ suppliers
INSERT INTO suppliers (supplier_id, supplier_name, contact_person, phone, email, city, country, rating)
VALUES
(1, 'TechSource Ltd', 'Anita Rao', '9876501234', 'anita@techsource.com', 'Mumbai', 'India', 4.6),
(2, 'GadgetMart', 'Rohan Mehta', '9123456780', 'rohan@gadgetmart.com', 'Delhi', 'India', 4.3),
(3, 'FurniWorld', 'Sneha Kapoor', '9988776655', 'sneha@furniworld.com', 'Bangalore', 'India', 4.7),
(4, 'ElectroHub', 'Deepak Joshi', '9876543211', 'deepak@electrohub.com', 'Pune', 'India', 4.4),
(5, 'OfficeNeeds', 'Vikram Shah', '8765432100', 'vikram@officeneeds.com', 'Chennai', 'India', 4.5);


-- 10 customers
INSERT INTO customers (customer_id, first_name, last_name, email, phone, city, country, registration_date)
VALUES
(1, 'Ravi', 'Kumar', 'ravi.kumar@email.com', '9998887776', 'Mumbai', 'India', '2022-05-10'),
(2, 'Neha', 'Verma', 'neha.verma@email.com', '8887776665', 'Delhi', 'India', '2021-11-25'),
(3, 'Arjun', 'Patel', 'arjun.patel@email.com', '7776665554', 'Bangalore', 'India', '2023-02-14'),
(4, 'Sneha', 'Iyer', 'sneha.iyer@email.com', '6665554443', 'Chennai', 'India', '2020-08-01'),
(5, 'Karan', 'Singh', 'karan.singh@email.com', '5554443332', 'Hyderabad', 'India', '2023-06-18');

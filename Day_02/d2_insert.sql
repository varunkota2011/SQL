-- INSERT EYK_customers

insert into EYK_CUSTOMERS
(id,first_name,last_name,email,mobile,password,avatar,dob,is_vendor,bio,status,purchases)
values (1,'demo first name','demo last name', 'user@gmail.com','+91 8121212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true,123.900);


insert into EYK_CUSTOMERS values
(2,'2-demo first name','2-demo last name', 'user2@gmail.com','+91 8121212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true,823.900);


insert into EYK_CUSTOMERS 
(id,first_name,last_name,email,mobile,password,avatar,dob,is_vendor,bio,status) values
(3,'3-demo first name','3-demo last name', 'user3@gmail.com','+91 8121212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true);


insert into EYK_CUSTOMERS 
(id,first_name,last_name,email,mobile,password,avatar,dob,is_vendor,bio,status) values
(4,'4-demo first name','4-demo last name', 'user4@gmail.com','+91 8121212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true);


insert into EYK_CUSTOMERS 
(id,first_name,last_name,email,mobile,password,avatar,dob,is_vendor,bio,status) values
(8,'8-demo first name','8-demo last name', 'user8@gmail.com','+91 9991212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true),
(5,'5-demo first name','4-demo last name', 'user4@gmail.com','+91 8121212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true),
(6,'6-demo first name','4-demo last name', 'user4@gmail.com','+91 8121212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true),
(7,'7-demo first name','4-demo last name', 'user4@gmail.com','+91 8121212',
'sdfdk23fdsadf23123','/pic/profile.png','1993-01-01','1','i am rider',true);


-- SELECT

select * from eyk_customers;
select first_name, last_name from eyk_customers;

-- UPDATE
update eyk_customers
set email = 'update_email@gmail.com' where id =1;

-- DELETE

delete from eyk_customers where id=2;

alter table dwh.Products
add column vendor varchar;



-- INSERT to customers

INSERT INTO dwh.Customer (CustomerID, CustomerName, Phone, Email, Address) VALUES
(1, 'Rahul Sharma', '9876543210', 'rahul.sharma@gmail.com', 'Mumbai, Maharashtra'),
(2, 'Anjali Verma', '9123456789', 'anjali.verma@gmail.com', 'Delhi, Delhi'),
(3, 'Vikas Gupta', '9988776655', 'vikas.gupta@gmail.com', 'Kolkata, West Bengal'),
(4, 'Pooja Desai', '9876512345', 'pooja.desai@gmail.com', 'Ahmedabad, Gujarat'),
(5, 'Rohan Patil', '9123456709', 'rohan.patil@gmail.com', 'Pune, Maharashtra'),
(6, 'Sakshi Jain', '8765432190', 'sakshi.jain@gmail.com', 'Jaipur, Rajasthan'),
(7, 'Amitabh Das', '9098765432', 'amitabh.das@gmail.com', 'Bangalore, Karnataka'),
(8, 'Priya Iyer', '9654321098', 'priya.iyer@gmail.com', 'Chennai, Tamil Nadu'),
(9, 'Kiran Reddy', '9543210987', 'kiran.reddy@gmail.com', 'Hyderabad, Telangana'),
(10, 'Meera Nair', '9765432109', 'meera.nair@gmail.com', 'Thiruvananthapuram, Kerala');


-- INSERT to sales

INSERT INTO dwh.Sales (SaleID, ProductID, QuantitySold, SaleDate, CustomerRegion) VALUES
(101, 1, 5, '2024-01-15', 'North'),
(102, 2, 10, '2024-01-16', 'South'),
(103, 3, 2, '2024-01-17', 'East'),
(104, 4, 1, '2024-01-18', 'West'),
(105, 5, 20, '2024-01-19', 'North'),
(106, 6, 15, '2024-01-20', 'East'),
(107, 7, 30, '2024-01-21', 'West'),
(108, 8, 10, '2024-01-22', 'South'),
(109, 9, 8, '2024-01-23', 'North'),
(110, 10, 3, '2024-01-24', 'West');

-- INSERT to products

INSERT INTO dwh.Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 800, 50),
(2, 'Smartphone', 'Electronics', 500, 150),
(3, 'Desk Chair', 'Furniture', 120, 70),
(4, 'Office Table', 'Furniture', 300, 30),
(5, 'Headphones', 'Electronics', 50, 200),
(6, 'Mouse', 'Accessories', 25, 300),
(7, 'Keyboard', 'Accessories', 40, 250),
(8, 'Monitor', 'Electronics', 200, 100),
(9, 'Printer', 'Electronics', 150, 80),
(10, 'Coffee Maker', 'Home Appliance', 75, 40),
(20, 'car key chain', 'Accessories', 70, 150),
 (21,'mouse key chain', 'Accessories',60,1000);


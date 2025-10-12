-- ALTER command

alter table users rename to eyk_customers;
alter table eyk_customers add column middle_name varchar;
alter table eyk_customers add column delete_col varchar;
alter table eyk_customers rename column phone to mobile;
alter table eyk_customers drop column delete_col;
alter table eyk_customers alter column email type text;

-- DELETE & TRUNCATE

drop table eyk_customers;

truncate table eyk_customers;

select*from dwh.products p ;
select*from dwh.customer c ;
select*from dwh.sales s ;
select*from dwh.users u ;

-- Find all products priced exactly ₹200.
select * 
from dwh.products p
where price = 200;

-- Identify sales with quantities not equal to 10 <>:
select *
from dwh.sales s 
where s.quantitysold <> 10;

-- List all sales where the quantity sold is less than 10.
select *
from dwh.sales s 
where s.quantitysold < 10;

-- Find products in stock and priced below $100
select *
from dwh.products p 
where stock != 0 and price < 100;

-- Retrieve customers whose names contain the letter "a"
select * 
from customer
where customername like '%a%';

-- Find products that belong to the "Electronics" category.
select *
from products p 
where category = 'Electronics';

-- List customers from regions starting with "N"
select *
from customer c 
where address like 'N%';

-- Get products priced between ₹50 and ₹150.
select *
from products
where price between 50 and 150;

-- Show sales made between January 20 and January 22, 2024.
select *
from sales
where saledate between '2024-01-20' and '2024-01-22';

-- Find customers where the email address is missing (if any).
select *
from customer c 
where email is null;

-- Check for products with no stock
select *
from products p 
where stock is null;

-- Identify sales records where the CustomerRegion is provided.
select *
from sales s 
where customerregion is not null;

/* Retrieve all sales made between January 15, 2024, and January 20, 2024, 
but exclude sales where the CustomerRegion is North.*/

select *
from sales s 
where saledate between  '2024-01-15' and '2024-01-20' and customerregion != 'North';

/*Find products that are in the "Furniture" category, 
 * priced between ₹100 and ₹400, and have stock greater than 20. */
select *
from products p 
where category = 'Furniture' and stock > 20;

-- List all products that are in stock and priced below ₹100.
select *
from products p 
where stock is not null and price < 100;

-- Retrieve customers who live in either "North" or "South" region.
select *
from sales
where customerregion in ('North', 'South');

-- Calculate the total stock value for products by multiplying Price by Stock.
select productname, price*stock as total_stock_value
from products p ;

-- Find products where the stock is a multiple of 10.
select productname
from products p 
where stock is not null and stock%10 = 0;

-- List sales from either "North",East  or "South" region
select *
from sales s 
where customerregion in ('North', 'East', 'South');

-- Get a distinct list of all product categories.
select distinct category
from  products p ;

-- Find distinct regions from the Sales table.
select distinct customerregion
from sales;

/*Combine simple operations. Find all products in the "Electronics" 
 category priced between ₹100 and ₹500 and currently in stock.*/
select productname, category
from products p 
where category = 'Electronics' and 
price between 100 and 500 and 
stock is not null;

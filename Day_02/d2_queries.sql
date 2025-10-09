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
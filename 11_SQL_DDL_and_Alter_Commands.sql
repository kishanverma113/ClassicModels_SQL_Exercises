-- [INTERVIEW]

-- 1. [DROP]
-- Use "DROP" to delete a database or a table.
-- "DROP" removes the entire structure along with all the data.
drop database classicmodels;  -- This is our database "classicmodels". It will delete the entire database.

drop table customers;  -- This is our table "customers". It will delete the entire table.


-- 2. [TRUNCATE]
-- "TRUNCATE" works only on tables.
-- "TRUNCATE" does not delete the table structure; it only removes the data.
truncate table customers;


-- 3. [DELETE]
-- "DELETE" is used to remove a particular row.
delete from customers where customername = 1;

delete from customers;  -- This statement works like "TRUNCATE". It deletes all data but keeps the table structure.



-- This table will be used for the "ALTER COMMAND" examples.
create table emp_details(
e_id int not null ,
e_name varchar(50),
age int);

desc emp_details;  -- "DESC" stands for "DESCRIBE". It is used to view the table structure.


-- 1. "ALTER COMMAND"
-- 1.) ADD   , 2.) DROP COLUMN   , 3.) RENAME / RENAME TO   , 4.) MODIFY COLUMN   , 5.) CHANGE


-- 1.) ADD
alter table emp_details
Add column salary int;  -- Add salary int; (This syntax is also valid.)

desc emp_details;


-- PRIMARY KEY
alter table emp_details
Add primary key(e_id);

desc emp_details;


-- 2.) MODIFY COLUMN
-- Used to change the data type of a column.
alter table emp_details
Modify column age varchar(50);  -- Modify age varchar(50);

desc emp_details;


-- 3.) CHANGE
-- Used to rename a column.
alter table emp_details
Change column age emp_age int;  -- Change age emp_age int;

desc emp_details;


-- 4.) DROP
alter table emp_details
DROP column salary;

desc emp_details;


-- 5.) RENAME / RENAME TO
alter table emp_details
Rename staff;

desc staff;


alter table staff
Rename to emp_details;

desc emp_details;



alter table emp_details
add e_new_id int after e_id;

desc emp_details;



-- 10.10.25

-- [INTERVIEW]

-- 1. [DROP]
-- Use "DROP" to delete a database or a table.
-- "DROP" removes the entire structure along with all the data.
drop database classicmodels;  -- This is our database "classicmodels". It will delete the entire database.

drop table customers;  -- This is our table "customers". It will delete the entire table.


-- 2. [TRUNCATE]
-- "TRUNCATE" works only on tables.
-- "TRUNCATE" does not delete the table structure; it only removes the data.
truncate table customers;


-- 3. [DELETE]
-- "DELETE" is used to remove a particular row.
delete from customers where customername = 1;

delete from customers;  -- This statement works like "TRUNCATE". It deletes all data but keeps the table structure.



-- This table will be used for the "ALTER COMMAND" examples.
create table emp_details(
e_id int not null ,
e_name varchar(50),
age int);

desc emp_details;  -- "DESC" stands for "DESCRIBE". It is used to view the table structure.


-- 1. "ALTER COMMAND"
-- 1.) ADD   , 2.) DROP COLUMN   , 3.) RENAME / RENAME TO   , 4.) MODIFY COLUMN   , 5.) CHANGE


-- 1.) ADD
alter table emp_details
Add column salary int;  -- Add salary int; (This syntax is also valid.)

desc emp_details;


-- PRIMARY KEY
alter table emp_details
Add primary key(e_id);

desc emp_details;


-- "AFTER"
alter table emp_details
add e_new_id int after e_id;

desc emp_details;


-- "FIRST"
alter table emp_details
add salary int first;

desc emp_details;


-- 2.) MODIFY COLUMN
-- Used to change the data type of a column.
alter table emp_details
Modify column age varchar(50);  -- Modify age varchar(50);

desc emp_details;


-- 3.) CHANGE
-- Used to rename a column.
alter table emp_details
Change column age emp_age int;  -- Change age emp_age int;

desc emp_details;


-- 4.) DROP
alter table emp_details
DROP column salary;

desc emp_details;


-- 5.) RENAME / RENAME TO
alter table emp_details
Rename staff;

desc staff;


alter table staff
Rename to emp_details;

desc emp_details;
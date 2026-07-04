-- "First query"
-- ";" :- Semicolon is compulsory.
-- ";" :- Semicolon is a delimiter; it indicates the termination of a statement.
create database Ducat;


-- "Second query"
-- Duplicate databases cannot be created.
-- Only one database can exist with the same name; duplicate databases are not allowed.
-- "USE" is used to specify which database we want to work with.
use Ducat;


-- Create a table.
-- "NOT NULL" :- Constraint/Rule {This field cannot be left blank (NULL).}
-- A table can also be created only once. Duplicate tables cannot be created.
create table student(d_id int not null , stu_name varchar(50) , age int);


-- Insert values into the table.
-- Do not mismatch the values with the corresponding columns while inserting.
insert into student(d_id , stu_name , age)
values(1,"aman",23),(2,"raman",32),(3,"monu",19);


-- (INTERVIEW)
-- (IMPORTANT)
-- 1st "QUERY"
-- In interviews, they often ask how to retrieve data from a database.
-- "Fetch" How to fetch data?
-- "*" means all columns; it retrieves all rows and columns from the table.
select * from student;


-- 2nd "QUERY"
-- If we want to retrieve only specific columns.
-- Fetch only the Name and Age columns.
select stu_name , age from student;


-- If we want data for a specific ID.
-- Use the "WHERE" clause.
select * from student where d_id = 3;

select * from student where d_id = 1;

select stu_name , age from student where d_id = 3;

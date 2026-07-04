-- Revision Class

-- We will work on "MySQL".

-- "SQL" :- Structured Query Language.
-- "S" :- "Structured" means data is organized in "Rows" and "Columns".
-- "Q" :- "Query" means asking questions to retrieve data.
-- "L" :- "Language" means it has its own writing "Syntax".


-- [We will also work on some new queries.]


-- 1st command
-- Only one database can exist with a particular name.
-- Duplicate databases cannot be created; otherwise, an error will occur.
create database employees;


-- 2nd command (We must specify which database we want to work on.)
-- This line is "MOST IMPORTANT" and must be written.
-- [Database Selection] :- Specifies which database we are working with.
use employees;


-- 3rd command
-- Never keep the database name and table name the same.
-- Never use spaces in a table name. Use "_" instead.
-- A table consists of "Rows" and "Columns".
-- "NOT NULL" :- Constraint/Rule {This field cannot be left blank (NULL).}
-- End the statement with a ";" (semicolon) for termination.
create table emp_details(
e_id int not null ,
e_name varchar(50) ,
e_age int ,
city varchar(50) ,
salary int);


-- 4th command
-- "Table Insert" :- Now insert data into the table.
-- Since "insert into emp_details()" is left blank, the values must follow the same column order as defined in "create table emp_details".
insert into emp_details()
value(1,"aman",32,"delhi",1100),
(2,"ajay",22,"goa",1500),
(3,"shiv",42,"pune",1600),
(4,"krish",23,"mumbai",4100),
(5,"love",35,"noida",7100);


-- Since the column names are specified in "insert into emp_details(e_id,e_name,e_age,city,salary)",
-- the values can be inserted in that specified order.
-- insert into emp_details(e_id,e_name,e_age,city,salary)
-- value(1,"aman",32,"delhi",1100),
-- (2,"ajay",22,"goa",1500),
-- (3,"shiv",42,"pune",1600),
-- (4,"krish",23,"mumbai",4100),
-- (5,"love",35,"noida",7100);


-- 5th command
-- (INTERVIEW)
-- (IMPORTANT)
-- Interviewers often ask how to retrieve data from a table.
-- "Fetch" How to fetch data?
-- "*" means all columns; it retrieves every row and column.
select * from emp_details;


-- Retrieve particular columns.
select e_name , city from emp_details;


-- [MOST IMPORTANT]
-- ["WHERE Clause"]
-- Use the "WHERE" clause to retrieve data for a specific ID, name, or any other column value.
select * from emp_details where e_id = 2;

select * from emp_details where e_name = "ajay";


-- ["LIMIT"]
-- If we want data for only 3 or 4 employees, use the "LIMIT" clause.
select * from emp_details limit 3;


-- ["WHERE Clause"]
-- Use the "WHERE" clause to retrieve data for a single city.
select e_name , city from emp_details where city = "delhi";


-- 1st Operator
-- ["IN Operator"]
-- Use the "IN" operator to retrieve data for multiple cities.
select e_name , city from emp_details where city in ("delhi","noida");


-- 2nd Operator
-- ["NOT IN Operator"]
-- Use the "NOT IN" operator to exclude data from specific cities.
select e_name , city from emp_details where city not in ("delhi","noida");


-- 3rd Operator
-- ["LIKE Operator"]
-- Retrieve employee names that match a specific pattern.
-- "a%" , "%y" , "a%m%y" , "%mini%" , "a__%" , "a___"

-- [Starts with]
select e_name from emp_details where e_name like "a%";

-- [Ends with]
select e_name from emp_details where e_name like "%h";

-- ["k__" means exactly 2 characters after 'k'.]
select e_name from emp_details where e_name like "k__";

select e_name from emp_details where e_name like "k____";

-- ["k__%" means the name should start with 'k', followed by at least 2 characters, and then any number of additional characters.]
select e_name from emp_details where e_name like "k__%";


-- 4th Operator
-- ["BETWEEN Operator"]
select * from emp_details where salary between 1300 and 4000;


-- [KEYS]

-- 1. "PRIMARY KEY"
-- Identify one column in a table that:
-- Can never contain duplicate values.
-- Can never contain NULL values.
-- A table can have only one PRIMARY KEY.


-- 2. "UNIQUE KEY"
-- A table can have multiple UNIQUE KEY columns.
-- Duplicate values are not allowed.
-- NULL values are allowed.


-- 3. "FOREIGN KEY"
-- Remember one important word: "REFERENCE". {IMPORTANT}
-- In the Employee table, E_id is the PRIMARY KEY.
-- In the Department table, D_id is the PRIMARY KEY.
-- When a PRIMARY KEY from one table is used in another table, it is called a FOREIGN KEY in the second table.
-- The FOREIGN KEY establishes a relationship between the two tables.


-- [MOST IMPORTANT]
-- ["ORDER BY"]
-- 70% - 80% (INTERVIEW)
-- Write a query to fetch the second highest salary?
select * from emp_details
order by salary desc limit 1,1;


-- ["GROUP BY"]
-- (MOST IMPORTANT)
-- "GROUP BY" is used about 80% of the time with Aggregate Functions.
-- "GROUP BY" does not return repeated values.
-- {This query may produce an error depending on the SQL mode because a non-grouped column is selected.}
-- When "GROUP BY" is used incorrectly, an error may occur.
select e_name , salary from emp_details group by salary order by salary desc limit 2;


-- "5 Aggregate Functions"
-- 1.MIN   2.MAX   3.COUNT   4.SUM   5.AVG


-- These 5 Aggregate Functions work only on numeric values.
-- {The column on which they are applied must contain numeric data.}


-- "QUERY"
-- Write a query to fetch the maximum salary, minimum salary, total salary, average salary, and salary count?
select
   max(salary),
   min(salary),
   sum(salary),
   avg(salary),
   count(salary)
from emp_details;


-- "ALIAS" :- AS
select
   max(salary) as min_sal,
   min(salary) as max_sal,
   sum(salary) as sum_sal,
   avg(salary) as avg_sal,
   count(salary) as count_sal
from emp_details;


-- ["UPDATE"]
update emp_details set salary = 2000 where e_id = 3;

select * from emp_details;
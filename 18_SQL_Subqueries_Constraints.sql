-- [{SUBQUERY}] :- A subquery can be used anywhere as long as the syntax is correct.
-- It is not limited to the 'WHERE' clause; it can also be used after the 'FROM' clause and in other valid places.

-- "Query"
-- Find the customers who have the maximum credit limit without using LIMIT.
use classicmodels;

select customername , creditlimit 
from customers
where creditlimit = (select max(creditlimit) from customers);


-- "Outer Query"
select customername , creditlimit 
from customers
where creditlimit =

-- "Inner Query"
(select max(creditlimit) from customers);

-- [Interview Question]
-- In interviews, a common question is:
-- Which query executes first: the Inner Query or the Outer Query?
-- Answer: The Inner Query executes first, followed by the Outer Query.



-- "Query"
-- Find the customers who placed orders in the year 2003.

-- Using an INNER JOIN.
select c.customernumber , c.customername , o.orderdate
from customers c 
inner join orders o
on c.customernumber = o.customernumber
where year(o.orderdate) = "2003";

-- Using INNER JOIN with the YEAR() function.
select c.customernumber , c.customername , year(o.orderdate)
from customers c 
inner join orders o
on c.customernumber = o.customernumber
where year(o.orderdate) = "2003";


-- [New Syntax]
-- "USING" is an alternative to "ON".
-- The column name must be exactly the same in both tables.
select c.customernumber , c.customername , year(o.orderdate)
from customers c 
inner join orders o
using (customernumber)      -- USING is used instead of: ON c.customernumber = o.customernumber
where year(o.orderdate) = "2003";


-- Using a Subquery.
select customernumber , customername 
from customers
where customernumber in 
(select distinct customernumber from orders where year(orderdate) = '2003');


-- Difference between 'JOINS' and 'SUBQUERY'?
-- "JOINS" :- Generally considered more complex because multiple tables are processed together.
-- "SUBQUERY" :- Uses a nested query and is often preferred when it makes the query simpler and easier to understand.


-- "Query"
-- List the top 5 products by total sales.
select productcode , total_sales
from 
(select productcode , sum(quantityordered * priceeach) as total_sales
from orderdetails group by productcode) as top_5_products
order by total_sales desc limit 5;




-- [{CONSTRAINTS}]
-- Commonly used in practical database design.
-- 1. NOT NULL
-- 2. PRIMARY KEY
-- 3. UNIQUE KEY
-- 4. FOREIGN KEY
-- 5. CHECK
-- 6. DEFAULT
-- 7. COMPOSITE KEY

-- Mostly theoretical concepts.
-- 8. SUPER KEY
-- 9. CANDIDATE KEY


-- Retrieve all constraints from the database.
select
    table_name,
    constraint_name,
    constraint_type,
    table_schema
from
    information_schema.table_constraints
where
    table_schema = 'classicmodels';


select 
    constraint_name,
    table_name,
    column_name,
    referenced_table_name,
    referenced_column_name
from
   information_schema.key_column_usage
where 
   table_schema = 'classicmodels';



-- 1. NOT NULL
-- Example
CREATE TABLE employees ( 
employee_id INT NOT NULL, 
name VARCHAR(100) NOT NULL, 
PRIMARY KEY (employee_id) 
);


-- 2. UNIQUE KEY
-- Example
CREATE TABLE employees ( 
employee_id INT NOT NULL, 
email VARCHAR(100) UNIQUE, 
PRIMARY KEY (employee_id) 
);


-- 3. PRIMARY KEY
-- Example
CREATE TABLE employees ( 
employee_id INT PRIMARY KEY, 
name VARCHAR(100) 
);


-- 4. FOREIGN KEY
-- Example
CREATE TABLE orders ( 
order_id INT PRIMARY KEY, 
customer_id INT, 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);


-- 5. COMPOSITE KEY
-- Example
CREATE TABLE order_items ( 
order_id INT, 
product_id INT, 
quantity INT, 
PRIMARY KEY (order_id, product_id) 
);


-- 6. CHECK
-- Example
CREATE TABLE employees ( 
employee_id INT PRIMARY KEY, 
salary DECIMAL(10, 2), 
CHECK (salary >= 0) 
);


-- 7. DEFAULT
-- Example
CREATE TABLE employees ( 
employee_id INT PRIMARY KEY, 
name VARCHAR(100), 
hire_date DATE DEFAULT CURRENT_DATE
);


-- 8. SUPER KEY (Theory)
-- All candidate key are super key.
-- Super Key: Any set of one or more columns that can uniquely identify a row. It may contain extra (redundant) columns.

-- 9. CANDIDATE KEY (Theory)
-- All super key are not candidate key.
-- Candidate Key: A minimal Super Key, meaning no unnecessary columns are included.
-- "USE" is used to specify which database we want to work with.
use classicmodels;

-- Fetch all the information from the table.
select * from customers;


-- "QUERY"
-- [I want the information of customers whose country is "USA".]
-- "WHERE" clause.
select * from customers where country = "USA";


-- When we want to retrieve data of only 5 customers.
-- Use the "LIMIT" clause.
select * from customers limit 5;


-- "KEYS"

-- 1st key.
-- "Primary key":- A column that uniquely identifies every record in a table is called a "PRIMARY KEY".
-- "Primary key":- E_id can never have duplicate values.
-- "Primary key":- E_id can never be NULL.
-- "Primary key":- Only one PRIMARY KEY can be defined in a table.


-- 2nd key.
-- "Unique key":- Two customers can never have the same mobile number.
-- "Unique key":- However, it can contain NULL values.
-- "However, it is not mandatory that every customer must have a mobile number."
-- "Unique key":- A table can have multiple UNIQUE columns.


-- 3rd key.
-- "Foreign key":- Remember one important word: "REFERENCE". {IMPORTANT}
-- "Foreign key":- In the Employee table, E_id is the "PRIMARY KEY".
--                In the Department table, D_id is the "PRIMARY KEY".
-- **When a column from one table matches a column in another table, it is called a "FOREIGN KEY".
-- **{When the PRIMARY KEY of one table is used in another table, it becomes a "FOREIGN KEY" in that table.}



-- QUESTION
-- "QUERY"
-- Write a query to fetch the "top 10" customers according to the creditLimit.

-- However, this does not return the top 10 customers by creditLimit.
select customername , creditlimit
from customers limit 10;


-- (MOST IMPORTANT)
-- "ORDER BY"
-- "ORDER BY" :- It is used to sort data either in "Ascending Order" or "Descending Order".
-- Currently, it is working in "Ascending Order".
-- By default, "ORDER BY" sorts data in Ascending Order.
-- "ORDER BY" does not remove duplicate values; it also includes repeated values.
select customername , creditlimit
from customers order by creditlimit limit 10;


-- "Descending Order"
select customername , creditlimit
from customers order by creditlimit desc limit 10;


-- "ORDER BY" also includes repeated values, so we will use "GROUP BY".
select creditlimit from customers
order by creditlimit desc limit 3;


-- (MOST IMPORTANT)
-- "GROUP BY"
-- "GROUP BY" is used with Aggregate Functions about 80% of the time.
-- "GROUP BY":- It does not return repeated values.
-- {This query will produce an error because there are no Aggregate Functions used.}
-- When we use "GROUP BY" without an Aggregate Function in this case, it will result in an error.
select creditlimit from customers
group by creditlimit desc limit 3;
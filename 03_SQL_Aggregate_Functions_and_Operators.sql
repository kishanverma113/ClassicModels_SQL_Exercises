use classicmodels;

-- **"QUERY"
-- (MOST IMPORTANT)
-- 70% - 80% (INTERVIEW)
-- Write a query to fetch the second highest creditLimit?
select * from customers
order by creditlimit desc limit 1,1;

select customername , creditlimit
from customers order by creditlimit desc limit 1,1;

select customername , creditlimit
from customers order by creditlimit desc limit 2,1;

select customername , creditlimit
from customers order by creditlimit desc limit 4,1;

select customername , creditlimit
from customers order by creditlimit desc limit 4,5;


-- "QUERY"
-- (MOST IMPORTANT)
-- 100% (This question is also commonly asked in interviews.)
-- Find out the highest salary without using LIMIT?


-- If two customers have the same creditLimit, then we will use "GROUP BY".


-- "5 Aggregate Functions"
-- 1.MIN   2.MAX   3.COUNT   4.SUM   5.AVG


-- These 5 Aggregate Functions work on numeric values.
-- {Whichever column they are applied to must contain numeric data.}


-- "QUERY"
-- Write a query to fetch the maximum creditLimit, minimum creditLimit, total creditLimit, average creditLimit, and count of creditLimit?
select 
   max(creditlimit),
   min(creditlimit),
   sum(creditlimit),
   avg(creditlimit),
   count(creditlimit)
from customers;


-- To assign a custom name to any column, we use "ALIAS" with the "AS" keyword.
-- "ALIAS" :- AS
select 
   max(creditlimit) as "max_credit",
   min(creditlimit) as "min_credit",
   sum(creditlimit) as "sum_credit",
   avg(creditlimit) as "avg_credit",
   count(creditlimit) as "count_credit"
from customers;



-- [We want to view the customers whose country is "USA".]
-- To retrieve data for a single country, use the "WHERE" clause.
select * from customers 
where country = "USA";


-- [OPERATORS]

-- 1st Operator
-- To retrieve data for multiple countries, use the "IN" operator.
-- ("IN Operator")
-- [We want the data of customers who live in "USA", "FRANCE", and "GERMANY".]
select * from customers 
where country in ("USA" , "FRANCE" , "GERMARY");


-- 2nd Operator
-- ("NOT IN Operator")
select * from customers 
where country not in ("USA" , "FRANCE" , "GERMARY");


-- "QUERY"

-- 3rd Operator
-- ("BETWEEN Operator")
-- Write a query to fetch all customers whose creditLimit is between 10000 and 30000?
select customername , creditlimit from customers 
where creditlimit between 10000 and 30000;


-- 4th Operator
-- ("LIKE Operator")
-- (We want to retrieve the names of customers whose names contain "mini".)
-- "a%" , "%y" , "a%m%y" , "%mini%" , "a__%" , "a___"
select customername from customers
where customername like "%mini%";

select customername from customers
where customername like "a__%";

select customername from customers
where customername like "a___";

select customername from customers
where customername like "a____"; -- 'a____':-"wildcard Operator"
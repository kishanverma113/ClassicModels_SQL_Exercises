-- "Query"
-- List all the customers and their order numbers only if they have more than 3 orders.
-- "HAVING Clause" :- It is used with Aggregate Functions.
-- Aggregate Functions cannot be used with the "WHERE" clause. Instead, use the "HAVING" clause.
use classicmodels;

select c.customername , count(o.ordernumber)
from customers c
inner join orders o
on c.customernumber = o.customernumber
group by c.customername
having count(o.ordernumber) >3 ;


-- "Query"
-- Find the total number of products ordered by each customer.
-- Find the total quantity ordered by each customer.
select c.customername , sum(od.quantityordered) as 'total_quantity'
from customers c
inner join orders o
on c.customernumber = o.customernumber
inner join orderdetails od
on o.ordernumber = od.ordernumber
group by c.customername
order by total_quantity desc;



-- "Query"
-- List all the customers and their orders, including customers without orders and orders without customers.
-- [HINT :- CustomerNumber, CustomerName, OrderNumber, OrderDate]
-- {FULL OUTER JOIN :- UNION}
-- MySQL does not support "FULL OUTER JOIN" directly.
select c.customernumber , c.customername ,
o.ordernumber , o.orderdate
from customers c
left join orders o
on c.customernumber = o.customernumber

union

select c.customernumber , c.customername ,
o.ordernumber , o.orderdate
from customers c
right join orders o
on c.customernumber = o.customernumber;



-- "Query"
-- Retrieve all the products and their order details, including unmatched products and orders.
SELECT p.productname, od.ordernumber, od.priceeach, od.quantityordered
FROM products p
LEFT JOIN orderdetails od
ON p.productcode = od.productcode

UNION

SELECT p.productname, od.ordernumber, od.priceeach, od.quantityordered
FROM products p
RIGHT JOIN orderdetails od
ON p.productcode = od.productcode;
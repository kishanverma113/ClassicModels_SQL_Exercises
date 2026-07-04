-- "Query"
-- List all the customers and the employees who are their Sales Representatives.
use classicmodels;

select customers.customername ,
employees.firstname
from customers inner join employees
on customers.salesRepemployeeNumber = employees.employeenumber;


-- "Query"
-- How many orders have been placed by "Signal Gift Stores"?
-- customername :- Given "Signal Gift Stores"
-- Example :- customername = Total Quantity
select customers.customername , sum(orderdetails.quantityordered)
from customers inner join orders
on customers.customernumber = orders.customernumber
inner join orderdetails
on orders.ordernumber = orderdetails.ordernumber
where customers.customername = "Signal Gift stores";


-- Using table aliases (short names).
select c.customername , sum(od.quantityordered)
from customers c
inner join orders o          -- 1st JOIN
on c.customernumber = o.customernumber
inner join orderdetails od   -- 2nd JOIN
on o.ordernumber = od.ordernumber
where c.customername = "Signal Gift stores";


-- "Query"
-- [LEFT JOIN]
-- Find the products that have never been ordered.
select products.productname , orderdetails.ordernumber
from products left join orderdetails
on products.productcode = orderdetails.productcode
where orderdetails.ordernumber is null;


-- "Query"
-- Show all the orders along with their respective status.
select ordernumber , status 
from orders
limit 50;

-- "Query"
-- List all the products that were sold on "Monday".
-- [HINT] :- Dayname(orders.orderdate)
select p.productname , dayname(o.orderdate)
from products p
inner join orderdetails od
on p.productcode = od.productcode
inner join orders o
on od.ordernumber = o.ordernumber
where dayname(o.orderdate) = 'monday';

-- "Query"
-- Find the customers who have not made any payment.
select c.customername , p.amount
from customers c
left join payments p
on c.customernumber = p.customernumber
where p.customernumber is null;


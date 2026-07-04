-- "Query"
-- What is the quantity in stock for products that were listed in "On Hold" orders?
use classicmodels;

select p.productname , p.quantityinstock , o.status
from products p
inner join orderdetails od
on p.productcode = od.productcode
inner join orders o
on od.ordernumber = o.ordernumber
where o.status = "on hold "
order by p.quantityinstock desc;



-- "Query"
-- List all the orders that have not been shipped but have an assigned Sales Representative.
select e.firstname as "sales Rep" , o.status
from employees e
inner join customers c
on c.salesrepemployeenumber = e.employeenumber
inner join orders o
on c.customernumber = o.customernumber
where o.status != "shipped" ;  -- != :- Not Equal To
-- order by e.firstname desc; -- Added for my own practice.



-- "Query"
-- Find the employee who has handled the most customers.
-- [HINT :- COUNT]
-- "GROUP BY" is used because an Aggregate Function is being used.
select e.firstname , count(c.customernumber) as "total_customer"
from employees e
inner join customers c
on c.salesrepemployeenumber = e.employeenumber
group by e.firstname
order by total_customer desc limit 1;



-- "Query"
-- Find the total sales amount handled by each Sales Representative.
-- [HINT :- SUM]
-- "GROUP BY" is used because an Aggregate Function is being used.
select e.firstname , sum(od.quantityordered * od.priceeach) as "total_sales"
from employees e
inner join customers c
on c.salesrepemployeenumber = e.employeenumber
inner join orders o
on o.customernumber = c.customernumber
inner join orderdetails od
on od.ordernumber = o.ordernumber
group by e.firstname
order by total_sales desc limit 2;


-- "Query"
-- Find the most expensive product ever sold and the customer who bought it.
select p.productname , max(od.priceEach) as 'max_price'
from products p
inner join orderdetails od
on od.productcode = p.productcode
inner join orders o
on o.ordernumber = od.ordernumber
inner join customers c
on c.customernumber = o.customernumber
group by p.productname
order by max_price desc limit 1;


-- "Query"
-- Find the customers who bought products from the specific vendor "classic_metal_creations".
select distinct c.customername , p.productvendor
from customers c
inner join orders o
on c.customernumber = o.customernumber
inner join orderdetails od
on o.ordernumber = od.ordernumber
inner join products p
on od.productcode = p.productcode
where p.productvendor = 'classic_metal_creations';



-- "Query"
-- Show the product name and vendor for products that have been ordered at least once.
-- [HINT :- One JOIN]
select distinct p.productname , p.productvendor
from products p
inner join orderdetails od
on p.productcode = od.productcode;

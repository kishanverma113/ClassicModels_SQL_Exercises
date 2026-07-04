-- "Query"
-- Find the customers who have placed orders on the same date.
use classicmodels;

select c.customername as "first_customer",
c1.customername as "second_customer",
o.orderdate as "same_date"
from orders o
inner join orders o1
on o.orderdate = o1.orderdate
inner join customers c
on c.customernumber = o.customernumber
inner join customers c1
on c1.customernumber = o1.customernumber
where c.customernumber < c1.customernumber;



-- "Query"
-- Find duplicate customer contacts.
-- [HINT :- Check based on First Name and Last Name.]
select c.contactfirstname , c.contactlastname ,
c1.contactfirstname , c1.contactlastname
from customers c
inner join customers c1
on c.contactfirstname = c1.contactfirstname
where c.customernumber <> c1.customernumber;


-- "Query"
-- Find the customers who belong to the same country.
select c.customername , c1.customername , c.country
from customers c
inner join customers c1
on c.country = c1.country
where c.customernumber <> c1.customernumber;


-- "Query"
-- Find the customers who belong to the same city.
select c.customername , c1.customername , c.city
from customers c
inner join customers c1
on c.city = c1.city
where c.customernumber <> c1.customernumber;



-- "Query"
-- Find the customers who have made the same payment amount.
select c.customername as "first_customer",
c1.customername as "second_customer",
p.amount as "Amt"
from payments p
inner join payments p1
on p.amount = p1.amount
inner join customers c
on c.customernumber = p.customernumber
inner join customers c1
on c1.customernumber = p1.customernumber
where c.customernumber < c1.customernumber;



-- "Query"
-- Find the customers who have ordered the same products.
-- [HINT :- This query requires 5 to 6 JOINs.]
select c.customername, c1.customername, p.productname
from orderdetails od
inner join orderdetails od1
on od.productcode = od1.productcode
and od.ordernumber <> od1.ordernumber

inner join orders o
on od.ordernumber = o.ordernumber

inner join orders o1
on od1.ordernumber = o1.ordernumber
and o.ordernumber <> o1.ordernumber

inner join customers c
on o.customernumber = c.customernumber

inner join customers c1
on c1.customernumber = o1.customernumber

inner join products p
on od.productcode = p.productcode
limit 8;
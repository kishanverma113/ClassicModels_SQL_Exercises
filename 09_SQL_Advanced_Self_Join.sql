-- ("SELF JOIN") :- A little bit difficult.

-- [MOST IMPORTANT]
-- [INTERVIEW Questions]
-- "SELF JOIN" :- A type of JOIN operation where a table is joined with itself.
-- We cannot write "SELF JOIN" directly in a query.
-- "SELF JOIN" means treating the same table as two separate tables using aliases.

-- "Syntax":- Example
select e.e_n , m.e_n
from emp e  -- 1st table
inner join emp m  -- Second alias of the same table
on e.e_id = m.reports_to;


-- "Alias :- AS"
select e.e_n as "emp_name", m.e_n as "manager_name"
from emp e  -- 1st table
inner join emp m  -- Second alias of the same table
on e.e_id = m.reports_to;



-- "Query"
-- Find the employees and their direct managers.
use classicmodels;

select e.firstname as "emp_name" , m.firstname as "mng_name"
from employees e
left join employees m
on m.employeenumber = e.reportsto;


-- Written for better understanding.
-- Employee Name, Job Title
select e.firstname as "emp_name" , m.jobtitle as "mng_jobtitle"
, e.reportsto as "reportsto"
from employees e
left join employees m
on m.employeenumber = e.reportsto;



-- "Query"
-- Find the products with the same price.
select p.productname , p1.productname ,p.buyprice
from products p
inner join products p1
on p.buyprice = p1.buyprice;


-- Add one more condition.
select p.productname as "first_product" ,
p1.productname as "second_product" ,
p.buyprice as "price"
from products p
inner join products p1
on p.buyprice = p1.buyprice
where p.productcode <> p1.productcode;  -- Added a condition. "<>" / "!=" means Not Equal To.



select p.productname as "first_product" ,
p1.productname as "second_product" ,
p.buyprice as "price"
from products p
inner join products p1
on p.buyprice = p1.buyprice
where p.productcode < p1.productcode;  -- Added a condition to avoid duplicate pairs.



-- "Query"
-- Find the employees who are working in the same office.
-- [HINT :- officeCode]
select e.firstname as "first_emp" ,
e1.firstname as "second_emp" ,
e.officecode as "OC"
from employees e
inner join employees e1
on e.officecode = e1.officecode
where e.employeenumber < e1.employeenumber;


-- Executed to verify the result.
select firstname , officecode
from employees
where firstname in ("Diane","Mary");



-- "Query"
-- Find the employees who report to the same manager.
select e.firstname as '1st_name', e.lastname as '2nd_name',
e1.reportsto as 'report' from employees e
inner join employees e1
on e.reportsto = e1.reportsto
and e.employeenumber <> e1.employeenumber;


-- "Query"
-- Find the customers who placed orders on the same date.
Select c.customername as '1st name', o.orderdate as 'same_dt',
c1.customername as 'second name' from orders o
inner join orders o1
on o.orderdate = o1.orderdate
inner join customers c
on c.customernumber = o.customernumber
inner join customers c1
on c1.customernumber = o1.customernumber
where c.customernumber < c1.customernumber;


-- "Query"
-- Find the employees who have the same job title.
select e.firstname as '1st name', e1.jobtitle as 'job'
from employees e
inner join employees e1
on e.jobtitle = e1.jobtitle
where e.employeenumber <> e1.employeenumber;


-- "Query"
-- Find duplicate customer contacts.
-- [HINT :- Check based on First Name and Last Name.]
select c.contactfirstname, c.contactlastname,
c1.contactfirstname, c1.contactlastname
from customers c
inner join customers c1
on c.contactfirstname = c1.contactfirstname
where c.customernumber <> c1.customernumber;
-- [MOST IMPORTANT]
-- [INTERVIEW]
-- [JOINS]
-- 1."INNER JOIN"  , 2."LEFT JOIN"  , 3."RIGHT JOIN"  , 4."FULL OUTER JOIN"  , 5."SELF JOIN" :- MOST IMPORTANT

-- {MOST IMPORTANT POINT}
-- Always remember that the number of JOINs required is one less than the number of tables.
-- "2 TABLES" :- 1 JOIN ,  "3 TABLES" :- 2 JOIN ,  "4 TABLES" :- 3 JOIN


-- Example :- "Syntax"
select emp.e_na , dept.d_na
from emp inner join dept
on emp.d_id = dept.d_id;


-- "Query"
-- Get all those customers who have made a payment.
-- Required output:
-- customername , paymentdate , amount
use classicmodels;

select customers.customername , payments.paymentdate , payments.amount
from customers inner join payments
on customers.customernumber = payments.customernumber;


-- "Query"
-- Show all the products that have been ordered along with their total quantity ordered.
-- Since we need the total quantity for each product, we will use "SUM" and "GROUP BY".
select products.productname , orderdetails.quantityordered
from products inner join orderdetails
on products.productcode = orderdetails.productcode;


-- When using Aggregate Functions, we should use "GROUP BY".
-- Otherwise, the selected rows and columns will not match correctly.
-- "GROUP BY" is used here along with the "SUM" function.
-- "GROUP BY" does not return repeated values.
select products.productname , sum(orderdetails.quantityordered)
from products inner join orderdetails
on products.productcode = orderdetails.productcode
group by products.productname;


-- Use "ORDER BY" to sort the result in Descending Order.
select products.productname , sum(orderdetails.quantityordered)
from products inner join orderdetails
on products.productcode = orderdetails.productcode
group by products.productname
order by sum(orderdetails.quantityordered) desc;


-- Here we are using table aliases to make the query shorter.
-- Example: "products" as "p", "customers" as "c", "orderdetails" as "od".
select p.productname , sum(od.quantityordered)
from products p inner join orderdetails od
on p.productcode = od.productcode
group by p.productname
order by sum(od.quantityordered) desc;


-- "Query"
-- Get the list of all orders along with the customer name and the products they ordered.
-- Since we are using 4 tables, we need 3 JOINs.
-- The query requires 3 JOINs.
-- 1st JOIN :- customers ↔ orders
-- 2nd JOIN :- orders ↔ orderdetails
-- 3rd JOIN :- orderdetails ↔ products
-- Required Columns :- customername , productname , ordernumber

-- [HINT] :-
-- from customers c
-- inner join orders o          (** 1st JOIN)
-- on c.cn = o.cn               (** 1st JOIN)
-- inner join orderdetails od   (** 2nd JOIN)
-- on od.on = o.on              (** 2nd JOIN)
-- inner join products p        (** 3rd JOIN)
-- on p.pc = od.pc;             (** 3rd JOIN)

-- Common Keys:
-- customers ↔ orders = customerNumber (CN)
-- orders ↔ orderdetails = orderNumber (ON)
-- orderdetails ↔ products = productCode (PC)

use classicmodels;

select c.customername , p.productname , o.ordernumber
from customers c
inner join orders o          -- (** 1st JOIN)
on o.customernumber = c.customernumber
inner join orderdetails od   -- (** 2nd JOIN)
on od.ordernumber = o.ordernumber
inner join products p        -- (** 3rd JOIN)
on p.productcode = od.productcode;
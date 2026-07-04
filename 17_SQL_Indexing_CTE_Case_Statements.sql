-- [INTERVIEW] :- This question is asked directly in interviews: What does Indexing do?
-- [{INDEXING}] :- It improves query execution speed.
-- [By default, every 'Primary Key' is automatically an 'Index'.]
use classicmodels;

-- 'Syntax'
create index idx_city on customers(city);


select customernumber , city 
from customers
where city = 'Nantes';



-- [{CTE :- COMMON TABLE EXPRESSION}] :- Creates a temporary table at runtime that is not permanently stored anywhere.
-- We use the "WITH Clause".
with customer_info as 
(select customernumber , country from customers limit 100)
select country from customer_info limit 10;


-- "Query"
-- Create a CTE to find all orders having total sales greater than 5000?
with order_totals as
(select ordernumber , sum(quantityordered * priceeach)
as total_sales from orderdetails group by ordernumber)
select * from order_totals where total_sales > 5000;


-- "Query"
-- Create a CTE to find all products whose buy price is less than 80?
with product_price as
(select productcode , productname , buyprice
from products where buyprice < 80)
select * from product_price;


-- "Query"
-- Create a CTE to find the total number of orders placed by each customer?
with customer_orders as 
(select customernumber , count(ordernumber)
as total_order from orders group by customernumber)
select c.customername , co.total_order
from customer_orders co 
inner join customers c
on c.customernumber = co.customernumber;


-- "Where Clause" is used here.
with customer_orders as 
(select customernumber , count(ordernumber)
as total_order from orders group by customernumber)
select c.customername , co.total_order
from customer_orders co 
inner join customers c
on c.customernumber = co.customernumber
where total_order > 5;




-- [{CASE STATEMENT}]
select ordernumber , quantityordered ,
case
when quantityordered > 25 then "quantity is > 70"
when quantityordered < 25 then "quantity is < 70"
when quantityordered = 25 then "quantity is = 70"
else "None"   -- You can replace "None" with any other text if required.
end as quantity_text -- Writing "END" is mandatory.
from orderdetails;
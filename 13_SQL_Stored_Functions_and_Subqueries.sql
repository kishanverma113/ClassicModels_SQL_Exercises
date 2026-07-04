-- Difference between "STORED PROCEDURE" and "STORED FUNCTION".

-- "STORED PROCEDURE":
-- 1. "Procedure": It is used when we need to execute INSERT, UPDATE, SELECT, or complex SQL queries.
-- 2. "Procedure": It is executed using the "CALL" statement.
-- 3. "Procedure": It supports INPUT (IN) and OUTPUT (OUT) parameters. We can also use only IN or only OUT parameters.
-- {A Procedure can return multiple output values and can execute complex SQL queries.}


-- "STORED FUNCTION":
-- 1. "Function": It is designed to return only a single output value.
-- 2. "Function": Complex queries such as INSERT or UPDATE cannot be used inside a Function. Only SELECT queries are allowed.
-- {Use a Function whenever only a single output value is required.}
-- 3. "Function": It always returns a single value.



-- [With Parameters]
-- ["OUT Parameter"]
use classicmodels;

-- "Query"
-- Create a Procedure to get the order count of a customer.
-- [HINT :- IN , OUT Parameters]
-- "IN" :- INPUT :- Specifies which customerNumber should be passed.
-- "OUT" :- OUTPUT :- Returns a single output value from the query.
-- The parameter names used in OUT, INTO, and CALL should match.
-- {You can use multiple OUT parameters if multiple output values are required.}

Delimiter //

create procedure sp_getCustomerordercount(in customer_number int,out ordercount int)

Begin
select count(ordernumber) into ordercount
-- "INTO" :- Used to store the query output into another variable.
from orders where customernumber = customer_number;
End //

Delimiter ;

call sp_getCustomerordercount(103,@ordercount);
-- "@" indicates a user-defined variable that stores the output value.

select @ordercount;
-- Developers usually use this statement to retrieve the output value.

-- drop procedure sp_getCustomerordercount;



-- "Query"
-- Create a Procedure to fetch the total number of products in a category.
Delimiter //

create procedure sp_getTotalNoProducts(in category varchar(50),out totalnoproducts int)

Begin
select count(productcode) into totalnoproducts
-- "INTO" :- Used to store the query output into another variable.
from products where productline = category;
End //

Delimiter ;

call sp_getTotalNoProducts("Classic Cars",@totalnoproducts);
-- "@" stores the returned value in a user-defined variable.

select @totalnoproducts;




-- [INTERVIEW]
-- {SUBQUERY}

-- "Query"
-- Write a query to get the second highest salary without using LIMIT?
select max(creditlimit) from customers
where customername < (select max(creditlimit) from customers);


-- This query is written only to verify whether the result is the second highest value.
-- select creditlimit from customers
-- order by creditlimit desc limit 2;





-- **Give higher priority to [STORED PROCEDURE] compared to [STORED FUNCTION].**

-- [Topic]
-- ["STORED FUNCTION"]

-- "Query"
-- Create a Function to get the total payment made by a customer.
Delimiter //

create function get_TotalPayment(CN int)
-- Passing a normal input parameter.

Returns Decimal(10,2)
-- Specifies that the function returns a DECIMAL value.
-- (10,2) means a total of 10 digits with 2 digits after the decimal point.

Deterministic
-- Deterministic means the same input always produces the same output.

Begin

Declare TP decimal(10,2);
-- TP (Total Payment) is a local variable.

select sum(amount) into TP
-- SQL query statement.
from payments
where customernumber = CN;

Return ifnull(TP,0);

End //

Delimiter ;


-- Calling the Stored Function.
select get_TotalPayment(103);

DROP FUNCTION get_TotalPayment;




-- "Query"
-- Create a Function to get the total number of orders placed by a customer.
Delimiter //

create function sf_totalorders(cust_id int)

Returns int

Deterministic

Begin

Declare totalorders int;

select count(ordernumber) into totalorders
from orders
where customernumber = cust_id;

return totalorders;

End //

Delimiter ;


select sf_totalorders(119);


drop function sf_totalorders;
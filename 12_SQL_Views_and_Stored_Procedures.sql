-- A table can have only one unique name.
-- A view can have only one unique name.
-- A database can have only one unique name.
-- **Duplicate objects (tables, views, or databases) cannot be created.

-- Views cannot be edited directly.
-- However, you can use SELECT, LIKE, WHERE, and other operators on a view.

-- This is a small topic.
-- "VIEWS" :- A "VIRTUAL TABLE". A View is a stored SQL query that can be used like a table.
use classicmodels;

create view customerpayment as   -- This line is required to create a View.
select c.customername , p.paymentdate , p.amount
from customers c
inner join payments p
on c.customernumber = p.customernumber
limit 100;

select * from customerpayment limit 5;  -- You can filter or retrieve any required data from the View.

-- "DROP COMMAND"
-- drop view customerpayment;





-- Widely used in companies.
-- **[MOST IMPORTANT]
-- {100% INTERVIEW}
-- "PROCEDURE" :- Only one Procedure can exist with a particular name. Duplicate Procedures cannot be created.
-- ["PROCEDURE"] :- 1. STORED PROCEDURE   2. STORED FUNCTION

-- *Once a Procedure is created, it cannot be edited.
-- *If a mistake is made, you must either DROP the Procedure or create a new one.

-- Notes on "PROCEDURE":
-- 3 Parameters:
-- Type      Description                    Example
-- IN        Input parameter (default)     IN dept_name VARCHAR(50)
-- OUT       Output parameter              OUT total INT
-- INOUT     Both input and output         INOUT value INT

-- Procedures cannot be edited.
-- However, you cannot use SELECT, LIKE, WHERE, or other operators directly with the CALL statement.

-- "SYNTAX"
Delimiter $$  -- Temporarily changing the delimiter to $$.

create procedure sp_getAllEmp()

Begin
select * from employees limit 100;  -- Write the SQL query between BEGIN and END.
End $$

Delimiter ;  -- Change the delimiter back to the default.

-- "CALL" is used to execute the Procedure.
call sp_getALLEmp();  -- Use CALL to execute the Procedure instead of writing the complete query again.


-- "DROP COMMAND"
-- drop procedure sp_getAllEmp;



-- "Query"
-- Create a Procedure to fetch all customers whose country is "USA".
use classicmodels;

Delimiter //

create procedure sp_getallCustCountry()

Begin
select customername , country
from customers
where country = "USA";
End //

Delimiter ;

call sp_getallCustCountry();



-- Retrieve data for a specific country.
-- Made the Procedure dynamic so that any country can be passed as a parameter.
-- Procedure with an "IN" parameter.
Delimiter //

create procedure sp_getallCustSpeCountry(in country_name varchar(50))

Begin
select customername , country
from customers
where country = country_name;
End //

Delimiter ;

call sp_getallCustSpeCountry("FRANCE");  -- Pass the country name as the parameter.




-- "Query"
-- Create a Procedure to update the email address of a specific employee.
-- Two "IN" parameters are used.
-- When an UPDATE statement is used inside a Procedure, verify the changes using a SELECT query after calling the Procedure.
Delimiter &&

create procedure sp_updateEmpEmail(in Emp_No int,in Email_id varchar(50))

Begin
Update employees
set Email = Email_id
where employeenumber = Emp_No;
End &&

Delimiter ;

call sp_updateEmpEmail(1002,"ki12@gmail.com");


select employeenumber , email
from employees
where employeenumber = "1002";
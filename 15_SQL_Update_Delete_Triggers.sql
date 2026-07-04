use classicmodels;

-- [Triggers]

-- 3. "DELETE TRIGGER" :- 'Before Delete Trigger'

-- "Query"
-- Create a Trigger to prevent deleting a customer if they have "On Hold" orders.
Delimiter //

create trigger before_delete_customer

before delete on customers

for each row
begin

declare order_count int;   -- 'order_count' is a local variable.

select count(*) into order_count
from orders
where customerNumber = old.customerNumber
and status = 'on hold';

if order_count > 0 then

signal sqlstate '45000'
set message_text = 'customer cannot be deleted';
-- '45000' is a custom SQLSTATE used to display a user-defined error message.

end if;

end;

//

delimiter ;


-- This is a custom error. The customer will not be deleted because the Trigger raises the error message defined above.
delete from customers
where customernumber = 144;

-- First, check which customers currently have "On Hold" orders.
select customernumber, status
from orders
where status = 'on hold';




-- 2. "UPDATE TRIGGER" :- 'Before Update Trigger'

-- "Query"
-- Create a Trigger to prevent reducing a customer's creditLimit below their current outstanding balance.
Delimiter //

create trigger before_update_customers

before update on customers

for each row
begin

declare current_balance decimal(10,2);

select sum(amount) into current_balance
from payments
where customerNumber = old.customerNumber;

if new.creditLimit < current_balance then

set new.creditLimit = old.creditLimit;

end if;

end;

//

delimiter ;

-- The creditLimit will not be updated after executing this statement because of the Trigger validation.
update customers
set creditLimit = 500
where customerNumber = 103;


-- Check the current outstanding balance.
-- select customerNumber, sum(amount)
-- from payments
-- where customerNumber = 103;


select customerNumber, creditlimit
-- Verify that the creditLimit remains unchanged.
from customers
where customerNumber = 103;





-- 2. "UPDATE TRIGGER" :- 'After Update Trigger'

-- Create an audit table.
create table credit_limit_changes(
id int primary key auto_increment,
customerNumber int,
oldcreditlimit decimal(10,2),
newcreditlimit decimal(10,2),
updated_at timestamp default current_timestamp
);


Delimiter //

create trigger after_update_creditlimt

after update on customers

for each row
begin

if old.creditLimit <> new.creditLimit then

insert into credit_limit_changes(
customerNumber,
oldcreditlimit,
newcreditlimit
)
values(
old.customerNumber,
old.creditLimit,
new.creditLimit
);

end if;

end;

//

delimiter ;

-- Drop command.
-- drop trigger after_update_creditlimt;


update customers
set creditlimit = 30000
where customernumber = 103;

select * from credit_limit_changes;
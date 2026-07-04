-- [MOST IMPORTANT]
-- [INTERVIEW]
-- {"TRIGGER"} :- Used to maintain logs. "Logs" means any type of recorded output or activity.
-- 1. "INSERT TRIGGER" :- 'Before Insert Trigger', 'After Insert Trigger'
-- 2. "UPDATE TRIGGER" :- 'Before Update Trigger', 'After Update Trigger'
-- 3. "DELETE TRIGGER" :- 'Before Delete Trigger', 'After Delete Trigger'

use classicmodels;

-- "Query"
-- Create a Trigger to ensure that a new customer's creditLimit is not negative before inserting the record.
-- 1. "INSERT TRIGGER" :- 'Before Insert Trigger'

-- Syntax:
Delimiter //

create trigger before_insert_customer
-- Only one Trigger can exist with a particular name. Duplicate Triggers cannot be created.

Before insert on customers
-- **Most Important Line**
-- Specifies on which table and event (INSERT, UPDATE, DELETE) the Trigger will execute.

for each row
-- Loop through every affected row.

Begin

if new.creditlimit < 0 then
-- "NEW" is used for newly inserted or updated values.
-- "OLD" is used for existing values in UPDATE or DELETE operations.

set new.creditlimit = 0;

end if;

end;

//
Delimiter ;

-- Drop command for Trigger.
drop trigger if exists before_insert_customer;


-- Insert a record to test the Trigger.
INSERT INTO `classicmodels`.`customers`
(`customerNumber`,
`customerName`,
`contactLastName`,
`contactFirstName`,
`phone`,
`addressLine1`,
`addressLine2`,
`city`,
`state`,
`postalCode`,
`country`,
`salesRepEmployeeNumber`,
`creditLimit`)
VALUES
(1001,'kv','verma','kishan',87656,'delhi','delhi','delhi','delhi',20100,'india',1002,-21234);

select customerNumber, customerName, creditLimit
from customers
where customerNumber = 1001;




-- 1. "INSERT TRIGGER" :- 'After Insert Trigger'

-- Query 2
-- Create a new audit table.
create table customer_audit(
audit_id int auto_increment primary key,
customerNumber int,
customerName varchar(50),
action_time timestamp default current_timestamp
);



Delimiter $$

create trigger after_insert_customer
-- Only one Trigger can exist with a particular name.

After insert on customers
-- Specifies the table and event on which the Trigger will execute.

for each row

Begin

insert into customer_audit(customerNumber, customerName)
values(new.customerNumber, new.customerName);

end;

$$

Delimiter ;

-- Test the Trigger using an INSERT statement.
insert into customers(
customerNumber,
customerName,
contactLastName,
contactFirstName,
phone,
addressLine1,
addressLine2,
city,
state,
postalCode,
country,
salesRepEmployeeNumber,
creditLimit
)
values(
1003,"RC","verma","ramesh",1234,"gzb","gzb","gzb","up",2010,"india",1002,6483
);

select * from customer_audit;




-- 3. "DELETE TRIGGER" :- 'After Delete Trigger'

create table deleted_customers(
id int primary key auto_increment,
customerNumber int,
customerName varchar(50),
deleted_at timestamp default current_timestamp
);

Delimiter //

create trigger after_delete_customer

After delete on customers

for each row

Begin

insert into deleted_customers(customerNumber, customerName)
values(old.customerNumber, old.customerName);

end;

//

Delimiter ;

delete from customers
where customerNumber = 1003;

select * from deleted_customers;

-- Drop command
drop trigger after_delete_customer;
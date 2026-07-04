-- [IMPORTANT]
-- [INTERVIEW]
-- ["WINDOW FUNCTIONS"]
-- 1. Row_Number, 2. Rank (Important, Interview), 3. Dense_Rank (Important, Interview),
-- 4. Ntile, 5. Lag, 6. Lead, 7. First_Value, 8. Last_Value,
-- 9. Sum, 10. Avg, 11. Count

-- "Window Functions" help solve many analytical problems and interview questions.

use classicmodels;

-- 1. ROW_NUMBER
select ordernumber, productcode,
row_number() over(order by ordernumber desc) as 'R_N'
from orderdetails;


select customernumber, creditlimit,
row_number() over(order by creditlimit desc) as 'R_N'
from customers;


select customernumber, creditlimit,
row_number() over(order by creditlimit desc) as 'R_N'
from customers
limit 1,3;


-- [INTERVIEW]
-- "Query"
-- Find the fifth highest salary/creditLimit without using LIMIT.
select customerNumber, customerName, creditLimit
from (
select customerNumber, customerName, creditLimit,
row_number() over(order by creditLimit desc) as row_num
from customers
) as ranked
where row_num = 5;



-- 2. RANK (Important, Interview)

-- Assigns the same rank to equal values,
-- but skips the next rank number(s).

-- Example:
-- ID    Salary    RANK()
-- 1     9000      1
-- 2     8500      2
-- 3     8500      2
-- 4     8000      4

select customernumber, creditlimit,
rank() over(order by creditlimit desc) as Ranking
from customers;



-- 3. DENSE_RANK (Important, Interview)

-- Assigns the same rank to equal values,
-- but does not skip the next rank number.

-- Example:
-- ID    Salary    DENSE_RANK()
-- 1     9000      1
-- 2     8500      2
-- 3     8500      2
-- 4     8000      3

select customernumber, creditlimit,
dense_rank() over(order by creditlimit desc) as dense_Ranking
from customers;



-- 4. LAG
-- Returns the value from the previous row.

select customernumber, amount,
lag(amount) over(order by amount desc) as "lag"
from payments;


-- LAG with PARTITION BY (Important)

select customernumber, amount,
lag(amount) over(partition by customernumber order by amount desc) as "lag"
from payments;




-- 5. LEAD
-- Returns the value from the next row.

select customernumber, amount,
lead(amount) over(order by amount desc) as "lead"
from payments;


-- LEAD with PARTITION BY (Important)

select customernumber, amount,
lead(amount) over(partition by customernumber order by amount desc) as "lead"
from payments;


-- [INTERVIEW]
-- Difference between GROUP BY and PARTITION BY

-- GROUP BY:
-- Always groups the rows and returns a summarized result.

-- Example:
-- 103
-- 103
-- 103
-- These rows are grouped into a single result for customer 103.


-- PARTITION BY:
-- Processes data row by row within each partition.
-- The number of rows in the output remains the same as in the original table.


-- select * from classicmodels.productlines;


-- 6. FIRST_VALUE
-- Always works row by row.

select customernumber, amount,
first_value(amount) over(order by amount desc) as 'highest_amount'
from payments;


select customernumber, amount,
first_value(amount) over(partition by customernumber order by amount desc) as 'last_amount'
from payments;



-- 7. LAST_VALUE
-- Always works row by row.

select customernumber, amount,
last_value(amount) over(order by amount) as 'last_amount'
from payments;


select customernumber, amount,
last_value(amount) over(partition by customernumber order by amount desc) as 'last_amount'
from payments;




-- 8. NTILE
-- Divides the data into a specified number of groups (quartiles/buckets).

select customernumber, creditlimit,
ntile(6) over(order by creditlimit desc) as 'credit_limit_quartile'
from customers;



-- 9. SUM

select customernumber, paymentDate, amount,
sum(amount) over(partition by customernumber order by amount desc) as 'running_total'
-- Running Total / Cumulative Sum
from payments;



-- 10. COUNT

select customernumber, ordernumber,
count(ordernumber) over(partition by customernumber order by ordernumber desc) as 'running_orders'
from orders;


select customernumber, ordernumber,
count(ordernumber) over(partition by customernumber) as 'running_orders'
from orders;


-- GROUP BY

select customernumber, count(ordernumber)
from orders
group by customernumber;



-- 11. AVG

select customernumber, ordernumber,
avg(ordernumber) over(partition by customernumber order by ordernumber desc) as 'Avg_orders'
from orders;


select customernumber, ordernumber,
avg(ordernumber) over(partition by customernumber) as 'running_orders'
from orders;
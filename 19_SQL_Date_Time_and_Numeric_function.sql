-- MySQL Date and Time Functions (classicmodels Database)

-- 1. CURDATE() - Get the Current Date
SELECT CURDATE() AS current_date;
-- **Example Usage:** Get all orders placed today.  
SELECT orderNumber, orderDate, status
FROM orders
WHERE orderDate = CURDATE();
 
 
-- 2. CURTIME() - Get the Current Time
SELECT CURTIME() AS current_time;
-- **Example Usage:** Get all employees and show the current time.  
SELECT employeeNumber, firstName, lastName, CURTIME() AS current_time
FROM employees;

 
-- 3. NOW() - Get the Current Date and Time
SELECT NOW() AS current_datetime;
-- **Example Usage:** Get all customers along with the current timestamp.  
SELECT customerNumber, customerName, NOW() AS 'current_timestamp'
FROM customers;


-- 4. DATE() - Extract the Date from a DateTime
SELECT DATE(NOW()) AS extracted_date;
-- **Example Usage:** Get the order date without the time component.  
SELECT orderNumber, DATE(orderDate) AS order_only_date
FROM orders;


-- 5. YEAR() - Extract the Year from a Date
SELECT YEAR(CURDATE()) AS current_year;
-- **Example Usage:** Get all orders placed in 2023.  
SELECT orderNumber, orderDate
FROM orders
WHERE YEAR(orderDate) = 2023;


-- 6. MONTH() - Extract the Month from a Date
SELECT MONTH(CURDATE()) AS current_month;
-- **Example Usage:** Get all orders placed in January.  
SELECT orderNumber, orderDate
FROM orders
WHERE MONTH(orderDate) = 1;


-- 7. DAY() - Extract the Day from a Date
SELECT DAY(CURDATE()) AS current_day;
-- **Example Usage:** Get all orders placed on the 15th of any month.  
SELECT orderNumber, orderDate
FROM orders
WHERE DAY(orderDate) = 15;


-- 8. DAYNAME() - Get the Name of the Day
SELECT DAYNAME(CURDATE()) AS today_name;
-- **Example Usage:** Find all orders placed on a Monday.  
SELECT orderNumber, orderDate
FROM orders
WHERE DAYNAME(orderDate) = 'Monday';


-- 9. WEEK() - Get the Week Number of the Year
SELECT WEEK(CURDATE()) AS current_week;
-- **Example Usage:** Get all orders placed in the first week of the year.  
SELECT orderNumber, orderDate
FROM orders
WHERE WEEK(orderDate) = 1;


-- 10. TIMESTAMPDIFF() - Calculate the Difference Between Two Dates
SELECT TIMESTAMPDIFF(YEAR, '2000-01-01', CURDATE()) AS years_since_2000;
-- **Example Usage:** Find how many days have passed since an order was placed.  
SELECT orderNumber, orderDate, 
TIMESTAMPDIFF(DAY, orderDate, CURDATE()) AS days_since_order
FROM orders;


-- 11. DATE_ADD() - Add a Specific Interval to a Date
SELECT DATE_ADD(CURDATE(), INTERVAL 10 DAY) AS future_date;
-- **Example Usage:** Get orders that should be shipped 7 days after order date.  
SELECT orderNumber, orderDate, DATE_ADD(orderDate, INTERVAL 7 DAY) AS
expected_shipping_date
FROM orders;


-- 12. DATE_SUB() - Subtract a Specific Interval from a Date
SELECT DATE_SUB(CURDATE(), INTERVAL 30 DAY) AS date_30_days_ago;
-- **Example Usage:** Find all orders placed in the last 30 days.  
SELECT orderNumber, orderDate
FROM orders
WHERE orderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);


-- 13. LAST_DAY() - Get the Last Day of the Month
SELECT LAST_DAY(CURDATE()) AS last_day_of_month;
-- **Example Usage:** Find all orders placed on the last day of any month.  
SELECT orderNumber, orderDate
FROM orders
WHERE orderDate = LAST_DAY(orderDate);





-- MySQL Numeric Functions - classicmodels Database

-- 1. MAX: Get the maximum order amount from payments
SELECT MAX(amount) AS max_payment FROM payments;
 
 
-- 2. MIN: Get the minimum order amount from payments
SELECT MIN(amount) AS min_payment FROM payments;
 
 
-- 3. SUM: Get the total amount of payments received
SELECT SUM(amount) AS total_payments FROM payments;


-- 4. AVG: Get the average payment amount
SELECT AVG(amount) AS avg_payment FROM payments;


-- 5. COUNT: Count the number of payments made
SELECT COUNT(*) AS total_payments_count FROM payments;


-- 6. ABS: Get the absolute value of credit limit differences
SELECT customerNumber, ABS(creditLimit - 50000) AS credit_difference FROM customers;


-- 7. ROUND: Round the average payment amount to 2 decimal places
SELECT ROUND(AVG(amount), 2) AS rounded_avg_payment FROM payments;


-- 8. CEIL: Get the ceiling value of the highest payment
SELECT CEIL(MAX(amount)) AS max_payment_ceiling FROM payments;


-- 9. FLOOR: Get the floor value of the lowest payment
SELECT FLOOR(MIN(amount)) AS min_payment_floor FROM payments;


-- 10. MOD: Find the remainder when dividing orderNumber by 5
SELECT orderNumber, MOD(orderNumber, 5) AS remainder FROM orders;


-- 11. POWER: Calculate the square of credit limits
SELECT customerNumber, POWER(creditLimit, 2) AS squared_credit FROM customers;


-- 12. SQRT: Find the square root of the highest payment received
SELECT SQRT(MAX(amount)) AS sqrt_max_payment FROM payments;


-- 13. LOG: Get the natural logarithm (ln) of the average payment amount
SELECT LOG(AVG(amount)) AS log_avg_payment FROM payments;


-- 14. EXP: Calculate e raised to the power of the smallest payment amount
SELECT EXP(MIN(amount)) AS exp_min_payment FROM payments;


-- 15. SIGN: Check if the credit limit difference is positive, negative, or zero
SELECT customerNumber, SIGN(creditLimit - 50000) AS credit_sign FROM customers;


-- 16. TRUNCATE: Truncate the average payment to remove decimal places
SELECT TRUNCATE(AVG(amount), 0) AS truncated_avg_payment FROM payments;




-- MySQL String Functions Using ClassicModels Database

-- 1. CHAR_LENGTH - Get the length of a string
SELECT customerName, CHAR_LENGTH(customerName) AS name_length 
FROM customers 
LIMIT 10;


-- 2. CONCAT - Concatenate two or more strings
SELECT customerName, CONCAT(contactFirstName, ' ', contactLastName) AS full_name 
FROM customers 
LIMIT 10;


-- 3. LOWER - Convert text to lowercase
SELECT customerName, LOWER(customerName) AS lowercase_name 
FROM customers 
LIMIT 10;


-- 4. REVERSE - Reverse the string
SELECT customerName, REVERSE(customerName) AS reversed_name 
FROM customers 
LIMIT 10;


-- 5. UPPER - Convert text to uppercase
SELECT customerName, UPPER(customerName) AS uppercase_name 
FROM customers 
LIMIT 10;


-- 6. LTRIM - Remove leading spaces
SELECT customerName, LTRIM(customerName) AS trimmed_name 
FROM customers 
LIMIT 10;


-- 7. RTRIM - Remove trailing spaces
SELECT customerName, RTRIM(customerName) AS trimmed_name 
FROM customers 
LIMIT 10;


-- 8. TRIM - Remove both leading and trailing spaces
SELECT customerName, TRIM(customerName) AS trimmed_name 
FROM customers 
LIMIT 10;


-- 9. SUBSTRING - Extract part of a string
SELECT customerName, SUBSTRING(customerName, 1, 5) AS short_name 
FROM customers 
LIMIT 10;


-- 10. LOCATE - Find the position of a substring
SELECT customerName, LOCATE('Co', customerName) AS position 
FROM customers 
LIMIT 10;


-- 11. REPLACE - Replace part of a string
SELECT customerName, REPLACE(customerName, 'Co', 'Company') AS new_name 
FROM customers 
LIMIT 10;


-- 12. LEFT - Get the leftmost part of a string
SELECT customerName, LEFT(customerName, 5) AS left_part 
FROM customers 
LIMIT 10;


-- 13. RIGHT - Get the rightmost part of a string
SELECT customerName, RIGHT(customerName, 5) AS right_part 
FROM customers 
LIMIT 10;


-- 14. LPAD - Left pad a string with characters
SELECT customerName, LPAD(customerName, 20, '*') AS padded_name 
FROM customers 
LIMIT 10;


-- 15. RPAD - Right pad a string with characters
SELECT customerName, RPAD(customerName, 20, '-') AS padded_name 
FROM customers 
LIMIT 10;

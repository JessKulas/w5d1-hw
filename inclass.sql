-- differt types of SQL queries
-- SELECT => for reading data
-- UPDATE => updating data
-- INSERT => adding data
-- DELETE => deleting data

-- CRUD => create, read, update, delete

-- get first and last name columns from actor table
SELECT first_name, last_name
FROM actor;

-- get all columns from actor table
SELECT *
FROM actor;

-- get all actors with last name of "cage"
SELECT *
FROM actor 
WHERE last_name = 'Cage';

-- get the actors first and last only where the first name is 'nick'
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- get all actors with a last name that starts with 'W'
SELECT *
FROM actor 
WHERE last_name LIKE 'W%'; -- % = "wildcard"

-- get all actors with a last name that starts with 'W'
SELECT *
FROM actor 
WHERE last_name LIKE 'W___'; -- __ # OF underscore # OF letters TO find item

-- get all actors where the first name starts with k and ends with 'th'
-- must be atleast 5 charaters long
SELECT *
FROM actor
WHERE first_name LIKE 'K__%th';

-- comparing operators
-- greater than >
--less than <
-- greater than or equal >=
-- less than or equal <=
-- not equal <>

SELECT  *
FROM payment;

-- find all payments > 8$
SELECT *
FROM payment 
WHERE amount > 8;

-- find all payments less than 7.99
SELECT *
FROM payment 
WHERE amount < 7.99;

-- find all payments less than or equal 7.99
SELECT *
FROM payment 
WHERE amount <= 7.99;

-- find all payments not equal to 5.99
SELECT *
FROM payment 
WHERE amount <> 5.99;

-- find all payments between 5.99 and 7.99
SELECT *
FROM payment 
WHERE amount > 5.99 AND amount < 7.99;

SELECT *
FROM payment 
WHERE amount BETWEEN 5.99 AND 7.99;

SELECT *
FROM payment 
WHERE amount > 5.99 OR amount < 7.99;

-- comparison op of strings
-- find all with actors name that comes after vivien alphabet
SELECT *
FROM actor
WHERE first_name > 'Vivien';

-- find all actors that come alphbet before 'nick'
SELECT *
FROM actor
WHERE first_name < 'Nick';


-- order by clause

-- find all actor by alphabet of last NAME
SELECT *
FROM actor
ORDER BY last_name;

-- find all actor by reverse alphabet order of last NAME
SELECT *
FROM actor
ORDER BY last_name DESC;

-- find all actors that come alphbet before 'nick', sort alphabet
SELECT *
FROM actor
WHERE first_name < 'Nick'
ORDER BY first_name;

-- find all payments less than 7.99, descending order
SELECT *
FROM payment 
WHERE amount < 7.99
ORDER BY amount DESC;


-- sql aggregations => sum, count, min, max, avg

-- find the total payments amounts ever
SELECT sum(amount)
FROM payment ;

-- find the number of payments made ever
SELECT count(*) 
FROM payment;

-- rename the column to payment_count
SELECT count(*) AS payment_count
FROM payment;

-- find the avg payment made ever
SELECT avg(amount)
FROM payment;

-- find the smallest payment ever made
SELECT min(amouont)
FROM payment;

-- find the largest payment ever made
SELECT max(amount)
FROM payment;

--find the avg payment made ever, excluding free rentals
SELECT avg(amount)
FROM payment
WHERE amount <> 0;

-- find how many payment have the amount of 0
SELECT count(*)
FROM payment
WHERE amount = 0;

-- find sum of payments for each customer
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id;

--find the customer who has spent the most money
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
ORDER BY sum DESC
LIMIT 13;
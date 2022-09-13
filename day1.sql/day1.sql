-- Different types of SQL queries
-- SELECT => For reading data
-- UPDATE => For updating data
-- INSERT => For adding data
-- DELETE => For deleting data

-- CRUD => Create, Read, Update, Delete

-- Get first and last name columns from the actor table
SELECT first_name, last_name
FROM actor;

-- Get all columns from the actor table
SELECT *
FROM actor;

-- Get all actors with a last name of "Cage"
SELECT *
FROM actor
WHERE last_name = 'Cage';

-- Get the actor's first and last name ONLY where the first name is 'Nick'
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Get all of the actors with a last name that starts with 'W'
SELECT *
FROM actor
WHERE last_name LIKE 'W%'; -- % - "Wildcard", _ - 

-- Get all of the actors with a last name that starts with 'W' and is 4 characters long
SELECT *
FROM actor
WHERE last_name LIKE 'W___'; -- % - "Wildcard", _ - 

-- Get all of the actors  where their first name starts with a 'K' and ends with a 'th'
-- Must be at least 5 characters long
SELECT *
FROM actor
WHERE first_name LIKE 'K__%th'; -- Kenneth OR Keith BUT COULD NOT BE Kath

-- Comparing Operators
-- Greater than >
-- Less than <
-- Greater than or equal >=
-- Less than or equal <=
-- Not equal <>

SELECT *
FROM payment;

-- Find all payments greater than $8
SELECT *
FROM payment
WHERE amount > 8;

-- Find all payments less than 7.99
SELECT *
FROM payment
WHERE amount < 7.99;

-- Find all payments less than or equal to 7.99
SELECT *
FROM payment
WHERE amount <= 7.99;

-- Find all payments that are not equal to 5.99
SELECT *
FROM payment
WHERE amount <> 5.99;

-- Find all payments between 5.99 and 7.99
SELECT *
FROM payment
WHERE amount >= 5.99 AND amount <= 7.99;

-- Find all payments between 5.99 and 7.99, USING BETWEEN
SELECT *
FROM payment
WHERE amount BETWEEN 5.99 AND 7.99;

-- Find all payments less than 5.99 and greater than 7.99.
SELECT *
FROM payment
WHERE amount <= 5.99 OR amount >= 7.99;

-- Comparison operators on strings

-- Find all actors with a first name that comes after Vivien alphabetically
SELECT *
FROM actor
WHERE first_name > 'Vivien';

-- Find all actors that come alphabetically before 'Nick'
SELECT *
FROM actor
WHERE first_name < 'Nick';

-- Find all actors that don't have the first name 'Ed'
SELECT *
FROM actor
WHERE first_name <> 'Ed';

-- ORDER BY clause

-- Find all actors by alphabetical order of their last name
SELECT *
FROM actor
ORDER BY last_name;

-- Find all actors by reverse alphabetical order of their last name
SELECT *
FROM actor
ORDER BY last_name DESC;

-- Find all actors that come alphabetically before 'Nick', sort alphabetically by first name
SELECT *
FROM actor
WHERE first_name < 'Nick'
ORDER BY first_name; -- ORDER BY COMES AFTER THE WHERE CLAUSE

-- Find all payments less than 7.99, order by payments descending
SELECT *
FROM payment
WHERE amount < 7.99
ORDER BY amount DESC;

-- SQL Aggregations => SUM, COUNT, MIN, MAX, AVG

-- Find the total payment amount made EVER
SELECT SUM(amount)
FROM payment;

-- Find the number of payments made EVER
SELECT COUNT(*)
FROM payment;

-- Find the number of payments made EVER
-- Rename the column to payment_count
SELECT COUNT(*) AS payment_count
FROM payment;

-- Find the average payment made EVER
SELECT AVG(amount)
FROM payment;

-- Find the smallest payment ever made
SELECT MIN(amount)
FROM payment;

-- Find the largest payment ever made
SELECT MAX(amount)
FROM payment;

-- Find the average payment made EVER, excluding free rentals
SELECT AVG(amount)
FROM payment
WHERE amount <> 0;

-- Find how many payments have an amount of 0
SELECT COUNT(*)
FROM payment
WHERE amount = 0;

-- Find sum of payments for each customer
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- Find sum of payments for each customer, who spent over $200
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200
ORDER BY customer_id;

-- Find the customer who has spent the most money
SELECT customer_id, SUM(amount) AS total_payments
FROM payment
GROUP BY customer_id
ORDER BY total_payments DESC
LIMIT 1;

-- In the film_actor table, find the actor who has acted in the most films
SELECT actor_id, COUNT(*) AS film_count
FROM film_actor
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 1;

-- Find all of the actor id's who have acted in 20 or more films
SELECT actor_id, COUNT(*) AS film_count
FROM film_actor
GROUP BY actor_id
HAVING COUNT(*) >= 20
ORDER BY film_count DESC;

-- Find all of the actor id's who have acted in 20 or less films
SELECT actor_id, COUNT(*) AS film_count
FROM film_actor
GROUP BY actor_id
HAVING COUNT(*) <= 20
ORDER BY film_count DESC;

-- Find how many actors are in the actor table
SELECT COUNT(*)
FROM actor;

-- Find how many unique first names are in the actor table
SELECT COUNT(DISTINCT first_name)
FROM actor;

-- Find the unique first names are in the actor table
SELECT DISTINCT first_name
FROM actor
ORDER BY first_name;


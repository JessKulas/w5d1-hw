--1. How many actors are there with the last name ‘Wahlberg’?
SELECT *
FROM actor 
WHERE last_name = 'Wahlberg';


--2. How many payments were made between $3.99 and $5.99?
SELECT count(*) 
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;


--3. What film does the store have the most of? (search in inventory)
 SELECT max(amount)
FROM inventory;

************************************************************************


--4. How many customers have the last name ‘William’?
SELECT count(*) 
FROM customer  
WHERE last_name = 'William';


--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id) AS most_sold
FROM rental
GROUP BY staff_id 
ORDER BY most_sold DESC
LIMIT 1;


--6. How many different district names are there?
SELECT district  
FROM address
GROUP BY district;

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT max(film_id) 
FROM film_actor;


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, COUNT(*) AS customers_table
FROM customer 
WHERE store_id = 1 AND last_name LIKE '%es'
GROUP BY store_id;


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount) AS answer
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
HAVING COUNT(rental_id) > 250;


--10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(DISTINCT rating) AS amount_of_rating_categories
FROM film;

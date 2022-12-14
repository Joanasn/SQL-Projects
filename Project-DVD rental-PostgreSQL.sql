/*

Project Description: DVD rentals. 
The DVD rental store wants to use the data to know about their customers, their preferences and 
movements. Having this specific infomation will help the store evaluate about prices, reach to clients
for specific questions or sales and mainly, know if the strategy they are using so far is working. 


I will be stating situations as a dvd rental company, from looking up customers, inventory, costs, etc. 

** = Result shown in Tableau

*/


-- Send a promotional email to our current customers

SELECT * FROM customer

SELECT first_name, last_name, email
FROM customer
ORDER BY 2,1

-- What type of ratings do we currently have on our movies?

SELECT * FROM film

SELECT DISTINCT rating
FROM film
ORDER BY rating

-- Send a mail to a customer called Nancy Thomas that forgot their wallet at the store

SELECT * FROM customer

SELECT email
FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas'

--What's the movie "Outlaw Hanky" about?

SELECT title, description FROM film
WHERE title ILIKE '%hanky%'

-- Follow up customer that are late on their movie return and lives at "259 Ipoh Drive"

SELECT phone
FROM address
WHERE address ILIKE '%ipoh drive%'

-- Reward our first 10 paying customers

SELECT customer_id 
FROM payment
ORDER BY payment_date ASC
LIMIT 10

-- What are our 5 shortest (in leght) movies?

SELECT * 
FROM film
WHERE length <= 50
ORDER BY length

-- How many payment transactions were greater than $ 5.00?

SELECT * FROM payment
WHERE amount >= 5
ORDER BY amount


-- How many unique districts are our customers from?

SELECT count(DISTINCT(district))
FROM address

SELECT DISTINCT (district)
FROM address
ORDER district

-- How many films have a rating of R and a replacement cost between $ 5 and $ 15?

SELECT count(*) FROM film
WHERE RATING = 'R'
AND replacement_cost BETWEEN 5 AND 15

-- Films with the word TRUMAN in the title

SELECT * FROM film
WHERE title ILIKE '%TRUMAN%'

-- What customer id is spending the most money?

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC

-- How many transactions do the clients have in total?

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC

-- How much have the customers spent in total with each staff?

SELECT customer_id, staff_id, SUM (amount)
FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id, sum(amount)

**-- How much payments have we received each day?

SELECT DATE(payment_date), SUM(amount)
FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date)

-- Which staff member handled the most payments regarding sells and not dollar amount?

SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id
ORDER BY count(amount) DESC

-- Average replacement cost per rating

SELECT ROUND(AVG(replacement_cost), 2), rating
FROM film
GROUP BY rating

-- Reward 5 top customers with coupons

SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)DESC
LIMIT 5

-- 40 top customers that have 40 or more transaction payment

SELECT customer_id, COUNT(amount) 
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40

-- Emails of the customer who live in California

SELECT email, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district ILIKE 'california'
ORDER BY 1

-- A list of all the movies 'Nick Wahlberg' has been in

SELECT film.title, actor.first_name, actor.last_name
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name ILIKE 'nick'
AND actor.last_name ILIKE 'wahlberg'
ORDER BY 1

-- Amount of movies that each customer have rented out?

SELECT rental.customer_id, customer.first_name, customer.last_name, count(rental.customer_id)
FROM rental
JOIN customer
ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id, customer.first_name, customer.last_name
ORDER BY 2


-- Who are the customers from USA?

SELECT customer.customer_id, customer.first_name, customer.last_name, city.city, address.district
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country.country ILIKE 'united states'
ORDER BY 1

** -- From how many districts are our customers from?

SELECT address.district, COUNT(district)
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id
GROUP BY district
ORDER BY 1

-- Show how many cities are per country?

SELECT country.country, count(city.country_id)
FROM city
INNER JOIN country
ON city.country_id = country.country_id
GROUP BY country.country, city.country_id

** -- The top 10 countries where our customers are from

SELECT country.country, count(city.country_id)
FROM city
INNER JOIN country
ON city.country_id = country.country_id
GROUP BY country.country, city.country_id
ORDER BY 2 DESC
LIMIT 10

-- Payment date organized on European standard

SELECT TO_CHAR(payment_date, 'DD-MM-YYYY')
FROM payment

-- During which months did payments occur? (With the full written month)

SELECT DISTINCT(TO_CHAR(payment_date, 'Month'))
FROM payment

-- How many payments occured on a Monday?

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1

-- Films that have been returned between 2005-05-29 to 2005-05-30

SELECT film_id, title 
FROM film
WHERE film_id IN
(select inventory.film_id 
from rental
INNER JOIN inventory 
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
order by 1

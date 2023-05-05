--1. List all customers who live in Texas (use JOINs)
SELECT * FROM customer
JOIN address AS ad
ON ad.address_id = customer.address_id
JOIN city
ON city.city_id =ad.city_id
WHERE city = 'Texas';
--Answer: None

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT concat(first_name,' ',last_name) AS full_name,count(amount),amount
FROM customer
JOIN payment AS p
ON p.customer_id = customer.customer_id
WHERE amount > 6.99
GROUP BY full_name, amount;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (
 SELECT customer_id
 FROM payment
 GROUP BY customer_id
 HAVING sum(amount) > 175);



--4. List all customers that live in Nepal (use the city table)
SELECT * FROM city
JOIN address AS a
ON a.city_id  = city.city_id 
JOIN customer AS c
ON c.address_id = a.address_id
WHERE city = 'Nepal';

--5. Which staff member had the most transactions?
SELECt concat (first_name, ' ',last_name) AS fullname, count(rental_id) FROM staff
JOIN payment AS p
ON p.staff_id = staff.staff_id 
GROUP BY fullname
ORDER BY count(rental_id) DESC;

--6. How many movies of each rating are there?
SELECT count(title),rating 
FROM film
GROUP BY rating
ORDER BY count(title) DESC; 
--Answer 223	
--PG-13
--210	NC-17
--195	R
--194	PG
--178	G

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT concat(first_name ,' ',last_name) AS full_name, amount FROM customer
JOIN payment AS p
ON p.customer_id =customer.customer_id 
WHERE amount > 6.99;
--8. How many free rentals did our stores give away?
SELECT * FROM 
rental 
JOIN payment AS p
ON p.rental_id = rental.rental_id 
WHERE amount = 0;



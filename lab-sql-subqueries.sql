USE sakila;
-- Determine the number of copies of the film "Hunchback Impossible" 
-- that exist in the inventory system.
SELECT COUNT(*) AS number_of_copies
FROM inventory
WHERE film_id = (
    SELECT film_id
    FROM film
    WHERE title = 'Hunchback Impossible'
);

SELECT COUNT(*) AS number_of_copies
FROM inventory inv
INNER JOIN film f
ON f.film_id = inv.film_id
WHERE f.title = 'Hunchback Impossible';

-- List all films whose length is longer than the average length of 
-- all the films in the Sakila database.

SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT fa.actor_id
    FROM film_actor fa
    INNER JOIN film f ON fa.film_id = f.film_id
    WHERE f.title = 'Alone Trip'
);


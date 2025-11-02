USE sakila;
-- 1 
SELECT * FROM film_category;

SELECT category_id, COUNT(film_id) FROM film_category 
GROUP BY category_id;

-- 2
SELECT * FROM store;
SELECT * FROM address;

SELECT * FROM city;
SELECT * FROM country;


SELECT s.store_id,
	   a.address_id,
       c.city,
       co.country
FROM store AS s
JOIN address AS a
USING(address_id)
JOIN city AS c
ON a.city_id = c.city_id
JOIN country AS co
on co.country_id = c.country_id;

-- 3
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM store;
SELECT * FROM customer;

SELECT s.store_id,
		-- c.customer_id,
        -- r.rental_id,
        CONCAT('$', FORMAT(SUM(p.amount), 2)) AS total_revenue
FROM store AS S
JOIN customer AS C
USING(store_id)
JOIN rental AS r
ON c.customer_id = r.customer_id
JOIN payment AS p 
ON r.rental_id = p.rental_id
GROUP BY s.store_id;
        
	
    
-- 4 
SELECT * FROM film;
SELECT * FROM film_category;

SELECT fc.category_id,
		AVG(f.length)
FROM film AS f
JOIN film_category AS fc
USING(film_id)
GROUP BY fc.category_id;
	   
 























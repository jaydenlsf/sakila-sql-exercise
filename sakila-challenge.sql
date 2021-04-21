SHOW DATABASES;
USE sakila;
SHOW tables;

#1
SELECT * FROM actor;

#2
SELECT last_name FROM actor
WHERE first_name="John";

#3
SELECT * FROM actor
WHERE last_name="Neeson";

#4
SELECT * FROM actor
WHERE actor_id%10=0;

#5
SELECT * FROM film
WHERE film_id=100;

#6
SELECT * FROM film
WHERE rating="R";

#7
SELECT * FROM film
WHERE rating!="R";

#8
SELECT * FROM film
ORDER BY length ASC
LIMIT 10;

#9
SELECT * FROM film
WHERE length=(
	SELECT MAX(length) FROM film
);

#10
SELECT * FROM film
WHERE special_features LIKE "%Deleted Scenes%";

#11
DESCRIBE actor;
SELECT last_name, COUNT(last_name) c FROM actor
GROUP BY last_name
HAVING c=1;

#12
SELECT last_name, COUNT(last_name) c FROM actor
GROUP BY last_name
HAVING c>1
ORDER BY c DESC;

#13
CREATE VIEW actor_movies
AS
	SELECT actor_id, COUNT(actor_id) num_of_movies FROM film_actor
    GROUP BY actor_id
    ORDER BY num_of_movies DESC
;

SELECT a.actor_id, a.first_name, a.last_name, am.num_of_movies FROM actor a
JOIN actor_movies am ON am.actor_id=a.actor_id
ORDER BY am.num_of_movies DESC
LIMIT 1;

#14 (unfinished)
SELECT * FROM film
WHERE title="Academy Dinosaur";



#15
SELECT AVG(length) FROM film_list;

#16
SELECT category, AVG(length) FROM film_list
GROUP BY category;

#17
SELECT * FROM film_list
WHERE description LIKE "%Robot%";

#18
SELECT COUNT(title) FROM film
WHERE release_year=2010;

#19
SELECT title from film_list
WHERE category="Horror";

#20
SELECT first_name, last_name FROM staff
WHERE staff_id=2;

#21
SELECT f.title FROM film_actor fa
JOIN actor a ON a.actor_id=fa.actor_id
JOIN film f ON f.film_id=fa.film_id
WHERE a.first_name='Fred' AND a.last_name='Costner';

#22
SELECT COUNT(DISTINCT country) FROM country;

#23
SELECT name FROM language
ORDER BY name DESC;

#24
SELECT first_name, last_name FROM actor
WHERE last_name LIKE "%son"
ORDER BY first_name ASC;

#25
SELECT category, COUNT(category) c FROM film_list
GROUP BY category
ORDER BY c DESC
LIMIT 1;

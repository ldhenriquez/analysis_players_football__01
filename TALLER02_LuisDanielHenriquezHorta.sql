USE sakila;

-- ============================================================
-- TALLER 02 - SQL Practico con base de datos Sakila
-- ============================================================


-- ============================================================
-- PARTE 1 - SELECT y WHERE
-- ============================================================

-- 1. Nombre y apellido de todos los clientes
SELECT first_name, last_name
FROM customer;

-- 2. Peliculas con duracion mayor a 120 minutos
SELECT title, length
FROM film
WHERE length > 120;


-- ============================================================
-- PARTE 2 - ORDER BY
-- ============================================================

-- 3. Clientes ordenados por apellido de la A a la Z
SELECT first_name, last_name
FROM customer
ORDER BY last_name ASC;

-- 4. Top 5 peliculas mas largas
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 5;


-- ============================================================
-- PARTE 3 - INNER JOIN
-- ============================================================

-- 5. Monto y fecha del pago con nombre y apellido del cliente
--    payment tiene customer_id, con eso hago el join
SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id;

-- 6. Peliculas alquiladas
--    rental -> inventory -> film (hay que pasar por inventory porque rental no tiene film_id directo)
SELECT f.title, r.rental_date
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id;


-- ============================================================
-- PARTE 4 - LEFT JOIN
-- ============================================================

-- 7. Clientes sin pagos
--    LEFT JOIN trae todos los clientes, los que no tienen pago quedan con NULL en payment
SELECT c.first_name, c.last_name
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL;

-- 8. Peliculas sin actores
SELECT f.title, f.length
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id IS NULL;


-- ============================================================
-- PARTE 5 - INSERT, UPDATE, DELETE
-- ============================================================

-- 9. Insertar actor temporal
INSERT INTO actor (first_name, last_name)
VALUES ('Juan', 'Perez');

-- 10. Actualizar el nombre del actor que inserte
UPDATE actor
SET first_name = 'Carlos'
WHERE first_name = 'Juan' AND last_name = 'Perez';

-- 11. Eliminar el actor
DELETE FROM actor
WHERE first_name = 'Carlos' AND last_name = 'Perez';


-- ============================================================
-- PARTE 6 - Consultas Avanzadas
-- ============================================================

-- 12. Top 5 clientes con mayor dinero pagado
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_pagado
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_pagado DESC
LIMIT 5;

-- 13. Top 5 peliculas mas alquiladas
--     cuento cuantas veces aparece cada film en rental y ordeno
SELECT f.title, COUNT(r.rental_id) AS total_alquileres
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.title
ORDER BY total_alquileres DESC
LIMIT 5;

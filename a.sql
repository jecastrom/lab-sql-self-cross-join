SELECT
    f1.film_id,
    f.title AS film_title,
    f1.actor_id,
    concat(a.first_name, ' ', a.last_name) AS actor_1,
    f2.actor_id,
    concat(a.first_name, ' ', a.last_name) AS actor_2
FROM
    film_actor f1
    INNER JOIN film_actor f2 ON f1.film_id = f2.film_id
    AND f1.actor_id < f2.actor_id
    INNER JOIN film f ON f.film_id = f1.film_id
    INNER JOIN actor a ON f1.actor_id = a.actor_id
LIMIT
    10;
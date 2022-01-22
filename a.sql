SELECT
    f.title AS film_title,
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor_1,
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor_2
FROM
    film_actor f1
    INNER JOIN film_actor f2 ON f1.actor_id > f2.actor_id
    AND f1.film_id = f2.film_id
    INNER JOIN actor a1 ON f1.actor_id = a1.actor_id
    INNER JOIN actor a2 ON f2.actor_id = a2.actor_id
    INNER JOIN film f ON f1.film_id = f.film_id
ORDER BY
    1,
    2,
    3
LIMIT
    5;
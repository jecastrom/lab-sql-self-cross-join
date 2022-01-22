SELECT
    c1.customer_id,
    concat(c1.first_name, ' ', c1.last_name) AS customer_name1,
    c2.customer_id,
    concat(c2.first_name, ' ', c2.last_name) AS customer_name2,
    count(r1.rental_id) AS number_of_rents_over_3_times
FROM
    customer c1
    INNER JOIN rental r1 ON r1.customer_id = c1.customer_id
    INNER JOIN inventory i1 ON i1.inventory_id = r1.inventory_id
    INNER JOIN film f1 ON i1.film_id = f1.film_id
    INNER JOIN inventory i2 ON f1.film_id = i2.film_id
    INNER JOIN rental r2 ON i2.inventory_id = r2.inventory_id
    INNER JOIN customer c2 ON r2.customer_id = c2.customer_id
WHERE
    c1.customer_id != c2.customer_id
GROUP BY
    1,
    3
HAVING
    count(*) > 3
ORDER BY
    5 DESC
LIMIT
    10;
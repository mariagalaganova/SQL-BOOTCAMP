WITH visits AS (SELECT pizzeria.name,
                       COUNT(pizzeria_id),
                       'visit' AS action_type
                FROM person_visits 
                         JOIN pizzeria  ON person_visits.pizzeria_id = pizzeria.id
                GROUP BY 1
                ORDER BY 2 DESC
                LIMIT 3),
     orders AS (SELECT pizzeria.name,
                       COUNT(pizzeria.name),
                       'order' AS action_type
                FROM person_order 
                         JOIN menu ON person_order.menu_id = menu.id
                         JOIN pizzeria  ON menu.pizzeria_id = pizzeria.id
                GROUP BY 1
                ORDER BY 2 DESC
                LIMIT 3)
SELECT *
FROM visits
UNION ALL
SELECT *
FROM orders
ORDER BY 3 ASC, 2 DESC;
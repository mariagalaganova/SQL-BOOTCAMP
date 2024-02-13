SELECT name
FROM person
INNER JOIN person_order
ON person.id = person_order.person_id
INNER JOIN menu
ON person_order.menu_id = menu.id
WHERE gender = 'female'
AND menu.pizza_name = 'cheese pizza'

INTERSECT

SELECT name
FROM person
INNER JOIN person_order
ON person.id = person_order.person_id
INNER JOIN menu
ON person_order.menu_id = menu.id
WHERE gender = 'female'
AND menu.pizza_name = 'pepperoni pizza'
ORDER BY name 


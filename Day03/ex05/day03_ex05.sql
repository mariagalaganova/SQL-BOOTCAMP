SELECT pizzeria.name
FROM person_visits
INNER JOIN person
ON person_visits.person_id = person.id
INNER JOIN pizzeria
ON person_visits.pizzeria_id = pizzeria.id
WHERE person.name = 'Andrey'

EXCEPT

SELECT pizzeria.name
FROM person_order
INNER JOIN person
ON person_order.person_id = person.id
INNER JOIN menu 
ON menu.id = person_order.menu_id
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Andrey'
ORDER BY 1

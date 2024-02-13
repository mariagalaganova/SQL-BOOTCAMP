SELECT person.address, pizzeria.name, COUNT(*) count_of_orders
FROM person 
INNER JOIN person_visits ON person_visits.person_id = person.id
INNER JOIN pizzeria  ON pizzeria.id = person_visits.pizzeria_id
GROUP BY 1, 2
ORDER BY 1, 2;


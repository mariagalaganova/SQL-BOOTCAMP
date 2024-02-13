WITH orders_intersect_visit AS(SELECT order_date AS action_date, person_id
FROM person_order

INTERSECT ALL
SELECT visit_date AS action_date, person_id
FROM person_visits
ORDER BY action_date, person_id DESC)

SELECT action_date, person.name
FROM orders_intersect_visit 
INNER JOIN person on orders_intersect_visit.person_id=person.id
order by 1,2 DESC
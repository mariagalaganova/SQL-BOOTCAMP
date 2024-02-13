SELECT A.id AS person_id, A.name AS person_name, A.age, A.gender, A.address,
B.id AS pizzeria_id, B.name AS pizzeria_name, B.rating
FROM person AS A
	CROSS JOIN pizzeria AS B
	
ORDER BY A.id, B.id


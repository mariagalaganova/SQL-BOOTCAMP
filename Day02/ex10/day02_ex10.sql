SELECT 
    P1.name AS person_name1,
    P2.name AS person_name2,
    P1.address AS common_address
FROM person AS P1
INNER JOIN person AS P2
ON P1.id > P2.id 
WHERE P1.address = P2.address
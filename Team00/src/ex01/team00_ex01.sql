DROP TABLE IF EXISTS nodes cascade;

CREATE TABLE nodes
(point1 VARCHAR, point2 VARCHAR, cost INTEGER);

INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'b', 10);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'a', 10);

INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'c', 15);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'a', 15);

INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'd', 20);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'a', 20);

INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'c', 35);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'b', 35);

INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'd', 25);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'b', 25);

INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'd', 30);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'c', 30);


WITH RECURSIVE rec AS (
SELECT 'a' AS all, nodes.point1 AS current, 0 AS sum_cost, 1 AS iter  FROM nodes WHERE point1 = 'a' 

UNION

SELECT rec.all || ',' || nodes.point2, nodes.point2, rec.sum_cost + nodes.cost, iter + 1 
FROM nodes, rec 
WHERE rec.current = nodes.point1 AND iter < 4 AND rec.all NOT LIKE '%' || nodes.point2 || '%')


SELECT sum_cost + nodes.cost AS total_cost, '{' || rec.all || ',a' || '}' AS tour
FROM rec
JOIN nodes
ON nodes.point1 = rec.current AND nodes.point2 = 'a'
WHERE rec.iter = 4
order by 1,2;
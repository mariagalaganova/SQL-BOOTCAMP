SELECT DISTINCT address,
                ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
                ROUND(AVG(age::numeric), 2) AS average,
                (MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))) > AVG(age::numeric) AS comparison
FROM person 
GROUP BY 1
ORDER BY 1;

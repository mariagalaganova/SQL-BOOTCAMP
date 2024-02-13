-- Сессия 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;

-- Сессия 2
SELECT * FROM pizzeria;

-- Сессия 1
COMMIT;

-- Сессия 2
SELECT * FROM pizzeria;

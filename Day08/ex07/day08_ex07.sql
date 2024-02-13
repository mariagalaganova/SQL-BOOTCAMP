-- Сессия 1
BEGIN;

-- Сессия 2
BEGIN;

-- Сессия 1
UPDATE pizzeria SET rating = 2 WHERE name = 'Pizza Hut';

-- Сессия 2
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';

-- Сессия 1
UPDATE pizzeria SET rating = 1 WHERE name = 'Dominos';

-- Сессия 2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

-- Сессия 1
COMMIT;

-- Сессия 1
COMMIT;


-- LOCKING RECORD OTOMATIS

START TRANSACTION;

SELECT * FROM guestbooks;

-- Dia bakal nunggu sampe user 1 commit atau rollback
UPDATE guestbooks
SET title = 'Diubah oleh User 2'
WHERE id = 9;

COMMIT;








-- LOCKING RECORD MANUAL

START TRANSACTION;

SELECT * FROM products;

-- Dia bakal nunggu sampe user 1 commit atau rollback
SELECT * FROM products 
WHERE id = 'P0001' FOR UPDATE;

UPDATE products
SET quantity = (quantity - 10)
WHERE id = 'P0001';

COMMIT;
SELECT * FROM products;









-- DEADLOCK

START TRANSACTION;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

-- Deadlock found when trying to get lock; try restarting transaction
-- Dan akan di rollback










-- LOCK TABLES READ

-- Dia bakal nunggu sampe user yang lock meng unlock tables;
UPDATE products
SET quantity = 100 WHERE id = 'P0001';

UNLOCK TABLES;

SELECT * FROM products;





-- LOCK TABLES WRITE

UPDATE products
SET quantity = 100 WHERE id = 'P0001';

UNLOCK TABLES;

SELECT * FROM products;






-- LOCK INSTANCE
LOCK INSTANCE FOR BACKUP;


ALTER TABLE products
ADD COLUMN sample varchar(100);

ALTER TABLE products
DROP COLUMN sample;


UNLOCK INSTANCE;
























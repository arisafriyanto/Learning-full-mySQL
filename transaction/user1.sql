-- LOCKING RECORD OTOMATIS

START TRANSACTION;

SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah oleh User 1'
WHERE id = 9;

-- Jadi ketika kita update dan user lain update data yang sama, 
-- dia akan menunggu sampe kita commit atau rollback

COMMIT;






-- LOCKING RECORD MANUAL

START TRANSACTION;

SELECT * FROM products;

/*
    Misal stok 100 kita select disini ada 100 dan di user lain ada yang select 100
    dan diuser ini kita update kurangi 100 maka stok 0, tetapi diuser lain stok masih 100
    dan user lain kurangin 10 maka jadinya stok -10 nahh
    
	select yang akan dilock jika ada yang select data yang sama oleh user lain akan disuruh nunggu sampe
    proses transaction di user ini commit.
*/
SELECT * FROM products 
WHERE id = 'P0001' FOR UPDATE;

UPDATE products
SET quantity = (quantity - 10)
WHERE id = 'P0001';

COMMIT;







-- DEADLOCK

START TRANSACTION;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;

-- Deadlock found when trying to get lock; try restarting transaction
-- Dan akan di rollback









-- LOCK TABLES READ

LOCK TABLES products READ;

UPDATE products
SET quantity = 100 WHERE id = 'P0001';

UNLOCK TABLES;

SELECT * FROM products;



-- LOCK TABLES WRITE

LOCK TABLES products WRITE;

UPDATE products
SET quantity = 150 WHERE id = 'P0001';

UNLOCK TABLES;

SELECT * FROM products;






-- LOCK INSTANCE
LOCK INSTANCE FOR BACKUP;


UNLOCK INSTANCE;

ALTER TABLE products
ADD COLUMN sample varchar(100);

ALTER TABLE products
DROP COLUMN sample;


















-- Transaction
-- Database Transaction
/*
	Database transaction adalah ﬁtur di DBMS dimana kita bisa memungkinan beberapa perintah
dianggap menjadi sebuah kesatuan perintah yang kita sebut transaction
Jika terdapat satu saja proses gagal di transaction, maka secara otomatis perintah-perintah
sebelumnya akan dibatalkan
Jika sebuah transaction sukses, maka semua perintah akan dipastikan sukses
*/

-- MEMULAI TRANSAKSI
START TRANSACTION;

INSERT INTO guestbooks (email, title, content)
VALUES  ('example1@gmail.com', 'example 1', 'example 1'),
		('example2@gmail.com', 'example 2', 'example 2'),
        ('example3@gmail.com', 'example 3', 'example 3');

-- Setelah insert datanya ada tapi cuma disini, kita coba select di terminal belum masuk karena blm commit
-- jadi kalo misal ada 2 user di aplikasi misal user 1 insert data tapi blm commit maka user 2 tidak akan 
-- bisa melihat datanya
SELECT * FROM guestbooks;

COMMIT;


START TRANSACTION;

-- Setelah delete datanya ilang tapi cuma disini, kita coba select di terminal belum ilang karena blm commit
DELETE FROM guestbooks;

-- rollback untuk membatalkan semua delete nya
ROLLBACK;

SELECT * FROM guestbooks;




/*
	Yang Tidak Bisa Menggunakan Transaction

Perintah DDL (Data Deﬁnition Language) tidak bisa menggunakan ﬁtur transaction
DDL adalah perintah-perintah yang digunakan untuk merubah struktur, seperti membuat tabel,
menambah kolom, menghapus tabel, menghapus database, dan sejenisnya
Transaction hanya bisa dilakukan pada perintah DML (Data Manipulation Language), seperti
operasi INSERT, UPDATE dan DELETE

*/

-- User Management
/*
	Root User
    
	Secara default, mysql membuat root user sebagai super administrator
	Namun best practice nya, saat kita menjalankan MySQL dengan aplikasi yang kita buat, sangat
	disarankan tidak menggunakan user root
	Lebih baik kita buat user khusus untuk tiap aplikasi, bahkan kita bisa batasi hak akses user
	tersebut, seperti hanya bisa melakukan SELECT, dan tidak boleh melakukan INSERT, UPDATE atau
	DELETE
*/


/*
	Hak Akses dan User
	Dalam user management MySQL, kita akan mengenal istilah Hak Akses dari User
*/


## USER

-- Membuat User
CREATE USER 'aris'@'localhost';		-- hanya bisa diakses di local, mesin ini sendiri
CREATE USER 'afriyan'@'%';			-- global, diakses dimana pun, tidak recommended

-- Menghapus User
DROP USER 'aris'@'localhost';
DROP USER 'afriyan'@'%';

-- Mengubah / Menambahkan Password
SET PASSWORD FOR 'aris'@'localhost' = 'rahasia';
SET PASSWORD FOR 'afriyan'@'%' = 'afriyan';






## HAK AKSES

-- Menambah Hak Akses
GRANT SELECT ON learn_mysql.* TO 'aris'@'localhost';	-- .* artinya di DB itu semua table
GRANT SELECT, INSERT, UPDATE, DELETE ON learn_mysql.* TO 'afriyan'@'%';
GRANT ALTER ON learn_mysql.* TO 'afriyan'@'%';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON learn_mysql.products.categories TO 'afriyan'@'%';


-- Melihat Hak Akses User
SHOW GRANTS FOR 'aris'@'localhost';
SHOW GRANTS FOR 'afriyan'@'%';


-- Menghapus Hak Akses User
REVOKE SELECT ON learn_mysql.* FROM 'aris'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON learn_mysql.* FROM 'afriyan'@'%';




















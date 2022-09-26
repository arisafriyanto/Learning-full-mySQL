show engines;

-- best practice nama db lowecase
create database learn_mysql;
drop database learn_mysql;


show databases;
use learn_mysql;
show tables;


-- Tipe Data int

-- Kesalahpahaman yang sangat umum tentang apa arti int(11) di MySQL adalah bahwa kolom dapat menyimpan 
-- nilai integer maksimum dengan panjang 11 digit. Namun, ini tidak benar. int(11) tidak menentukan nilai 
-- maksimum yang dapat disimpan kolom di dalamnya. 11 adalah lebar tampilan kolom integer, tidak seperti kolom 
-- karakter dimana angka berarti jumlah karakter yang dapat disimpan.
-- Angka dalam kurung tidak menentukan nilai maks dan min yang dapat disimpan dalam bidang bilangan bulat. 
-- Nilai maks dan min yang dapat disimpan selalu tetap. 
-- Di satu sisi, angka dalam tanda kurung int() tidak berguna kecuali Anda menggunakan atribut ZEROFILL.

-- Kolom dengan INT(5) atau INT(11) dapat menyimpan nilai maksimum yang sama. Juga, jika Anda memiliki 
-- kolom INT(20) itu tidak berarti bahwa Anda akan dapat menyimpan nilai 20 digit (nilai BIGINT). 
-- Kolom masih akan menyimpan hanya sampai nilai maksimal INT


create table tbl_zerofill
(
	id int(11) not null auto_increment,
	i1 int(10) not null,
	i2 int(3) not null,
	zerofill1 int(10) zerofill not null,
	zerofill2 int(3) zerofill not null,
	primary key (id)
)engine=innodb;


insert into `tbl_zerofill` (`i1`, `i2`, `zerofill1`, `zerofill2`) 
values 
(10000, 10000, 10000, 10000), 
(100, 100, 100, 100);

select * from tbl_zerofill;




-- create table barang
create table barang
(
	id		int,
    nama	varchar(100),
    harga	int,
    jumlah	int
)engine = innodb;

show tables;
describe barang;
desc barang;
show create table barang;



-- Mengubah Table
alter table barang
add column deskripsi text after nama;

alter table barang
add column salah text;

alter table barang
drop column salah;


-- Untuk modify tipe data wajib di sebutkan
alter table barang
modify nama varchar(200) after deskripsi;

alter table barang
modify nama varchar(200) first;

alter table barang
modify nama varchar(100) after id;


-- set not null value
alter table barang
modify id int not null,
modify nama varchar(100) not null;


-- set default value 
alter table barang
modify harga 	int not null default 0,
modify jumlah 	int not null default 0;

alter table barang
add column created_at timestamp not null default current_timestamp;


desc barang;
show create table barang;


insert into barang (id, nama) values (1, 'Asus Vivobook i3');
select * from barang;

-- hapus semua data di table dan table dibuat ulang
truncate barang;

-- hapus table
drop table barang;



-- Create table products
create table products
(
	id 			varchar(11)  not null,
    name 		varchar(100) not null,
    description text,
    price		int	unsigned not null,
    quantity 	int unsigned not null default 0,
    created_at 	timestamp    not null default current_timestamp
)engine=innodb;


show tables;
desc products;




-- Insert data ke table products
insert into products (id, name, price, quantity)
values ('P0001', 'Mie Ayam Original', 15000, 100);

insert into products (id, name, description, price, quantity)
values ('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original + Bakso Tahu', 20000, 50);

insert into products (id, name, price, quantity)
values  ('P0003', 'Mie Ayam Ceker', 20000, 110),
		('P0004', 'Mie Ayam Spesial', 25000, 80),
		('P0005', 'Mie Ayam Hot', 15000, 100);



-- select data
select * from products;
select id, name, price, quantity from products;


-- Add primary key ke table products
alter table products
add primary key (id);


-- error data duplicate
insert into products (id, name, price, quantity)
values ('P0001', 'Mie Ayam Original', 15000, 100);





-- WHERE CLAUSE
select * from products where quantity = 100;
select * from products where price = 20000;
select * from products where price > 20000;
select * from products where quantity >= 100;
select * from products where quantity < 100;
select * from products where id = 'P0002';
select * from products where name = 'mie ayam original';



-- add column category
alter table products
add column category enum ('Makanan', 'Minuman', 'Cemilan')
after name;



desc products;
show create table products;





-- Update Data
-- update satu kolom -- jika update semua kolom tanpa where
update products set category = 'Makanan' where id = 'P0001';

update products set category = 'Makanan', description = 'Mie Ayam + Bakso Tahu'
where id = 'P0002';

update products set category = 'Makanan', description = 'Mie Ayam + Ceker'
where id = 'P0003';

update products set price = price + 5000 where id = 'P0005';





-- Delete Data
insert into products (id, name, price, quantity)
values ('P0009', 'Mie Ayam Original', 15000, 100);

delete from products where id = 'P0009';




-- Alias untuk kolom
select id		as	Kode,
	   name		as	Nama,
       category as Kategori,
       price	as Harga,
       quantity	as Stok
from products;



-- Alias untuk table
select p.id		as	'Kode Produk',
	   p.name		as	Nama,
       p.category	as	Kategori,
       p.price	as 	Harga,
       p.quantity	as	Stok
from products as p;


insert into products (id, name, category, price, quantity)
values ('P0006', 'Bakso Rusuk', 'Makanan', 23000, 120),
	   ('P0007', 'Es Jeruk', 'Minuman', 13000, 10),
       ('P0008', 'Es Kelapa', 'Minuman', 15000, 60),
       ('P0009', 'Es Campur', 'Minuman', 10000, 200),
       ('P0010', 'Keripik Singkong', 'Cemilan', 18000, 300),
       ('P0011', 'Kerupuk Udang', 'Cemilan', 26000, 130),
       ('P0012', 'Tahu Bulat', 'Cemilan', 18000, 140),
       ('P0013', 'Es Teh Manis', 'Minuman', 10000, 250),
       ('P0014', 'Kerupuk Jengkol', 'Cemilan', 15000, 300),
       ('P0015', 'Es Boba', 'Minuman', 14000, 270);



-- Where Operator
select id, name, price, quantity from products where price > 20000;
select id, name, price, quantity from products where price >= 20000;
select id, name, price, quantity from products where price < 20000;
select id, name, price, quantity from products where price <= 20000;
select id, name, price, quantity from products where price != 20000;
select id, name, price, quantity from products where quantity <> 100;






-- AND dan OR Operator
select id, name, price, quantity from products where quantity <= 100 and price <= 20000;
select id, name, price, quantity from products where quantity = 100 and price = 20000;
select id, name, price, quantity from products where price > 15000 and quantity > 100;


select id, name, category, price, quantity from products where price > 15000 or quantity > 100;



-- And dan Or prioritas utama adalah And jika kita ingin prioritaskan or caranya dgn tanda kurung ()

select id, name, category, price, quantity 
from products
where (category = 'Makanan' or quantity > 100) and price > 20000;

select id, name, category, price, quantity 
from products
where category = 'Makanan' or (quantity > 100 and price > 20000);





-- LIKE Operator
-- LIKE operator adalah operator yang bisa kita gunakan untuk mencari sebagian data dalam String
-- Ini cocok sekali ketika kita hanya ingin mencari sebagian kata dalam String
-- Namun perlu diingat, operasi LIKE itu sangat lambat, oleh karena itu, tidak disarankan jika datanya
-- sudah terlalu besar di tabel

select * from products where name like 'mie%';
select * from products where name like 'es%';
select * from products where name like '%uk';
select * from products where name like '%k%';
select * from products where name not like '%mie%';





-- NULL Operator
select * from products where description is null;
select * from products where description is not null;





-- BETWEEN Operator
select * from products where price between 15000 and 25000;
select * from products where quantity between 80 and 200;

-- Not Between
select * from products where price not between 15000 and 25000;
select * from products where quantity not between 80 and 200;

-- manual
select * from products where price >= 15000 and price <= 25000;
select * from products where quantity >= 80 and quantity <= 200;





-- IN Operator
-- Operator IN adalah operator untuk melakukan pencarian sebuah kolom dengan beberapa nilai.
-- Misal kita ingin mencari products dengan category Makanan atau Minuman, maka kita bisa
-- menggunakan operator IN

select * from products where category in ('Makanan', 'Cemilan');
select * from products where price in (15000, 20000);

-- manual
select * from products where category = 'Makanan' or category = 'Cemilan';
select * from products where price = 15000 or price = 20000;





-- Order By Clause
-- Untuk mengurutkan data ketika kita menggunakan perintah SQL SELECT, kita bisa menambahkan ORDER BY clause
-- ORDER BY clause digunakan untuk mengurutkan data berdasarkan kolom yang dipilih, dan jenis
-- urutan (ASC atau DESC)
-- Kita juga bisa mengurutkan tidak hanya terhadap satu kolom, tapi beberapa kolom

select id, name, category from products order by category;		-- default asc
select id, name, category from products order by id asc;
select id, name, category from products order by id desc;
select id, name, category, price from products order by category, price desc;
select id, name, category, quantity from products order by category asc, quantity desc;





-- Limit Clause
-- Mengambil seluruh data di tabel bukanlah pilihan bijak, apalagi jika datanya sudah banyak sekali
-- Kita bisa membatasi jumlah data yang diambil dalam SQL SELECT dengan LIMIT clause
-- Selain membatasi jumlah data, kita juga bisa meng-skip sejumlah data yang tidak ingin kita lihat
-- LIMIT biasanya digunakan saat melakukan paging di aplikasi kita

select * from products limit 5;		-- yang terjadi limit 0, 5
select * from products limit 5, 3;	-- skip data sampe 5 dan tampilkan 3
select * from products limit 10, 5;	-- skip data sampe 10 dan tampilkan 5 sisanya

select * from products where quantity > 100 order by price limit 5;
select * from products where price > 0 order by price limit 5, 5;






-- Select Distinct Data
-- Jika kita ingin menghilangkan data-data duplikat tersebut , kita bisa menggunakan SELECT dengan
-- tambahan DISTINCT sebelum nama kolom nya

select distinct category from products;

-- pastikan kolom yang di distinct harus kolom yang ada data duplikat
select distinct category, id from products;	



-- Numeric Function
-- MySQL memiliki banyak sekali ﬁtur untuk manipulasi data angka
-- Hal ini memudahkan kita untuk memanipulasi data angka
-- Secara garis besar, ﬁtur ini dibagi menjadi dua, Arithmetic Operator dan Mathematical Function



-- Arithmetic Operato
select 10 + 10 hasil;
select 100 - 10 hasil;
select 10 % 3 hasil;
select -5 + 10 hasil;
select 6 * 3 hasil;
select 10 / 3 hasil;	-- jadi floating point
select 100 div 5 hasil;	-- dibulatkan ke int

select id, price, price div 1000 as 'price In K' from products;

select id, name, price
from products
where price div 1000 > 15;	-- where



-- Mathematical Function
select pi();
select power(10, 2);	-- pangkat

select cos(10);
select sin(10);
select tan(10);

select id, quantity, cos(quantity), sin(quantity), tan(quantity) from products;






-- Auto Increment
-- MySQL memiliki ﬁtur yang bernama auto increment, ﬁtur ini bisa kita gunakan untuk menandai
-- bahwa suatu primary key datanya diisi secara otomatis dari angka terakhir + 1
-- Dengan menggunakan auto increment, kita tidak perlu lalu memasukkan data primary key, ini akan
-- otomatis dibuat oleh MySQL

-- reset auto increment
alter table admin auto_increment = 1;

create table admin
(
	id			int 		 not null auto_increment,
    first_name	varchar(100) not null,
    last_name	varchar(100) not null,
    primary key (id)
) engine=innodb;

desc admin;



-- Insert data tanpa id
insert into admin (first_name, last_name) 
values ('mayang', 'mila');

select * from admin order by id;
select last_insert_id();




-- String Function
select '  hai  i' as hasil;
select trim('  hai  i') as hasil;
select id, lower(first_name) as Nama from admin;
select id, upper(first_name) as Nama from admin;
select id, length(first_name) as 'Karakter' from admin;


SELECT 
    id, LOWER(name) as 'Name Lower', uPPER(name) as 'Name Upper', lENGTh(name) as 'Name Length'
frOM
    products;






-- Date dan Time Function
select id, created_at,
		extract(year from created_at) as Tahun,
        extract(month from created_at) as Bulan
from products;

select id, created_at, year(created_at) as Tahun, month(created_at) as Bulan, day(created_at) as Hari
from products;

select id, date(created_at) from products;
select now() as 'Time Sekarang';





-- Flow Control Function
-- MySQL memiliki ﬁtur ﬂow control function
-- Ini mirip IF ELSE di bahasa pemrograman
-- Tapi ingat, ﬁtur ini tidak se kompleks yang dimiliki bahasa pemrograman

select case 12 when 1 then 'one' when 2 then 'two' else 'more' end as number;

-- case kaya switch case
select id, name, category,
	   case category
			when 'Makanan' then 'Enak'
            when 'Minuman' then 'Seger'
            else
            'Nyam-nyam'
            end as Kategori
from products;

-- if
select id, price,
	   if(price <= 15000, 'Murah', 'Mahal')
       as 'Harga Murah'
from products;

select id, price,
	   if(price <= 15000, 'Murah', 
			if(price <= 20000, 'Mahal', 'Mahal Bingitzz')
		) as 'Harga'
from products;


-- ifnull
select id, name,
	   ifnull(description, 'Kosong')
from products;






-- Aggregate Function
-- MySQL mendukung function-function untuk melakukan aggregate
-- Misal, kita ingin melihat harga paling mahal di tabel product, atau harga termurah, atau rata-rata
-- harga produk, atau total jumlah data di tabel, dan lain-lain

select avg(price) as 'Rata - rata' from products;
select count(id) as 'Total Produk' from products;						-- bebas kolom mana pun
select count(distinct category) as Result from products;		-- berdasarkan category
select max(price) as 'Harga Tertinggi' from products;
select min(price) as 'Harga Terendah' from products;
select sum(price) as 'Total Harga' from products;
select sum(quantity) as 'Total Stok' from products;

-- aggregate hasilnya cma 1 data, hati - hati gunakan kolom untuk agregate 
-- dia tidak bisa digabung dengan kolom biasa kecuali dgn group by
select count(id), name from products;	-- error




-- GROUP BY
-- Kadang saat melakukan aggregate, kita ingin datanya di grouping berdasarkan kriteria tertentu
-- Misal kita ingin melihat rata-rata harga product, tapi ingin per category
-- Atau kita ingin melihat total semua product, tapi per category
-- Hal ini bisa dilakukan di MySQL dengan menggunakan GROUP BY clause
-- GROUP BY clause ini hanya bisa digunakan jika kita menggunakan aggregate function

select category, avg(price) as 'Rata - Rata Harga' from products group by category;
select category, sum(quantity) as 'Total Stok' from products group by category;
select category, count(id) as 'Total Produk' from products group by category;
select category, max(price) as 'Harga Termahal' from products group by category;
select category, min(price) as 'Harga Termurah' from products group by category;







-- Having Clause pengganti where
select category, avg(price) as Harga from products group by category having Harga >= 10000;
select category, count(id) as Total from products group by category having Total > 4;
select * from products;

select category, count(id) as Total from products group by category where Total > 4; -- error






-- Constraint = menjaga data ditable supaya baik

-- Unique Constraint
-- tidak boleh ada data yang sama di kolom unique
create table customers
(
	id			int 		 not null auto_increment,
    email		varchar(100) not null,
    first_name	varchar(100) not null,
    last_name	varchar(100),
    no_hp		varchar(15) not null,
    primary key (id),
    unique key  email_unique (email),
    unique key  no_hp_unique (no_hp)
)engine=InnoDB;


-- Add Or Drop Constraint
alter table customers
drop constraint no_hp_unique;

ALTER TABLE customers
ADD CONSTRAINT no_hp_unique UNIQUE (no_hp);


-- INSERT DATA
INSERT INTO customers (email, first_name, last_name, no_hp)
			values
            ('afriyan@gmail.com', 'Aris', 'Afriyanto', '0895360759393');

-- ERROR DUPLICATE EMAIL_UNIQUE
INSERT INTO customers (email, first_name, last_name, no_hp)
			values
            ('afriyan@gmail.com', 'Aris', 'Afriyanto', '0895360759393');

-- ERROR DUPLICATE NO_HP_UNIQUE
INSERT INTO customers (email, first_name, last_name, no_hp)
			values
            ('aris@gmail.com', 'Aris', 'Afriyanto', '0895360759393');
            
            
            
INSERT INTO customers (email, first_name, last_name, no_hp)
			values
            ('aris@gmail.com', 'Alif', 'Munandar', '0895748574635'),
            ('mike@gmail.com', 'Mike', 'Muslih', '08746574637'),
            ('annis@gmail.com', 'Annis', 'Khoirunnisa', '086564736473'),
            ('siti@gmail.com', 'Siti', 'Kholifah', '087465735263');




-- ADD CHECK CONSTRAINT
ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000);


-- INSERT DATA PRODUCTS PRICE < 1000 DAN DITOLAK
INSERT INTO products (id, name, category, price, quantity)
			values
            ('P0016', 'Es Gosrok', 'Minuman', 500, 100);


-- INSERT DATA PRODUCTS PRICE > 1000 DAN SUCCESS
INSERT INTO products (id, name, category, price, quantity)
			values
            ('P0016', 'Es Gosrok', 'Minuman', 5000, 100);
            
-- UPDATE HARGA JADI DIBAWAH 1000 DITOLAK
UPDATE products SET price = 500 WHERE id = 'P0016';

show create table products;






-- INDEX	
-- Mempercepat query data dan pencarian
-- Memperlambat manipulasi data (CRUD)
-- primary key dan unique otomatis index, index bisa berapapun di table


create table sellers
(	
	id		int				not null auto_increment,
    name	varchar(100),
    name2	varchar(100),
    name3	varchar(100),
    email	varchar(100)	not null,
    primary key (id),
    unique key 	email_unique 	(email),
	index name_index (name),
	index name2_index (name2),
	index name3_index (name3),
    
    index name_name2_name3 (name, name2, name3)
)engine=InnoDB;

drop table sellers;
desc sellers;
show create table sellers;

-- jika 1 index dan kita where 2 kondisi ngga akan cepet, 
-- jika 2 atau lebih index kita where kondisi yang ada indexnya 1 where / 2 / 3 maka akan cepet

-- INI AKAN CEPET KARENA KITA BUAT 3 INDEX
select * from sellers where name = 'X';
select * from sellers where name = 'X' and name2 = 'Z';
select * from sellers where name = 'X' and name2 = 'Z' and name3 = 'A';
select * from sellers where name2 = 'Z';

-- NGGA CEPET KARENA KOLOM 1 TIDAK IKUT, INI NGGA AKAN KENA INDEX
select * from sellers where name2 = 'Z' and name3 = 'A';


-- ADD OR DROP INDEX AFTER TABLE CREATED
alter table sellers
add index name_index (name);

alter table sellers
drop index name_index;

-- ATI ATI TAMBAH INDEX PAS APLIKASI SUDAH MEMILIKI DATA, HARUS STOP APP DLU






-- Masalah dengan LIKE operator
/*
	Operasi yang dilakukan LIKE operator adalah dengan cara mencari seluruh data di tabel dari baris
	pertama sampai terakhir, hal ini membuat operasi LIKE sangat lambat
	Menambah index di tabel juga tidak akan membantu, karen LIKE operator tidak menggunakan index
*/


-- Full-Text Search 
/*
	SOLUSI tetapi tidak se canggih DB search engine
	Full-Text Search memungkinkan kita bisa mencari sebagian kata di kolom dengan tipe data String
Ini sangat cocok ketika pada kasus kita memang membutuhkan pencarian yang tidak hanya
sekedar operasi = (equals, sama dengan)
Dia Buat INDEX khusus
*/


-- ADD OR DROP INDEX FULL-TEXT-SEARCH
alter table products
add fulltext product_search (name, description);

alter table products
drop index product_search;

show create table products;



-- Mode Full-Text Search
-- Manual dgn like
select * from products where name like '%ayam%' or description like '%ayam%';

-- Natural Language, yaitu mencari seperti bahasa natural (per kata)
-- Diurutkan berdasarkan name dan description yang ada kata ayam ada skornya
SELECT * FROM products WHERE
					   MATCH	(name, description)
                       AGAINST 	('ayam' IN NATURAL LANGUAGE MODE);
                        
	
-- Boolean, yaitu mencari dengan kemampuan mengandung kata (+) atau tidak mengandung kata (-)
-- dan lain-lain
SELECT * FROM products WHERE
					   MATCH 	(name, description)
                       AGAINST 	('+mie -bakso' IN BOOLEAN MODE);


/*
	Query Expansion, yaitu mencari seperti natural language, namun melakukan dua kali pencarian,
pencarian pertama menggunakan natural language, pencarian kedua melakukan pencarian dari
kedekatan hasil pertama, misal kita mencari kata “bakso”, lalu ternyata di dalam “bakso” ada kata
“mie”, maka kemungkinan query kedua akan mencari kata “mie” juga
*/
SELECT * FROM products WHERE
					   MATCH 	(name, description)
                       AGAINST 	('mie' WITH QUERY EXPANSION);





-- TABLE RELATIONSHIP
/*
	Dalam Relational DBMS, salah satu ﬁtur andalan nya adalah table relationship. Yaitu relasi antar
tabel
Kita bisa melakukan relasi dari satu tabel ke tabel lain.
Dalam kehidupan nyata pun pasti kita akan sering membuat relasi antar tabel
Misal, saat kita membuat aplikasi penjualan, di laporan penjualan pasti ada data barang. Jika di
tabel artinya tabel penjualan akan berelasi dengan tabel barang
Misal dalam aplikasi kampus, tabel mahasiswa akan berelasi dengan tabel mata kuliah, dan tabel
dosen
*/

-- FOREIGN KEY
/*
	Saat membuat relasi tabel, biasanya kita akan membuat sebuah kolom sebagai referensi ke tabel
lainnya
Misal saat kita membuat tabel penjualan, di dalam tabel penjualan, kita akan menambahkan kolom
id_produk sebagai referensi ke tabel produk, yang berisi primary key di tabel produk
Kolom referensi ini di MySQL dinamakan Foreign Key
Kita bisa menambah satu satu lebih foreign key ke dalam sebuah tabel
Membuat foreign key sama seperti membuat kolom biasanya, hanya saja kita perlu memberi tahu
MySQL bahwa itu adalah foreign key ke tabel lain
*/

create table wishlist
(
	id			int 	not null auto_increment,
    product_id	varchar(11) not null,				-- harus not null karena kunci tamu dan type harus sama
    description	text,
    primary key (id),
    constraint  fk_wishlist_product					-- biasanya fk diikuti nama tabel ini dan referensinya
				foreign key (product_id) references products(id)
)engine=InnoDB;

desc wishlist;
show create table wishlist;


-- ADD OR DROP FOREIGN KEY
alter table wishlist
drop constraint fk_wishlist_product,
drop key fk_wishlist_product;

alter table wishlist
add constraint fk_wishlist_product foreign key (product_id) references products(id);


/*
	Keuntungan Menggunakan Foreign Key
Foreign key memastikan bahwa data yang kita masukkan ke kolom tersebut harus tersedia di tabel
references nya
Selain itu saat kita menghapus data di tabel reference, MySQL akan mengecek apakah id nya
digunakan di foreign key di tabel lain, jika digunakan, maka secara otomatis MySQL akan menolak
proses delete data di tabel reference tersebut
*/
alter table wishlist auto_increment = 1;

insert into wishlist (product_id, description) values ('P0001', 'Makanan Nich'); -- success
insert into wishlist (product_id, description) values ('P0110', 'Makanan Nich'); -- gagal


/*
	Ketika Menghapus Data Berelasi
Seperti yang sebelumnya dibahas, ketika kita menghapus data yang berelasi, maka secara otomatis
MySQL akan menolak operasi delete tersebut
Kita bisa mengubah ﬁtur ini jika kita mau, ada banyak hal yang bisa dilakukan ketika data berelasi
dihapus, defaultnya memang akan ditolak (RESTRICT)
*/

delete from products where id = 'P0001';	-- gagal karena id ini digunakan di table wishlist


/*
	Behavior Foreign Key	ON DELETE		ON UPDATE
    RESTRICT				TOLAK			TOLAK
    CASCADE					DIHAPUS			DIUPDATE			
    NO ACTION				DIBIARKAN		DIBIARKAN
    SET NULL				SET NULL		SET NULL
*/


-- Mengubah Behavior Menghapus Relasi
ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product,
DROP KEY 		fk_wishlist_product;

show create table wishlist;

ALTER TABLE wishlist
	ADD CONSTRAINT fk_wishlist_product
		FOREIGN KEY wishlist (product_id) REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE;

update products set id = 'P0023' where id = 'P0001';
update products set id = 'P0001' where id = 'P0023';

select * from wishlist;









-- Join
select * from wishlist;

select * 
from wishlist 
join products on (wishlist.product_id = products.id);


select  p.id 			as id_wishlist, 
		w.id			as id_product, 
        w.product_id, 
        w.description, 
        p.name, 
        p.price
from wishlist as w 
join products as p on (w.product_id = p.id);


desc customers;
desc products;
desc wishlist;

alter table wishlist
add column customer_id int not null after product_id;

select * from wishlist;
select * from customers;

update wishlist set customer_id = 1 where id = 1;


-- JOIN MULTIPLE TABLE
select p.id, p.name, w.description, c.email
from wishlist as w
join products as p on (w.product_id = p.id)
join customers as c on (w.customer_id = c.id);


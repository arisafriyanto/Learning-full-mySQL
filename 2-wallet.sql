
-- One to One Relationship
/*
	One to One relationship adalah relasi antar tabel yang paling sederhana
Artinya tiap data di sebuah tabel hanya boleh berelasi ke maksimal 1 data di tabel lainnya
Tidak boleh ada relasi lebih dari 1 data
Contoh misal, kita membuat aplikasi toko online yang terdapat ﬁtur wallet, dan 1 customer, cuma
boleh punya 1 wallet

Cara membuat One to One relationship cukup mudah
Kita bisa membuat kolom foreign key, lalu set kolom tersebut menggunakan UNIQUE KEY ini disarankan, hal ini
dapat mencegah terjadi data di kolom tersebut agar tidak duplikat
Atau cara lainnya, kita bisa membuat tabel dengan primary key yang sama, sehingga tidak butuh
lagi kolom untuk FOREIGN KEY
*/

desc customers;

create table wallet
(
	id			int		not null auto_increment,
    customer_id	int 	not null,
    balance		int		not null default 0,
    primary key (id),
    unique key	customer_id_unique	(customer_id),
    constraint 	fk_wallet_customer
				foreign key (customer_id) references customers (id)
)engine=InnoDB;

-- CARA DROP UNIQUE KEY HARUS DROP CONSTRAINT DULU
alter table wallet
drop constraint fk_wallet_customer;

alter table wallet
drop index fk_customer_id_unique;

desc wallet;
show index from wallet;
show create table wallet;

insert into wallet (customer_id) values (1), (4);
insert into wallet (customer_id) values (1);		-- gagal karena unique, tdk boleh duplikat

select * from customers;
select * from wallet;


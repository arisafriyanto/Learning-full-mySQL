
-- One to Many Relationship
/*
One to many relationship adalah relasi antar tabel dimana satu data bisa digunakan lebih dari satu
kali di tabel relasinya
Berbeda dengan one to one yang cuma bisa digunakan maksimal 1 kali di tabel relasinya, one to
many tidak ada batasan berapa banyak data digunakan
Contoh relasi antar tabel categories dan products, dimana satu category bisa digunakan oleh lebih
dari satu product, yang artinya relasinya nya one category to many products
Pembuatan relasi one to many sebenarnya sama dengan one to one, yang membedakan adalah, kita
tidak perlu menggunakan UNIQUE KEY, karena datanya memang bisa berkali-kali ditambahkan di
tabel relasi nya
*/


create table categories
(
	id		varchar(11)		not null,
    name	varchar(100)	not null,
    primary key (id)
)engine=InnoDB;


desc categories;
desc products;
select * from products;
show create table products;

alter table products
drop column category;

alter table products
add column category_id varchar(11) after id;

alter table products
add constraint fk_product_category
	foreign key (category_id) references categories (id);




insert into categories (id, name) values 
('C0001', 'Makanan'), ('C0002', 'Minuman'), ('C0003', 'Cemilan');


select * from categories;
select * from products;

update products set category_id = 'C0001' where id in ('P0001', 'P0002', 'P0003', 'P0004', 'P0005', 'P0006');

update products set category_id = 'C0002' where id in ('P0007', 'P0008', 'P0009', 'P0013', 'P0015', 'P0016');

update products set category_id = 'C0003' where id in ('P0010', 'P0011', 'P0012', 'P0014');


select products.id, products.name, categories.name
from products join categories on (products.category_id = categories.id);




















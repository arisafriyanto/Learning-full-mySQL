/*
	Jenis-Jenis Join
Sebelumnya kita sudah bahas tentang JOIN table, tapi sebenarnya ada banyak sekali jenis-jenis JOIN
table di MySQL, diantaranya :

INNER JOIN
LEFT JOIN
RIGHT JOIN
CROSS JOIN
*/


-- Inner Join
-- Jika kita menggunakan JOIN seperti yang sudah kita praktekan sebelumnya, sebenarnya itu akan
-- melakukan INNER JOIN

select products.id, products.name, categories.name as Category from products
inner join categories on (categories.id = products.category_id);

insert into categories (id, name)
values	('C0004', 'Oleh-Oleh'),
		('C0005', 'Laptop');
       
-- Data tidak akan tampil di inner join karena tidak punya relasi ke table categories
insert into products (id, name, price, quantity)
values	('X0001', 'Mobil Tamiya', 15000, 12),
		('X0002', 'Ps 2', 1000000, 50),
		('X0003', 'Ikan Cupang', 3000, 76);
        

select products.id, products.name, categories.id, categories.name as Category from categories
inner join products on (categories.id = products.category_id);






-- Left Join
-- LEFT JOIN adalah mekanisme JOIN seperti INNER JOIN, namun semua data di table pertama akan
-- diambil juga
-- Jika ada yang tidak memiliki relasi di table kedua, maka hasilnya akan NULL

select products.id, products.name, categories.id, categories.name as Category from categories
left join products on (categories.id = products.category_id);




-- Right Join
-- RIGHT JOIN adalah mekanisme JOIN seperti INNER JOIN, namun semua data di table kedua akan
-- diambil juga
-- Jika ada yang tidak memiliki relasi di table pertama, maka hasilnya akan NULL

select products.id, products.name, categories.id, categories.name as Category from categories
right join products on (categories.id = products.category_id);



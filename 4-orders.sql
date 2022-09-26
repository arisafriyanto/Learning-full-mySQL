
-- Many to Many Relationship
/*
	Solusi yang biasa dilakukan jika terjadi relasi many to many adalah, biasanya kita akan menambah 1
tabel ditengahnya
Tabel ini bertugas sebagai jembatan untuk menggabungkan relasi many to many
Isi table ini akan ada id dari table pertama dan table kedua, dalam kasus ini adalah id_product dan
id_order
Dengan demikian, kita bisa menambahkan beberapa data ke dalam tabel relasi ini, sehingga berarti
satu product bisa dijual beberapa kali di dalam table order, dan satu order bisa membeli lebih dari
satu product
*/

create table orders
(
	id			int			not null auto_increment,
    total		int			not null,
    order_date	datetime	not null default current_timestamp,
    primary key (id)
)engine=innodb;

desc products;
desc orders;
desc order_details;

create table order_details
(
	product_id	varchar(11) not null,
    order_id	int			not null,
    price		int 		not null,
    quantity	int			not null,
    primary key (product_id, order_id)
)engine=innodb;


alter table order_details
add constraint fk_order_details_product
	foreign key (product_id) references products (id);
    
alter table order_details
add constraint fk_order_details_order
	foreign key (order_id) references orders (id);

show create table order_details;


insert into orders (total) values (35000);
insert into orders (total) values (40000);

select * from orders;

insert into order_details (product_id, order_id, price, quantity) 
values ('P0001', 1, 15000, 1),
	   ('P0002', 1, 20000, 1);
       
insert into order_details (product_id, order_id, price, quantity) 
values ('P0001', 2, 15000, 1),
	   ('P0002', 2, 20000, 1);
       
insert into order_details (product_id, order_id, price, quantity) 
values ('P0003', 3, 20000, 1),
	   ('P0002', 3, 20000, 1);

select * from order_details;

select * from orders;

select * from orders
join order_details	on(order_details.order_id = orders.id)
join products		on(products.id = order_details.product_id);


select p.id, p.name, p.price, od.quantity, od.order_id, o.total from orders as o
join order_details 	as od	on (od.order_id = o.id)
join products		as p	on (p.id = od.product_id);



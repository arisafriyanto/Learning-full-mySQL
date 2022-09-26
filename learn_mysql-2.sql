-- Subquery di WHERE
select * from products
where price > (select avg(price) from products);

select * from products
where quantity > (select avg(quantity) from products);

-- manual
select * from products;
select avg(price) from products;
select * from products where price > 16578;





-- Subquery di From
select * from products;

update products set
price = 1000000
where id = 'X0002';

select max(price) from products;

-- Seleksi harga termahal di produk yang punya categori
select price from products
join categories	on (categories.id = products.category_id);

select 
    max(cp.price)
from
    (select 
        price
    from
        products
    join categories on (categories.id = products.category_id)) as cp;







-- Set Operator
/*
	MySQL mendukung operator Set, dimana ini adalah operasi antara hasil dari dua SELECT query. Ada
banyak jenis operator Set, yaitu :

UNION
UNION ALL
INTERSECT, dan
MINUS
*/

create table guestbooks
(
	id	int not null auto_increment,
    email	varchar(100) not null,
    title	varchar(100) not null,
    content	text not null,
    primary key (id)
)engine = innodb;

select * from customers;

insert into guestbooks (email, title, content)
values ('guest1@gmail.com', 'Hello Title', 'Hello Content'),
	   ('guest2@gmail.com', 'Hello Title', 'Hello Content'),
       ('guest3@gmail.com', 'Hello Title', 'Hello Content'),
       ('afriyan@gmail.com', 'Hello Title 1', 'Hello Content 1'),
       ('afriyan@gmail.com', 'Hello Title 2', 'Hello Content 2'),
       ('afriyan@gmail.com', 'Hello Title 3', 'Hello Content 3');
	
select * from guestbooks;


-- UNION
/*
UNION adalah operasi menggabungkan dua buah SELECT query, dimana jika terdapat data yang
duplikat, data duplikatnya akan dihapus dari hasil query
*/

select distinct email from customers;
select distinct email from guestbooks;

-- menggabung 2 query. data yang sama/duplikat akan digabung merge
select distinct email from customers
union	-- otomatis union nge distinct 
select distinct email from guestbooks;




-- UNION ALL
/*
UNION ALL adalah operasi yang sama dengan UNION, namun data duplikat tetap akan
ditampilkan di hasil query nya
*/

select distinct email from customers
union all
select distinct email from guestbooks;


select 
    emails.email, count(emails.email)
from
    (select email 
    from customers 
    union all 
    select email
    from guestbooks) as emails
group by emails.email;





-- INTERSECT
/*
	INTERSECT adalah operasi menggabungkan dua query, namun yang diambil hanya data yang
terdapat pada hasil query pertama dan query kedua
Data yang tidak ada di salah satu query, kan dihapus di hasil operasi INTERSECT
Data nya muncul tidak dalam keadaan duplikat
Sayangnya, MySQL tidak memiliki operator INTERSECT, dengan demikian untuk melakukan
operasi INTERSECT, kita harus lakukan secara manual menggunakan JOIN atau SUBQUERY
*/


select distinct email from customers;
select distinct email from guestbooks;

-- SUBQUERY di FROM
-- mencari email yang ada di guestbooks dan data tdk boleh duplikat
select distinct email from customers 
where email in (select distinct email from guestbooks);


-- JOIN
-- mencari email yang ada di guestbooks dan data tdk boleh duplikat
select distinct customers.email from customers
inner join guestbooks on (guestbooks.email = customers.email);








-- MINUS
/*
MINUS adalah operasi dimana query pertama akan dihilangkan oleh query kedua
Artinya jika ada data di query pertama yang sama dengan data yang ada di query kedua, maka data
tersebut akan dihapus dari hasil query MINUS
Sayang nya, di MySQL juga tidak ada operator MINUS, namun hal ini bisa kita lakukan
menggunakan JOIN
*/

select distinct email from customers;
select distinct email from guestbooks;

-- email yang sama dari table 1 dan tabel 2 akan dihilangkan
select distinct customers.email, guestbooks.email
from customers
left join guestbooks on (guestbooks.email = customers.email)
where guestbooks.email is null;





-- Backup Database
/*
	Saat membuat aplikasi menggunakan database, ada baiknya kita selalu melakukan backup data
	secara reguler
	Untungnya MySQL mendukung proses backup database
	Untuk melakukan backup database, kita tidak menggunakan perintah SQL, melainkan MySQL
	menyediakan sebuah aplikasi khusus untuk melakukan backup database, namanya adalah
	mysqldump
*/




-- Restore Database
/*
	Selain melakukan backup database, di MySQL juga kita bisa melakukan proses restore data dari ﬁle
	hasil backup
	Untuk melakukan restore database, kita bisa menggunakan aplikasi mysql client atau
	menggunakan perintah SOURCE di MySQL
*/



























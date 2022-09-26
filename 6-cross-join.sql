
-- Cross Join
/*
CROSS JOIN adalah salah satu JOIN yang sangat jangan sekali digunakan
CROSS JOIN adalah melakukan join dengan cara mengkalikan data di tabel pertama dengan dada
di table kedua
Artinya jika ada 5 data di tabel pertama, dan 5 data di tabel kedua, akan menghasilkan 25
kombinasi data (5 x 5)
Sekali lagi perlu diingat, ini adalah JOIN yang sangat jarang sekali digunakan

*/

-- total data products akan dikali 5 contoh 19 x 5 = 95
select * from categories
cross join products;



-- ISENG NICHHHH

create table numbers
(
	id 		int 	not null,
    primary key (id)
)engine=innodb;


insert into numbers (id) value (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

select number1.id, number2.id, (number1.id * number2.id) as Hasil from numbers as number1 
cross join numbers as number2 order by number1.id, number2.id;












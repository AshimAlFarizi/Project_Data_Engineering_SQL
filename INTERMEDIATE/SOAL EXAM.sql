create table tabel1 (
kode int,
deskripsi varchar(10),
jumlah int,
nilai int
)

insert into tabel1
values (1,'AA',10,1000)
insert into tabel1
values (2,'BB',10,2000)
insert into tabel1
values (3,'BB',10,3000)

select * from tabel1

Select deskripsi,max(nilai),min(nilai) 
from tabel1 
group by deskripsi 

Select deskripsi,sum(jumlah)/10,avg(nilai)/100 
from tabel1 
group by deskripsi

Select sum(jumlah),avg(nilai),deskripsi 
from tabel1 
group by deskripsi

create table tabel2 (
kode int,
nama varchar(10)
)

insert into tabel2
values (1,'x')
insert into tabel2
values (3,'y')
insert into tabel2
values (4,'z')

select * from tabel1
select * from tabel2

select a.*
from tabel1 a
where kode not in
(select kode from tabel2)

select a.kode, a.nama,
(select b.jumlah*b.nilai from tabel1 b where a.kode = b.kode)
from tabel2 a

create table tabel3 (
deskripsi varchar(10),
nama varchar(10)
)

insert into tabel3
values ('AA','x')
insert into tabel3
values ('BB','y')
insert into tabel3
values ('CC','z')

select * from tabel3

select a.*,b.nama from
(select deskripsi, sum(jumlah) as jumlah
from tabel1 group by deskripsi) a
join
(select * from tabel3) b on a.deskripsi = b.deskripsi

Select kode,sum(jumlah)*avg(nilai) 
from tabel1 
group by kode

Select a.kode,a.deskripsi,b.*
from tabel1 a
full outer join tabel2 b on a.kode = b.kode
where a.kode is null

Select deskripsi,sum(jumlah/10),avg(nilai/100) 
from tabel1 
group by deskripsi

select sum(nilai), deskripsi 
from tabel1 
group by deskripsi
union
select max(nilai), nama 
from tabel2 
group by nama

Select deskripsi,sum(jumlah),avg(nilai) 
from tabel1 
where nilai <> 2000 
group by deskripsi

select * from tabel1

select a.kode, a.deskripsi,
(select b.nama from tabel2 b where a.kode = b.kode)
from tabel1 a
where a.kode in (1, 3)

Select a.kode,a.deskripsi,b.*
from tabel1 a
full outer join tabel2 b on a.kode = b.kode

Select deskripsi,sum(jumlah)*avg(nilai) from tabel1 group by deskripsi

Select a.*,b.*
from tabel1 a
right outer join tabel2 b on a.kode = b.kode

select a.kode, a.nama,
(select b.nilai from tabel1 b on a.kode = b.kode)
from tabel2 a
where a.kode in (1, 3)

Select a.kode,b.*
from tabel1 a
left outer join tabel2 b on a.kode = b.kode

select a.*,b.nama from
(select deskripsi, sum(jumlah) as jumlah
from tabel1 group by deskripsi) a
join
(select * from tabel3 where deskripsi = 'AA') b
on a.deskripsi = b.deskripsi

Select deskripsi,max(nilai)-min(nilai) from tabel1 group by deskripsi

Select sum(jumlah) from tabel1

Select deskripsi,(max(nilai)-min(nilai))*sum(jumlah) 
from tabel1 
group by deskripsi

Select a.jumlah*b.kode,b.*
from tabel1 a
right outer join tabel2 b on a.kode = b.kode

Select b.*
from tabel1 a
join tabel2 b on a.kode = b.kode

select a.*
from tabel1 a
where kode not in
(select kode from tabel2) and a.deskripsi in ('AA')

Select a.kode, b.nama, sum(jumlah)
from tabel1 a
left outer join tabel2 b on a.kode = b.kode
where b.kode = 4
group by a.kode, b.nama

Select a.kode,a.deskripsi,b.*
from tabel1 a
full outer join tabel2 b on a.kode = b.kode

Select a.kode,a.deskripsi,b.*
from tabel1 a
full outer join tabel2 b on a.kode = b.kode
where a.kode is null and b.kode is null

Select a.kode,b.nama, sum(jumlah)
from tabel1 a
left outer join tabel2 b on a.kode = b.kode

select deskripsi from tabel1
union
select nama from tabel2

Select a.*,b.*
from tabel1 a
join tabel2 b on a.kode = b.nama

Select deskripsi,sum(jumlah),avg(nilai) 
from tabel1 where nilai > 2000 
group by deskripsi
having sum(jumlah) = 10

select sum(nilai), deskripsi from tabel1 group by deskripsi
union
select max(nilai), nama from tabel2 group by nama

Select deskripsi,sum(jumlah),avg(nilai) 
from tabel1 
where avg(nilai) > 2000 
group by deskripsi
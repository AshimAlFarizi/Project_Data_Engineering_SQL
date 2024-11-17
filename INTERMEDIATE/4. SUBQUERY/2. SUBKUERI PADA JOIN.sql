
select a.*,b.*
from pelanggan a
join
(select kode_pelanggan,
sum(total_barang) as total_barang,
sum(total_harga) as total_harga
from transaksi_header c
group by kode_pelanggan) b
on a.kode_pelanggan = b.kode_pelanggan


select a.*,b.*
from pelanggan a
join
(select kode_pelanggan
from transaksi_header c
group by kode_pelanggan) b
on a.kode_pelanggan = b.kode_pelanggan

select a.*,b.*
from pelanggan a
join
(select kode_pelanggan,
sum(total_barang) as total_barang,
sum(total_harga) as total_harga
from transaksi_header c
group by kode_pelanggan) b
on a.kode_pelanggan = b.kode_pelanggan
where b.total_harga > 1000000

--0000000001 limit belanja 500000
--0000000002 limit belanja 2000000
--0000000003 limit belanja 2500000

create table limit_transaksi
(
kode_pelanggan varchar(20),
limit int
)
insert into limit_transaksi
values ('0000000001',500000)
insert into limit_transaksi
values ('0000000002',2000000)
insert into limit_transaksi
values ('0000000003',2500000)

select * from limit_transaksi

select a.*,b.total_harga,d.limit
from pelanggan a
join
(select kode_pelanggan,
sum(total_barang) as total_barang,
sum(total_harga) as total_harga
from transaksi_header c
group by kode_pelanggan) b
on a.kode_pelanggan = b.kode_pelanggan
join limit_transaksi d
on a.Kode_Pelanggan = d.kode_pelanggan
where b.total_harga > d.limit 


select * 
from
(select a.*,b.total_harga,d.limit
from pelanggan a
join
(select kode_pelanggan,
sum(total_barang) as total_barang,
sum(total_harga) as total_harga
from transaksi_header c
group by kode_pelanggan) b
on a.kode_pelanggan = b.kode_pelanggan
join limit_transaksi d
on a.Kode_Pelanggan = d.kode_pelanggan)x
where total_harga > limit


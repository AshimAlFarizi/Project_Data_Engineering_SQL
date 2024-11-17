select a.*
from pelanggan a
join transaksi_header b
on a.Kode_Pelanggan = b.Kode_Pelanggan

select *
from transaksi_header

select *
from pelanggan


select a.*
from pelanggan a
left join transaksi_header b
on a.Kode_Pelanggan = b.Kode_Pelanggan
where b.Kode_Pelanggan is null



--soal latihan
select a.* 
from pelanggan a 
where Kode_Pelanggan 
in (select Kode_Pelanggan from transaksi_header)


select *
from pelanggan a
join transaksi_header b 
on a.Kode_Pelanggan = b.Kode_Pelanggan

select a.kode_pelanggan,nama_pelanggan,avg(total_harga) as avgth
from transaksi_header a
left join pelanggan	b
on a.Kode_Pelanggan = b.Kode_Pelanggan
where a.Total_Harga > 1000000
group by a.kode_pelanggan,nama_pelanggan

--sama

select a.kode_pelanggan,Nama_Pelanggan,avg(total_harga) as avg_total_harga
from pelanggan a
left join transaksi_header b
on a.Kode_Pelanggan = b.Kode_Pelanggan
group by a.kode_pelanggan,Nama_Pelanggan
having avg(total_harga) > 700000

select a.kode_pelanggan,Nama_Pelanggan,avg(total_harga) as avg_total_harga
from  transaksi_header a
left join pelanggan b
on a.Kode_Pelanggan = b.Kode_Pelanggan
group by a.kode_pelanggan,Nama_Pelanggan
having avg(total_harga) > 800000

--beda soal
select a.kode_pelanggan,Nama_Pelanggan,Total_Harga
from pelanggan a
left join transaksi_header b
on a.Kode_Pelanggan = b.Kode_Pelanggan
where b.Total_Harga >1000000


select a.kode_pelanggan,Nama_Pelanggan,avg(total_harga) as avg_total_harga
from pelanggan a
left join transaksi_header b
on a.Kode_Pelanggan = b.Kode_Pelanggan
where b.Total_Harga > 800000
group by a.kode_pelanggan,Nama_Pelanggan

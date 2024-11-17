select *
from pelanggan

select *
from transaksi_header

--1. tambahkan kolom nama pelanggan
--dari setiap data transaksi


select a.*,
(select nama_pelanggan 
from pelanggan b
where a.kode_pelanggan = b.kode_pelanggan)
as Nama_Pelanggan
from transaksi_header a

--2. Tambahkan kode transaksi untuk
-- setiap pelanggan
select a.*,
(select max(kode_transaksi)
from transaksi_header b
where a.Kode_Pelanggan = b.Kode_Pelanggan) 
as Kode_Transaksi
from pelanggan a






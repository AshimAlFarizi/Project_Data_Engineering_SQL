select *
from transaksi_header

select *
from pelanggan


select *
from transaksi_header a
join pelanggan b
on a.Kode_Pelanggan = b.Kode_Pelanggan

select a.*,
b.*
from transaksi_header a
join pelanggan b
on a.Kode_Pelanggan = b.Kode_Pelanggan

select a.*,
b.Nama_Pelanggan,Kota_pelanggan
from transaksi_header a
join pelanggan b
on a.Kode_Pelanggan = b.Kode_Pelanggan

select a.*,
b.Nama_Pelanggan,Kota_pelanggan
from transaksi_header a,
pelanggan b
WHERE a.Kode_Pelanggan = b.Kode_Pelanggan

select *
from pelanggan a
left join transaksi_header b
on a.Kode_Pelanggan = b.Kode_Pelanggan
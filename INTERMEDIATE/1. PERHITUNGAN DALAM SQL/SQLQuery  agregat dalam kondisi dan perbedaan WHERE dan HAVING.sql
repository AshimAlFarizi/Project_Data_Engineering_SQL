
select *
from transaksi_header
-- total harga per pelanggan
-- dimana tahun transaksi adalah 2021

select Kode_Pelanggan,
sum(total_harga) as total_harga
from transaksi_header
--where Tanggal_Transaksi > '2020-12-31'
where year(tanggal_transaksi) = 2021
group by Kode_Pelanggan

-- total harga per pelanggan
-- dimana tanggal transaksi 
-- setelah 31 Januari 2021

select Kode_Pelanggan,
sum(total_harga) as total_harga
from transaksi_header
where Tanggal_Transaksi > '2021-01-31'
group by Kode_Pelanggan

--total harga per tanggal
--dimana total harga diatas 500000

select Tanggal_Transaksi,
sum(total_harga) as total_harga
from transaksi_header
where Total_Harga > 500000
group by Tanggal_Transaksi

select Kode_Pelanggan,
sum(total_harga) as total_harga
from transaksi_header
--where Tanggal_Transaksi > '2020-12-31'
where year(tanggal_transaksi) = 2021
group by Kode_Pelanggan
having sum(total_harga) > 500000

--tampilkan merek barang selain jenis stilus
--yang total nilai barang (harga*stok)
--di bawah 5000000

select merk,
sum(Harga*Stok) as total_harga_barang
from barang
where Nama_Barang not like '%Stilus%'
group by merk
having sum(Harga*Stok) < 5000000

select * from barang

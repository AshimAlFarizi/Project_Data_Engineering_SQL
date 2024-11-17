--Tampilkan pelanggan yang melakukan
--pembelanjaan lebih dari
--2 barang dalam 1 bulan;
--Sertakan jumlah barang yang dibeli;
--Tampilkan juga pelanggan yang
--tidak pernah melakukan pembelian
--dalam 1 bulan tersebut!

select *
from transaksi_header

select X.*,isnull(total_barang,0) as total_barang
from pelanggan x
left join
(
select *
from
(select year(Tanggal_Transaksi) as Tahun,
MONTH (Tanggal_Transaksi) as Bulan,
Kode_Pelanggan, sum(total_barang) as total_barang
from transaksi_header x
group by year(Tanggal_Transaksi),
MONTH (Tanggal_Transaksi), 
Kode_Pelanggan) a
--where Tahun = 2021 and Bulan = 2
) y on x.Kode_Pelanggan = y.Kode_Pelanggan
where (total_barang > 2 or 
total_barang is null)
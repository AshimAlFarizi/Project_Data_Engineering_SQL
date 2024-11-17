
select *
from transaksi_header

select sum (total_harga) as total_harga
from transaksi_header

select kode_pelanggan,
sum(total_harga) as total_harga
from transaksi_header
group by kode_pelanggan

select Tanggal_Transaksi,
sum(total_harga) as total_harga
from transaksi_header
group by Tanggal_Transaksi

select Tanggal_Transaksi,
YEAR(Tanggal_Transaksi) as Tahun,
month(Tanggal_Transaksi) as Bulan
from transaksi_header

select YEAR(Tanggal_Transaksi) as Tahun,
month(Tanggal_Transaksi) as Bulan,
sum(total_harga) as total_harga
from transaksi_header
group by YEAR (Tanggal_Transaksi),
month (Tanggal_Transaksi)

select YEAR(Tanggal_Transaksi) as Tahun,
month(Tanggal_Transaksi) as Bulan,
sum(total_harga) as total_harga,
avg(total_harga) as avg_harga
from transaksi_header
group by YEAR (Tanggal_Transaksi),
month (Tanggal_Transaksi)

select kode_pelanggan,
avg(total_harga) as avg_harga,
sum(total_harga)/3 as avgFix_harga,
max(total_harga) as max_harga,
min(total_harga) as min_harga
from transaksi_header
group by kode_pelanggan


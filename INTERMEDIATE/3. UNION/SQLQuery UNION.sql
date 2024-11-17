
select cast(Tanggal_lahir as varchar)
from pelanggan
union all
select Merk
from barang

select kode_pelanggan, nama_pelanggan, Kota_pelanggan
from pelanggan
union all
select kode_barang, nama_barang, null
from barang

select *
from pelanggan
union
select *
from pelanggan
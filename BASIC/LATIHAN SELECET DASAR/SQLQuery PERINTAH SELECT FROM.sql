

select alamat,
charindex ('t',alamat) as charindext
from pelanggan



SELECT * from pelanggan

select nama_pelanggan,alamat,
concat (nama_pelanggan,' ',alamat) as concatNPA
from pelanggan


select nama_pelanggan,
left (nama_pelanggan,5) as kiri,
right (nama_pelanggan,5) as kanan,
substring (nama_pelanggan,2,3) as subs
from pelanggan


select nama_pelanggan,
len (nama_pelanggan)
from pelanggan


select alamat,
lower (alamat) as hurufkecil,
upper (alamat) as hurufbesar
from pelanggan

select * from pelanggan
insert into 
pelanggan (kode_pelanggan,nama_pelanggan)
values ('0000000006',' nama nama ')

select nama_pelanggan,
ltrim(nama_pelanggan) as spasikiri,
rtrim(nama_pelanggan) as spasikanan,
trim(nama_pelanggan) as spasikirikanan
from pelanggan

select top 3 kode_transaksi,tanggal_transaksi
from transaksi_header
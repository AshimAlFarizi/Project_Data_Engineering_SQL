drop table pelanggan
drop table barang
drop table transaksi_header
drop table transaksi_detail
drop table tespelanggan

create table pelanggan
(
Kode_Pelanggan varchar(10),
Nama_Pelanggan varchar(20),
Tanggal_lahir date,
Jenis_Kelamin varchar(1),
Alamat varchar(100),
Kota_pelanggan varchar(20)
)

insert into pelanggan values('0000000001','Anto Suherman','1985-04-15','L','Jl. Taman Cibodas 5 No 25, Tangerang','Tangerang')
insert into pelanggan values('0000000002','Edi Pohan','1984-03-12','P','Jl. Batu Ceper 3 No 1, Jakarta Pusat','Jakarta')
insert into pelanggan values('0000000003','Ningsih','1988-07-03','L','Jl. Mangga Besar 1 no 10, Jakpus','Jakarta')
insert into pelanggan values('0000000004','Bambang','1990-07-22','L','Jl. Pondok Indah V no 30, Jakarta Selatan','Jakarta')
insert into pelanggan values('0000000005','Echi','1980-01-30','P','Jl. Cilandak 10 No 4, Jakarta Selatan','Jakarta')

create table barang
(
Kode_Barang varchar(5),
Nama_Barang varchar(20),
Merk varchar(20),
Harga float,
Stok Int,
Harga_Perolehan float,
)

insert into barang values('00001','Casing Samsung','Samsung',300000,20,250000)
insert into barang values('00002','Anti Gores iPad','Apple',500000,5,400000)
insert into barang values('00003','Stilus Pen','Samsung',1000000,15,800000)
insert into barang values('00004','Casing Iphone','Apple',450000,10,350000)
insert into barang values('00005','Casing Xiaomi','Xiaomi',350000,3,300000)

create table transaksi_header
(
Kode_Transaksi varchar(10),
Tanggal_Transaksi date,
Kode_Pelanggan varchar(10),
Total_Barang int,
Total_Harga float,
)

create table transaksi_detail
(
Kode_Transaksi varchar(10),
Kode_Barang varchar(5),
Jumlah_Barang int,
Harga_Barang float
)

insert into transaksi_header values ('T000000001','2021-01-20','0000000001',2,800000)
insert into transaksi_header values ('T000000002','2021-02-15','0000000002',2,2000000)
insert into transaksi_header values ('T000000003','2021-02-20','0000000002',1,1000000)
insert into transaksi_header values ('T000000004','2021-03-25','0000000003',1,300000)
insert into transaksi_header values ('T000000005','2020-12-10','0000000003',3,1500000)

insert into transaksi_detail values ('T000000001','00001',1,300000)
insert into transaksi_detail values ('T000000001','00002',1,500000)
insert into transaksi_detail values ('T000000002','00003',2,2000000)
insert into transaksi_detail values ('T000000003','00003',1,1000000)
insert into transaksi_detail values ('T000000004','00001',1,300000)
insert into transaksi_detail values ('T000000005','00002',3,1500000)

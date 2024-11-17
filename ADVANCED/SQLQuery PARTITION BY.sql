--Mengenal perintah PARITITION BY

SELECT a.*, 
COUNT(Kode_Transaksi) OVER
(PARTITION BY Kode_Pelanggan) as CountKodeTrans
FROM transaksi_header a

SELECT a.*,
AVG(Total_Harga) OVER
(PARTITION BY Kode_Pelanggan) as AVGTotalHarga
FROM transaksi_header a

SELECT * FROM
(SELECT a.*,
SUM(Total_Harga) OVER
(PARTITION BY Kode_Pelanggan) as SUMTotalHarga
FROM transaksi_header a)x
WHERE x.SUMTotalHarga>2000000

SELECT a.*,
ROW_NUMBER() OVER
(PARTITION BY Kode_Pelanggan
ORDER BY Kode_Pelanggan,Tanggal_Transaksi DESC)
FROM transaksi_header a

SELECT a.*,
ROW_NUMBER() OVER
(PARTITION BY Kode_Pelanggan
ORDER BY Kode_Pelanggan,Tanggal_Transaksi)
FROM transaksi_header a

SELECT * FROM
(SELECT a.*,
ROW_NUMBER() OVER
(PARTITION BY Kode_Pelanggan
ORDER BY Kode_Pelanggan,Tanggal_Transaksi DESC) as RowNumber
FROM transaksi_header a)x
WHERE x.RowNumber = 2

--Latihan PARITITION BY
--ambil data transaksi
--yang paling pertama dilakukan oleh pelanggan
--dalam 3 bulan terakhir

SELECT * FROM
(SELECT a.*,
ROW_NUMBER() OVER
(PARTITION BY Kode_Pelanggan
ORDER BY Tanggal_Transaksi) as RowNumber
FROM transaksi_header a
WHERE Tanggal_Transaksi 
Between '2021-01-01' AND '2021-03-31')x
WHERE x.RowNumber = 1
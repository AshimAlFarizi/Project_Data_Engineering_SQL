
--Contoh penggunaan view
CREATE VIEW vw_transaksi_plg_terakhir2 as
SELECT Kode_Transaksi,Tanggal_Transaksi,Kode_Pelanggan, Total_Barang,Total_Harga FROM
(SELECT a.*,
ROW_NUMBER() OVER
(PARTITION BY Kode_Pelanggan ORDER BY
Kode_Pelanggan,Tanggal_Transaksi DESC) as nomorbaris
FROM transaksi_header a)x
WHERE x.nomorbaris = 1

--LATIHAN membuat VIEW
--buatlah sebuah view
--yang menampilakan data pelanggan
--yang memiliki peningkatan jumlah transaksi
--pada bulan terakhir dibanding bulan sebelumnya

SELECT * FROM transaksi_header


SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja1BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 03
GROUP BY Kode_Pelanggan 

SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja2BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 02
GROUP BY Kode_Pelanggan 

SELECT *
FROM
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja1BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 03
GROUP BY Kode_Pelanggan) x
FULL OUTER JOIN
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja2BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 02
GROUP BY Kode_Pelanggan) y
ON x.Kode_Pelanggan = y.Kode_Pelanggan

SELECT 
(CASE WHEN x.Kode_Pelanggan IS NULL THEN
y.Kode_Pelanggan
ELSE x.JmlBelanja1BlnTerakhir
END) as kode_pelanggan,
ISNULL (y.JmlBelanja2BlnTerakhir,0) as JmlBelanja2BlnTerakhir,
ISNULL (x.JmlBelanja1BlnTerakhir,0) as JmlBelanja1BlnTerakhir
FROM
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja1BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 03
GROUP BY Kode_Pelanggan) x
FULL OUTER JOIN
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja2BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 02
GROUP BY Kode_Pelanggan) y
ON x.Kode_Pelanggan = y.Kode_Pelanggan


SELECT 
(CASE WHEN x.Kode_Pelanggan IS NULL THEN
y.Kode_Pelanggan
ELSE x.JmlBelanja1BlnTerakhir
END) as kode_pelanggan,
ISNULL (y.JmlBelanja2BlnTerakhir,0) as JmlBelanja2BlnTerakhir,
ISNULL (x.JmlBelanja1BlnTerakhir,0) as JmlBelanja1BlnTerakhir
FROM
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja1BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 03
GROUP BY Kode_Pelanggan) x
FULL OUTER JOIN
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja2BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = 2021 AND
MONTH(Tanggal_Transaksi) = 02
GROUP BY Kode_Pelanggan) y
ON x.Kode_Pelanggan = y.Kode_Pelanggan
WHERE 
ISNULL (x.JmlBelanja1BlnTerakhir,0) >
ISNULL (y.JmlBelanja2BlnTerakhir,0)

SELECT GETDATE()

SELECT DATEADD(YEAR,1,'2021-03-31')

SELECT YEAR(DATEADD(YEAR,-3,GETDATE()))
SELECT MONTH(DATEADD(MONTH,2,GETDATE()))

SELECT 
(CASE WHEN x.Kode_Pelanggan IS NULL THEN
y.Kode_Pelanggan
ELSE x.JmlBelanja1BlnTerakhir
END) as kode_pelanggan,
ISNULL (y.JmlBelanja2BlnTerakhir,0) as JmlBelanja2BlnTerakhir,
ISNULL (x.JmlBelanja1BlnTerakhir,0) as JmlBelanja1BlnTerakhir
FROM
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja1BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = YEAR(DATEADD(YEAR,-3,GETDATE())) AND
MONTH(Tanggal_Transaksi) = MONTH(DATEADD(MONTH,2,GETDATE()))
GROUP BY Kode_Pelanggan) x
FULL OUTER JOIN
(SELECT Kode_Pelanggan,
SUM(Total_Barang) as JmlBelanja2BlnTerakhir
FROM transaksi_header
WHERE YEAR(Tanggal_Transaksi) = YEAR(DATEADD(YEAR,-3,GETDATE())) AND
MONTH(Tanggal_Transaksi) = MONTH(DATEADD(MONTH,1,GETDATE()))
GROUP BY Kode_Pelanggan) y
ON x.Kode_Pelanggan = y.Kode_Pelanggan
WHERE 
ISNULL (x.JmlBelanja1BlnTerakhir,0) >
ISNULL (y.JmlBelanja2BlnTerakhir,0)
--CASE WHEN part II

select *,
(
CASE 
	WHEN Merk = 'Samsung' THEN 1
	WHEN Merk = 'Apple' THEN 2
	ELSE 3
END) as contoh1
from barang

-- CASE WHEN part III
--tampilkan jumlah pelanggan yang
--melakukan pembelian
--dengan pengelompokkan <500rb, 500rb dan 1jt
-->= 1jt

SELECT 
(CASE
	WHEN total_harga <500000 THEN '01. <500rb'
	WHEN total_harga >= 500000 and total_harga <1000000 THEN '02. 500rb - 1jt'
	WHEN total_harga >= 1000000 THEN '03. >=1jt'
END) as range_total,
count (Kode_Pelanggan) as jml_plg
FROM transaksi_header
GROUP BY 
(CASE
	WHEN total_harga <500000 THEN '01. <500rb'
	WHEN total_harga >= 500000 and total_harga <1000000 THEN '02. 500rb - 1jt'
	WHEN total_harga >= 1000000 THEN '03. >=1jt'
END)
ORDER BY
(CASE
	WHEN total_harga <500000 THEN '01. <500rb'
	WHEN total_harga >= 500000 and total_harga <1000000 THEN '02. 500rb - 1jt'
	WHEN total_harga >= 1000000 THEN '03. >=1jt'
END);


-- CASE WHEN part V
--tampilkan data pelanggan
--laki-laki berasal dari Tangerang
--dan perempuan yang berasal dari Jakarta
SELECT * 
FROM pelanggan
WHERE
(CASE WHEN Jenis_Kelamin = 'L' 
AND Kota_pelanggan in ('Tangerang','Tgrg') THEN 1
WHEN Jenis_Kelamin = 'P'
AND Kota_pelanggan like '%Jakarta%' THEN 1
ELSE 0
END) =1

-- CASE WHEN part VII
--cari jumlah transaksi pelanggan
--dengan syarat total harga di atas 1jt
--tetapi dengan tetap menampilkan
--pelanggan yang tidak memiliki transaksi
--di atas 1 jt

SELECT * FROM transaksi_header
SELECT * FROM transaksi_detail

SELECT Kode_Pelanggan, 
count(1) as jmlTransaksi1,
SUM(CASE WHEN Total_Harga > 1000000 THEN 1
ELSE 0 END) As jmlTransaksi2,
count(CASE WHEN Total_Harga > 1000000 THEN 1
ELSE 0 END) As jmlTransaksi3,
count(CASE WHEN Total_Harga > 1000000 THEN 1
END) As jmlTransaksi3,
SUM(CASE WHEN Total_Harga > 1000000 THEN 1
END) As jmlTransaksi4
FROM transaksi_header
GROUP BY Kode_Pelanggan

--LATIHAN CASE WHEN
--tampilkan jumlah pelanggan
--berdasarkan kelompok harga transaksi
--untuk barang dengan nama casing
--yang total nilai barang >500rb
--dan anti gores dengan total nilai barang >1jt



SELECT * FROM transaksi_detail a
JOIN barang b on a.Kode_Barang = b.Kode_Barang
WHERE (CASE WHEN b.Nama_Barang LIKE '%Casing%' AND
		b.Harga*b.Stok >500000 THEN 1
		WHEN b.Nama_Barang LIKE '%Anti%Gores%' AND
		b.Harga*b.Stok > 1000000 THEN 1
		ELSE 0
END) =1


SELECT
(CASE
	WHEN total_harga <500000 THEN '01. <500rb'
	WHEN total_harga >= 500000 and total_harga <1000000 THEN '02. 500rb - 1jt'
	WHEN total_harga >= 1000000 THEN '03. >=1jt'
END),
COUNT (1) as jmlpelanggan
FROM transaksi_header
WHERE Kode_Transaksi IN
(SELECT DISTINCT Kode_Transaksi FROM transaksi_detail a
JOIN barang b on a.Kode_Barang = b.Kode_Barang
WHERE (CASE WHEN b.Nama_Barang LIKE '%Casing%' AND
		b.Harga*b.Stok >500000 THEN 1
		WHEN b.Nama_Barang LIKE '%Anti%Gores%' AND
		b.Harga*b.Stok > 1000000 THEN 1
		ELSE 0
END) =1)
GROUP BY
(CASE
	WHEN total_harga <500000 THEN '01. <500rb'
	WHEN total_harga >= 500000 and total_harga <1000000 THEN '02. 500rb - 1jt'
	WHEN total_harga >= 1000000 THEN '03. >=1jt'
END)
ORDER BY
(CASE
	WHEN total_harga <500000 THEN '01. <500rb'
	WHEN total_harga >= 500000 and total_harga <1000000 THEN '02. 500rb - 1jt'
	WHEN total_harga >= 1000000 THEN '03. >=1jt'
END)


SELECT * FROM transaksi_detail a
JOIN barang b on a.Kode_Barang = b.Kode_Barang
SELECT * FROM barang
SELECT * FROM transaksi_header
SELECT * FROM transaksi_detail



SELECT * FROM transaksi_detail a
JOIN barang b on a.Kode_Barang = b.Kode_Barang
WHERE (CASE WHEN b.Nama_Barang LIKE '%Casing%' THEN 1
		--WHEN b.Nama_Barang LIKE '%Anti%Gores%' THEN 1
		ELSE 0
END) =1


SELECT
(CASE
	WHEN Harga_Barang<500000 THEN '01. <500rb'
	WHEN Harga_Barang >= 500000 and Harga_Barang <1000000 THEN '02. 500rb - 1jt'
	WHEN Harga_Barang >= 1000000 THEN '03. >=1jt'
END) Range_Harga,
COUNT (1) as jmlpelanggan
FROM transaksi_detail
WHERE Kode_Transaksi IN
(SELECT Kode_Transaksi FROM transaksi_detail a
JOIN barang b on a.Kode_Barang = b.Kode_Barang
WHERE (CASE WHEN b.Nama_Barang LIKE '%Casing%' THEN 1
		--WHEN b.Nama_Barang LIKE '%Anti%Gores%' AND
		--b.Harga*b.Stok > 1000000 THEN 1
		ELSE 0
END) =1)
GROUP BY
(CASE
	WHEN Harga_Barang<500000 THEN '01. <500rb'
	WHEN Harga_Barang >= 500000 and Harga_Barang <1000000 THEN '02. 500rb - 1jt'
	WHEN Harga_Barang >= 1000000 THEN '03. >=1jt'
END) 
ORDER BY
(CASE
	WHEN Harga_Barang<500000 THEN '01. <500rb'
	WHEN Harga_Barang >= 500000 and Harga_Barang <1000000 THEN '02. 500rb - 1jt'
	WHEN Harga_Barang >= 1000000 THEN '03. >=1jt'
END)

SELECT * FROM transaksi_detail a
JOIN barang b on a.Kode_Barang = b.Kode_Barang


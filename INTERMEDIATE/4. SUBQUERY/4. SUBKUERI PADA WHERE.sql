
SELECT *
FROM pelanggan
WHERE Kode_Pelanggan in
(SELECT	Kode_Pelanggan
FROM transaksi_header)
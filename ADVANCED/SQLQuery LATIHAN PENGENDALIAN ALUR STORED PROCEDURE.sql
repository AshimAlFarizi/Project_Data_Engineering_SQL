--buat sebuah store procedure 
--dimana parameter yang dikirimkan adalah
--Kode Pelanggan, Kode Barang,
--Jumlah, Harga Barang, 
--Kemudian insert datanya ke transaksi header
--dan transaksi detail
--asumsi 1 transaksi header = 1 transaksi detail

SELECT * FROM transaksi_header
SELECT * FROM transaksi_detail

CREATE PROCEDURE insertTransaksi
(
@KdPelanggan as VARCHAR(10),
@KdBarang as VARCHAR(5),
@Jumlah as int,
@HargaBarang  as int
)
AS
BEGIN
DECLARE @KdTransaksi VARCHAR (10);
DECLARE @KdTemp int;
DECLARE @tanggal as DATE;

SET @tanggal = (SELECT CONVERT(DATE,GETDATE()))

SET @KdTemp =
(SELECT CAST(right(max(Kode_Transaksi),9) as int)+1
FROM transaksi_header)
SET @KdTransaksi = 
CONCAT('T00000000',@KdTemp)

INSERT INTO transaksi_detail VALUES
(@KdTransaksi,@KdBarang,@Jumlah,@HargaBarang)

INSERT INTO transaksi_header VALUES
(@KdTransaksi,@tanggal,@KdPelanggan,@Jumlah,@HargaBarang)

END

EXEC insertTransaksi '0000000002','00003',1,2000000
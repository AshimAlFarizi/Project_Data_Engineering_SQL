--PRAKTIK MEMBUAT TRIGGER

CREATE TRIGGER updateStok
ON transaksi_detail
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE barang
	set Stok = Stok - 
	(SELECT jumlah_barang FROM inserted)
	WHERE Kode_Barang = 
	(SELECT Kode_Barang FROM inserted)

END

SELECT * FROM barang
SELECT Kode_Barang,Stok FROM barang
--00001	20
--00002	5
--00003	15
--00004	10
--00005	3
SELECT * FROM transaksi_detail
BEGIN TRANSACTION
ROLLBACK

INSERT INTO transaksi_detail 
VALUES ('T000000007','00004',1,450000)



--LATIHAN MEMBUAT TRIGGER
CREATE TABLE log_create
(
kejadian XML,
oleh sysname
)

CREATE TRIGGER tambahLogCreate
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO log_create (kejadian,oleh)
	VALUES (EVENTDATA(),USER)
END

CREATE TABLE log_coba_insert2
(
kode varchar(20),
nama varchar(100)
)

SELECT * FROM log_create


--LATIHAN TRIGGER
--buatlah sebuah trigger
--untuk mengupdate data jumlah dan harga
--transaksi header ketika ada insert
--ke transaksi detail

SELECT * FROM transaksi_detail
SELECT * FROM transaksi_header

CREATE TRIGGER updateTransaksi 
ON transaksi_detail
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE transaksi_header
	SET Total_Barang = Total_Barang +
	(SELECT Jumlah_Barang FROM inserted)
	WHERE Kode_Transaksi = 
	(SELECT Kode_Transaksi FROM inserted);

	UPDATE transaksi_header
	SET Total_Harga = Total_Harga +
	(SELECT Harga_Barang FROM inserted)
	WHERE Kode_Transaksi = 
	(SELECT Kode_Transaksi FROM inserted);

END
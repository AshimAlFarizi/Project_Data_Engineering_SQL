SELECT * FROM barang


CREATE PROCEDURE InsertBarang
(@Nama_Barang as VARCHAR(20),
@Merk as VARCHAR(20),
@Harga as int,
@HPP as int
)
AS
BEGIN

DECLARE @KdBarang VARCHAR(5);
SET @KdBarang = '00006'

INSERT INTO barang VALUES
(@KdBarang,@Nama_Barang,@Merk,@Harga,0,@HPP)
END


ALTER PROCEDURE InsertBarang
(@Nama_Barang as VARCHAR(20),
@Merk as VARCHAR(20),
@Harga as int,
@HPP as int
)
AS
BEGIN

DECLARE @KdBarang VARCHAR(5);
DECLARE @KodeTemp int;
--SET @KdBarang = '00006'
SET @KodeTemp = 
(SELECT CAST(MAX(Kode_Barang)AS int)+1 FROM barang)

IF @KodeTemp < 10
	BEGIN
		SET @KdBarang = CONCAT('0000',@KodeTemp)
	END

INSERT INTO barang VALUES
(@KdBarang,@Nama_Barang,@Merk,@Harga,0,@HPP)
END


EXEC InsertBarang 'Casing Huawei','Huawei',100000,70000

DELETE FROM barang WHERE Kode_Barang = '00006'

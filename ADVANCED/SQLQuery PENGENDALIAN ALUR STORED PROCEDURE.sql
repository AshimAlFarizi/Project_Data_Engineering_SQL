--Pengendalian Alur Stored Procedure
CREATE TABLE apparel
(
KodeApparel int,
NamaApparel VARCHAR(20),
Ukuran VARCHAR(2)
)

SELECT * FROM apparel

CREATE PROCEDURE InsertApparel
(@NamaBarang as VARCHAR(20))
AS
BEGIN

DECLARE @KdBarang as int;
SET @KdBarang = 0
DECLARE @hitung as int;
SET @hitung = 1
DECLARE @ukuran as VARCHAR(2)

WHILE @hitung <= 3
BEGIN
	IF @hitung = 1 BEGIN SET @ukuran = 'S' END
	IF @hitung = 2 BEGIN SET @ukuran = 'M' END
	IF @hitung = 3 BEGIN SET @ukuran = 'L' END
	SET @KdBarang = @KdBarang + 1
	INSERT INTO apparel VALUES 
	(@KdBarang,@NamaBarang,@ukuran)
	SET @hitung = @hitung + 1
END
END

EXEC InsertApparel 'Apparel1'
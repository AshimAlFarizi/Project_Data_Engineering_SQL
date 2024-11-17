
select * from barang
where harga >= 300000 and harga < 500000
;

select *
from barang
where harga < 300000 or harga >= 500000
;

select *
from barang
where merk = 'Apple' or
harga >= 300000 and harga < 500000


select *
from barang
where merk = 'Apple' and
(harga <= 450000 or harga > 700000)
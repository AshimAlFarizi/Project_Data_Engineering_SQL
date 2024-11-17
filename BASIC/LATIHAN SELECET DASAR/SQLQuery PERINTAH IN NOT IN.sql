
select * 
from barang 
where harga IN 
(
300000,500000,1000000
);

select * 
from barang 
where merk IN ('Apple','Xiaomi');

select * 
from barang 
where merk NOT IN ('Apple','Xiaomi');

select * 
from barang 
where merk IN ('Apple','Xiaomi')
and stok > 5
;
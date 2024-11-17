
select *
from transaksi_header
where total_harga between 800000 and 1000000
-- sama dengan total harga >= 800000 and
-- total harga <= 1000000

select *
from transaksi_header
where total_barang between 2 and 3

select *
from transaksi_header
where total_barang between 2 and 3
and total_harga = 800000

select *
from transaksi_header
where total_barang between 2 and 3
or total_harga <= 800000

select *
from transaksi_header
where total_barang not between 2 and 3
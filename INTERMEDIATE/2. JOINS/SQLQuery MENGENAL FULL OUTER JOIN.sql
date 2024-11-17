
select *
from pelanggan a
full outer join transaksi_header b
on a.Kode_Pelanggan = b.Kode_Pelanggan

select * 
from transaksi_header

begin transaction

rollback
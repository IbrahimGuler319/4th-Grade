set @country = "Spain";
select @country;
call select_customers_by_country(@country);
select @country;

select * from shippers;

select count(o.orderid)
from orders o
join shippers s on o.shipperid = s.shipperid
where s.shippername = "Speedy Express";

set @order_cnt = 0;
select @order_cnt;
call order_count_by_shipper("United Package", @order_cnt);
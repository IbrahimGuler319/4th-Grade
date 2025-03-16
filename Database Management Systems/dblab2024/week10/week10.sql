select sum(p.price * od.quantity)
from Orders o 
join OrderDetails od on  o.orderid = od.orderid
join Products p on p.productid = od.productid
where o.customerid = 5;

set @total = 0;
select @total;
call calculate_total_sales (7, @total)
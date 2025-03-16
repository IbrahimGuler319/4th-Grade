create or replace 
view usa_customers(CustomerID, CustomerName, Address) as
select c.CustomerID, c.CustomerName, c.Address
from customers c
where c.Country = "USA";

select *
from usa_customers uc
join orders o on uc.CustomerID = o.CustomerID;


create or replace
view products_below_avg as
select *
from products
where price < (select avg(price) from products);


select * from products_below_avg;

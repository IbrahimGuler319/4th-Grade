#Retrieve total quantity orderede for a customer 
select c.CustomerName, sum(od.Quantity) as TotalQuantity 
from Orders o
join Customers c on o.CustomerID = c.CustomerID
join OrderDetails od on od.OrderID = o.OrderID
where c.CustomerID = 3
group by c.CustomerID, c.CustomerName
order by TotalQuantity desc;

#Get total revenue by category
select cat.CategoryID, cat.CategoryName, sum(od.Quantity * p.Price) as TotalRevenue 
from Categories cat
join Products p on p.CategoryID = cat.CategoryID 
join OrderDetails od on od.ProductID = p.ProductID
group by cat.CategoryID
order by TotalRevenue;


-- Easy level task

select * from Customers

select productname from Products 
union --all
select productname from Products_Discounted

select * from Products
intersect 
select * from Products_Discounted


select productname from Products
intersect 
select productname from Products_Discounted

select distinct firstname, country from Customers

select * from Products_Discounted




select price,  
case
when price >1000 then 'high' 
else 'low' end as Asliddin
from Products 


Select stockquantity, IIF(StockQuantity>100, 'YEs', 'NO') from Products_Discounted

-- Midle level tasks 
  
select ProductName from Products
union 
select Productname from Products_Discounted


select * from Products 
except 
select * from Products_Discounted


select *, IIF(Price>1000, 'Expensive', 'Affordable') as [Conditional column] from Products 

select * from Employees
where age <25 or salary > 60000


Update Employees

SET salary = salary * 1.1 

where DepartmentName = 'HR' or EmployeeID = 5 
  
-- hard level tasks 
  
select * ,
case when saleamount > 500 then 'Top tier' 
when saleamount between 200 and 500 then 'Mid tier'
else 'low tier' end Salescondition 
from Sales 



select CustomerID from orders 
except 
select CustomerID from Sales 


select CustomerID, quantity,
case when quantity = 1 then '3%' 
when quantity between 1 and 3 then '5%' 
else '7%' end from orders 


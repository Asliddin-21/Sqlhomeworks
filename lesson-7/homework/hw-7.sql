-- Easy level tasks 

select min(price)
from Products

select max(salary)
from Employees

select count(*) as totalcoustomers 
from Customers

SELECT COUNT(DISTINCT Category) AS UniqueCategories
FROM Products


select sum(saleamount) as totalsales 
from Sales 
where ProductID = 7 


select avg(age) as Averageemployeeage 
from Employees

select DepartmentName, COUNT(*) as Employeecount  
from Employees 
group by departmentName 


SELECT Category, 
       MIN(Price) AS MinimumPrice, 
       MAX(Price) AS MaximumPrice
FROM Products
GROUP BY Category;


SELECT CustomerID, 
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID


SELECT departmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY departmentName 
HAVING COUNT(*) > 5


-- Middle level task 


SELECT ProductID, 
       SUM(SaleAmount) AS TotalSales, 
       AVG(SaleAmount) AS AverageSales
FROM Sales
GROUP BY ProductID;



SELECT COUNT(*) AS HREmployeeCount
FROM Employees
WHERE DepartmentName = 'HR';


SELECT departmentname, 
       MAX(Salary) AS HighestSalary, 
       MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY departmentname 


SELECT DepartmentName, 
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentName


SELECT DepartmentName, 
       AVG(Salary) AS AverageSalary, 
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName


SELECT Category, 
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400



SELECT YEAR(SaleDate) AS SalesYear, 
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY SalesYear


SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3


SELECT DepartmentName, 
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000

-- Hard level tasks 

SELECT Category, 
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150


SELECT CustomerID, 
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500


SELECT DepartmentName, 
       SUM(Salary) AS TotalSalary, 
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000

select customerid, sum(totalamount) as totalsales
from Orders
group by CustomerID
having sum(totalamount) > 50


Select  month (orderdate) month_year, 
    SUM(totalamount) total_sales, 
    COUNT(distinct ProductID) as Prodid,
    Quantity 
from Orders
group by MONTH(orderdate), Quantity
having Quantity > 2


SELECT 
    YEAR(OrderDate) AS OrderYear,
    MIN(Quantity) AS MinOrderQuantity,
    MAX(Quantity) AS MaxOrderQuantity
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear







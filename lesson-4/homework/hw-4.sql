-- Easy level tasks 


SELECT TOP 5 *
FROM Employees
ORDER BY Salary DESC;


SELECT DISTINCT Category
FROM Products;


select * from Products 
where Price >100 


select * from Customers 
where firstname like 'A%'


select * from Products 
order by price asc 


select * from employees 
where salary >= 60000 and DepartmentName = 'HR' 
  

SELECT 
    ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;



select * from Products
where price between 50 and 100 



SELECT DISTINCT Category, ProductName
FROM Products
ORDER BY Category, ProductName;


SELECT DISTINCT Category, ProductName
FROM Products
ORDER BY ProductName DESC;

-- Medium level tasks 


SELECT TOP 10 *
FROM Products
ORDER BY Price DESC;

SELECT COALESCE(FirstName, LastName) AS DisplayName
FROM Employees;


SELECT DISTINCT Category, Price
FROM Products;


select * from Employees 
where age between 30 and 40 or DepartmentName = 'Marketing'
  

SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


SELECT *
FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;


SELECT *
FROM Products
WHERE ProductName LIKE '%e%';


SELECT *
FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');


SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;


-- Hard level tasks 


SELECT TOP(5) ProductName, StockQuantity
FROM Products
ORDER BY StockQuantity DESC;



SELECT FirstName + ' ' + LastName AS FullName
FROM Employees;


SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;


SELECT *
FROM Products
WHERE Price < (SELECT AVG(Price) FROM Products) * 0.1;



SELECT *
FROM Employees
WHERE Age < 30 AND DepartmentName IN ('HR', 'IT');


SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com';



SELECT *
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE DepartmentName = 'Sales'
);



SELECT *
FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE();

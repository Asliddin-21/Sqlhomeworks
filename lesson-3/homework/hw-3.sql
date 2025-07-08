--Homewrok 3 
-- Easy level tasks (10) 

1) BULK INSERT is a command in SQL Server that is used to quickly import large amounts of data from a file (such as a CSV or text file) into a database table.
The main purpose of BULK INSERT is to make data loading faster and more efficient, especially when dealing with big files that contain thousands or millions of rows. It is commonly used in data migration, reporting systems, and ETL processes.

2) - CSV (Comma-Separated Values) � A common format where data fields are separated by commas.
   - TXT (Text File) � A plain text file that can use different delimiters like tabs or pipes.
   - XML (Extensible Markup Language) � A structured format used for storing and transporting data.
   - JSON (JavaScript Object Notation) � A lightweight data format often used in web applications.

3) Create table Productss (Product_id int, Product_name varchar (50), Price decimal(10,2)) 

4) INSERT INTO Productss VALUES 
   (1, 'Phone', 599.99),
   (2, 'Laptop', 899.99),
   (3, 'Keyboard', 99.90);
  
select * from Productss

5) In SQL Server, NULL means that a column can have no value. It is used when the data is unknown or not provided. On the other hand, NOT NULL means that the column must always have a value and cannot be left empty.
For example, if a column is defined as Email VARCHAR(100) NULL, it means the email can be left blank. But if it is defined as Name VARCHAR(50) NOT NULL, then the name must be filled in for every record.

6) Alter Table Productss
   Add constraint UQ_Product_name Unique (Product_name)

7) /*
   This query selects all products
   with a price greater than 100
   from the Productss table.
   */
  SELECT * 
  FROM Productss
  WHERE Price > 100;

8)  Alter table Productss
    Add Categoty_ID int not NULL 

9) Create table Categories (Category_ID int primary key, Category_name varchar (50) unique) 

   select * from Categories

10) In SQL Server, the IDENTITY column is used to automatically generate unique numbers for each row in a table. It is often used for primary keys.
    When a column is set as IDENTITY, SQL Server will automatically insert a number into that column every time a new row is added. You don�t have to type the number yourself.
  
    The IDENTITY property has two parts:
    - Seed � the starting number (like 1)
    - Increment � how much the number increases each time (like 1)

    clear example here could be syntaxt: 
    CREATE TABLE Students (
    StudentID INT IDENTITY(1,1),
    Name VARCHAR(50));

    In this example, StudentID will start at 1 and go up by 1 for each new student.
    So, the purpose of the IDENTITY column is to make sure each row has a unique number, and it saves time by generating it automatically.



    -- Medium level tasks (10) 


11) BULK INSERT Productss
   FROM 'C:\Data\productss.txt'
   WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

12) ALTER TABLE Products
   ADD CONSTRAINT FK_Products_Categories
   FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


13) Both PRIMARY KEY and UNIQUE KEY are used to make sure that the values in a column (or columns) are unique � like, no duplicates. But they�re not exactly the same. 

  PRIMARY KEY (the main ID)
- It's like the main way to identify each row in a table.
- You can only have ONE primary key in a table.
- It can�t be NULL � every row has to have a value for it.
- It�s usually used for something like an ID column.

  example:
  
  CREATE TABLE Students 
    (StudentID INT PRIMARY KEY,
    Name NVARCHAR(100));

  UNIQUE KEY (extra rules for uniqueness)
- It also makes sure values are unique, but it�s not the main ID.
- You can have more than one UNIQUE key in a table.
- It can allow NULLs (usually just one NULL is allowed).
- It�s good for things like email addresses or usernames.

  example: 
  CREATE TABLE Students 
   (StudentID INT PRIMARY KEY,
    Email NVARCHAR(100) UNIQUE,
    PhoneNumber NVARCHAR(20) UNIQUE);

  
14) ALTER TABLE Productss
    ADD CONSTRAINT CHK_Products_Price_Positive
    CHECK (Price > 0);

15) Alter table Productss 
    add Stock int not null default 0

16) UPDATE Productss
    SET Price = 0
    WHERE Price IS NULL;

17) A FOREIGN KEY in SQL Server is used to link two tables together. It makes sure that the value in one table matches a value in another table, which helps keep the data consistent. 
    For example, if you have a Products table and a Categories table, you can use a FOREIGN KEY to make sure every product is assigned to a valid category.

    CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100));

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID));



-- Hard level tasks (10) 

18) CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Email VARCHAR(100),
    CHECK (Age >= 18));

    select * from Customers	

  19) CREATE TABLE Orders (
    OrderID INT IDENTITY(100, 10) PRIMARY KEY,
    CustomerName NVARCHAR(100),
    OrderDate DATE
);

select * from Orders 

  20) CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID)
);

select * from OrderDetails


21) So both COALESCE and ISNULL are used to deal with NULL values in SQL Server � like when a column doesn�t have a value and you want to show something else instead.
  
  for example: 
  SELECT ISNULL(Price, 0) AS PriceAfterCheck FROM Products;
  
  COALESCE is kind of like ISNULL�s cooler, more flexible cousin. You can give it a bunch of values, and it�ll return the first one that�s not NULL. 
  So if you�re checking more than one column, COALESCE is the way to go.

  for example: 
  SELECT COALESCE(DiscountPrice, SalePrice, 0) AS FinalPrice FROM Products;


22) CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    HireDate DATE
);

select * from Employees

  23) 
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(100)
);


CREATE TABLE Employeees (
    EmpID INT PRIMARY KEY,
    EmpName NVARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

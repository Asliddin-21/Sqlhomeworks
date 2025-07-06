-- Basic level tasks (10)

1) CREATE TABLE Employees 
    (EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2))

2) -- single raw 
	
	INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Asliddin', 55000.00);

-- multiple raw 

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
    (2, 'Umidjon', 58000.00),
    (3, 'Sherzod', 61000.00);

3) Update Employees
	Set salary = 7000.00
	where EmpID = 1
select * from Employees 

4) Delete from Employees
	where empID = 2 

5) - DELETE removes specific rows from a table. You can choose which ones using a condition, and you can undo it if you're using transactions.
   - TRUNCATE clears all rows from a table really fast. You can’t pick and choose rows, and it’s usually not undoable.
   - DROP completely deletes the table itself—data, structure, everything. It’s like it never existed.

6)  ALTER TABLE Employees
    ALTER COLUMN Name VARCHAR(100);


7) ALTER TABLE Employees
   ADD Department VARCHAR(50);

8) Alter Table Employees
   ALTER COLUMN Salary FLOAT;

9) create table Departments (DepartnmentID int, Departmentname varchar(50))

   select * from Departments

10) Truncate table Employees

   select * from Employees


  -- Intermediate level tasks (6) 

 11)  INSERT INTO Departments Values 
    (1, 'Human Resources'),
    (2, 'Finance'),
    (3, 'Engineering'),
    (4, 'Marketing'),
    (5, 'Research and Development')

  12)  Update Employees
	    Set Department = 'Management' 
	    where salary > 5000



  13) Truncate table employees 

  14) alterr table Employees
	drop column department 

  15)	EXEC sp_rename 'Employees', 'StaffMembers';

	select * from Staffmembers 

  16) 	Drop table Departments


  -- Advanced level tasks (9) 


  17) Create table Production (ProductID int, ProductName varchar(50), Category varchar(50), Price decimal)
	
	    select * from Production 
  

  18) 	Alter table Production
	      Add constraint chk_price_positive Check (Price>0) 



  19) Alter table Production 
    Add Stockquantity int default 50


  20) EXEC sp_rename 'Production.Category', 'ProductCategory', 'COLUMN';

      select * from Production 

  21) 	INSERT INTO Production VALUES 

    (1, 'Phone', 'Wireless', 100, 75),
    (2, 'Car', 'Heavy', 1000, 60),
    (3, 'Mouse', 'Wireless', 10, 55),
    (4, 'Laptop', 'Cheap', 20, 65),
    (5, 'Watch', 'Expensive', 2000, 100);

  	select * from Production 

  22) 	SELECT * INTO Products_Backup
        FROM Products

        select * from Products_Backup
  

  23)  EXEC sp_rename 'Production', 'Inventory';

       select * from Inventory 


  24) -- Step 1: Drop the constraint
      ALTER TABLE Inventory DROP CONSTRAINT chk_price_positive;

      -- Step 2: Alter the column
      ALTER TABLE Inventory ALTER COLUMN Price FLOAT;

      -- Step 3: Recreate the constraint (assuming it checks for positive prices)
      ALTER TABLE Inventory ADD CONSTRAINT chk_price_positive CHECK (Price > 0);

      select * from Inventory 
  

  25)  ALTER TABLE Inventory
       ADD ProductCode INT IDENTITY(1000, 5);
  











  








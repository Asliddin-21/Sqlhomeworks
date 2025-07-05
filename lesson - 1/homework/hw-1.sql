--Question 1 (Easy part) 

1) Data is the most basic unit of information. It can be anything like numbers, words, images, or symbols. On its own, data doesn’t mean much until it’s organized or given context.

2) database is a place where data is stored in an organized way so it’s easy to access, manage, and update. Think of it like a digital filing cabinet where all your information is kept neatly.

3) A relational database is a type of database that stores data in tables, and those tables are connected (or “related”) to each other through common fields. It’s like having multiple spreadsheets that can talk to each other. For example, one table might have student info, and another might have their grades, and they’re linked by a student ID.

4) A table is a structure inside a database that organizes data into rows and columns. Each row is a record (like one student), and each column is a field (like name, age, or grade). It’s kind of like a mini spreadsheet inside the database.


-- key five sql features 

1) High performance and in-memore processing
2) Advanced security features 
3) Cross platform and cloud integration 
4) Built in business intelligence (BI) tools 
5) AI and real time data capabilities 

-- Two authentication modes 
- Windows Authentication – This uses the Windows user account to log in. It's more secure because it uses Active Directory.
- SQL Server Authentication – This requires a username and password set up in SQL Server. It's useful when Windows Authentication isn't available.

--Question 2 (Medium) 

create database SchoolDB 

create table Student (StudentID int, student_name varchar(50), Age int)  

1) SQL Server – This is the actual database system where data is stored and managed. It runs in the background and handles all the data processing.
2) SSMS (SQL Server Management Studio) – This is a tool used to connect to SQL Server. It lets you write queries, manage databases, and see results in a user-friendly way.
3) SQL (Structured Query Language) – This is the language used to talk to the database. You use SQL to ask questions (queries), add data, or make changes.
So basically in a clear language:
SQL Server = the engine,
SSMS = the control panel,
SQL = the language you use to give commands.

-- Question 3 (Hard) 

1) DQL - data quesry language
  SELECT * FROM Students; - the main command and gets all the data from Students table. 
  
2) DML - data manipulation language 
commands; inster, update, delete 
the purpose is to alter the data 

3) DDL - data definition language 
commans; create, alter, drop and truncate 
the purpose is to define or alter the structure of the database 

4) DCL - data control language 
commands; Grant, Revoke 
  example;
GRANT SELECT ON Students TO user1;
REVOKE SELECT ON Students FROM user1;
  the purpose is to control the access to data 

5) TCL - transaction control language 
  commands; commit, rollback, savepoint 
  example;
  BEGIN;
UPDATE Students SET Age = 22 WHERE Name = 'Ali';
COMMIT;
the purpose is to manage changes made by DDL commands 



  insert into student values (1, 'Asliddin', 21),
							(2, 'Umidjon', 45),
							(3, 'Sherzod', 36)

  select * from student 


  
- Download the Backup File
Go to the following link and download the AdventureWorksDW2022.bak file:
https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
- Move the File to the Backup Folder
After downloading, move the .bak file to your SQL Server's default backup directory.
Example path:
C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup
- Open SQL Server Management Studio (SSMS)
Launch SSMS and connect to your SQL Server instance.
- Start the Restore Process
- In Object Explorer, right-click on the “Databases” folder.
- Select “Restore Database…”
- Select the Backup File
- In the Restore Database window, choose the “Device” option.
- Click the “…” button and then click “Add.”
- Browse to the location of the .bak file and select it.
- Configure Restore Settings
- Make sure the database name is set to AdventureWorksDW2022.
- Optionally, go to the “Files” tab to verify or change the file paths.
- Restore the Database
- Click “OK” to begin the restore process.
- Once it finishes, you should see a message saying the database was restored successfully.















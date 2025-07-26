--easy level tasks 

select concat(EMPLOYEE_ID, '-', first_name, ' ', last_name) AS full_name
from employees

update employees
set phone_number = replace(phone_number, '124', '999')
where phone_number like '%124%'


select first_name as [name], len(FIRST_NAME) as [name length]
from Employees
where FIRST_NAME like '[A,J,M]%'
order by FIRST_NAME

select manager_id, sum(salary) as totalsalary from Employees
group by manager_id 

select * from TestMax

select Year1, 
    MaxValue
from TestMax
cross apply (select MAX(val) as MaxValue
    from (Values (Max1), (Max2), (Max3)) AS ValueList(val)) AS Result

select * from cinema

select id, movie, description, rating from cinema
where id % 2 = 1 and description not like '%boring%' 

select * from SingleOrder
order by id desc

select * from person

select coalesce(ssn,passportid, itin) as first_available from person

--Medium level tasks 
select * from Students 

SELECT
  FullName,
  LEFT(FullName, CHARINDEX(' ', FullName) - 1) AS FirstName,
  SUBSTRING(
    FullName,
    CHARINDEX(' ', FullName) + 1,
    CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1) - CHARINDEX(' ', FullName) - 1
  ) AS MiddleName,
  RIGHT(FullName, LEN(FullName) - CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1)) AS LastName
FROM Students

select * from Orders

select distinct CustomerID from orders 
where DeliveryState = 'CA' 
and CustomerID in(select CustomerID from Orders where DeliveryState = 'TX')

select * from DMLTable 
select string_agg(string,' ') from DMLtable 



select concat(first_name, ' ', last_name) as fullname from Employees
where len(first_name + last_name) - len(replace(first_name + last_name, 'a', '')) >=3 


select * from Employees

SELECT 
  DEPARTMENT_ID,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) AS Over3Years,
  CAST(SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS PercentageOver3Years
FROM Employees
GROUP BY Department_ID

--difficult level tasks 

declare @input varchar(100) = 'tf56sd#%OqH'
declare @i int = 1
declare @len int = len(@input)

declare @upper varchar(50) = ''
declare @lower varchar(50) = ''
declare @digits varchar(100) = ''
declare @others varchar(100) = ''

WHILE @i <= @len
BEGIN
    DECLARE @char CHAR(1) = SUBSTRING(@input, @i, 1)

   IF @char LIKE '[A-Z]'
        SET @upper += @char;
    ELSE IF @char LIKE '[a-z]'
        SET @lower += @char;
    ELSE IF @char LIKE '[0-9]'
        SET @digits += @char;
    ELSE
        SET @others += @char;

    SET @i += 1;
END
SELECT 
    @upper AS Uppercase,
    @lower AS Lowercase,
    @digits AS Numbers,
    @others AS Others



select * from Student

select s.studentName, s.birthday from Student s 

where s.birthday in (
select birthday from student 
group by birthday having count(*) > 1)
group by s.StudentName, s.Birthday

select * from PlayerScores

SELECT 
    LEAST(PlayerA, PlayerB) AS Player1,
    GREATEST(PlayerA, PlayerB) AS Player2,
    SUM(Score) AS TotalScore 
	from PlayerScores
	group by   LEAST(PlayerA, PlayerB),  GREATEST(PlayerA, PlayerB)


--easy level tasks 

select * from TestMultipleColumns

select 
LEFT(name, CHARINDEX(',', name) - 1) as surname, 
Right(name, len(name) - CHARINDEX(',', name))
from TestMultipleColumns


select * from TestPercent

select * from TestPercent
where Strs like '%[%]%'


select * from Splitter

select 
left(vals, CHARINDEX('.', vals)-1) as vals1,
right(vals, len(vals) - CHARINDEX('.', vals)) as vals2
from Splitter 
where Vals like'%.%'


SELECT
  REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(
          REPLACE(
            REPLACE(
              REPLACE(
                REPLACE(
                  REPLACE(
                    REPLACE('1234ABC123456XYZ1234567890ADS',
                            '0', 'X'),
                        '1', 'X'),
                    '2', 'X'),
                '3', 'X'),
              '4', 'X'),
            '5', 'X'),
          '6', 'X'),
        '7', 'X'),
      '8', 'X'),
    '9', 'X') AS ReplacedString


select * from testDots

select * from testdots 

select Vals, LEN(vals) - len(replace(vals,'.', '') )  from testDots 
where LEN(vals) - len(replace(vals,'.', '') ) > 2

select * from CountSpaces

select texts, len(texts) - len(replace(texts, ' ', '')) from CountSpaces

select * from Employee

select e1.* from Employee e1 
join Employee e2 on e1.ManagerId = e2.Id
where e1.Salary > e2.Salary



select * from Employees

select first_name, LAST_NAME, EMPLOYEE_ID, HIRE_DATE, DATEDIFF(year, HIRE_DATE, GETDATE())from Employees

where datediff(year, hire_date, GETDATE())>10 and 
datediff(year, hire_date, getdate()) < 15

--medium level task 

declare @input varchar(50) = 'rtcfvty34redt'

declare @int int = substring(@input, charindex('34', @input), 2)

declare @txt varchar(50) = substring(@input, 1, charindex('34', @input) -1)

declare @txt2 varchar(50) = substring(@input, charindex('34', @input) +2,4) 

declare @txt3 varchar(50) = concat(@txt, @txt2)

select @txt3, @int


select * from weather

select * from weather w1 
join weather w2 on w1.RecordDate = dateadd(day, 1, w2.recordDate)
where w1.Temperature>w2.Temperature


select * from Activity

SELECT 
    Player_id,
    MIN(event_date) AS FirstLoginDate
FROM Activity
GROUP BY player_id


select * from fruits

select fruit_list from fruits


SELECT value AS ThirdFruit
FROM fruits
CROSS APPLY (
    SELECT CAST('["' + REPLACE(fruit_list, ',', '","') + '"]' AS NVARCHAR(MAX)) AS json_array
) AS x
CROSS APPLY OPENJSON(x.json_array)
WHERE [key] = 2


create table permanenttable (val varchar(50)) 

insert into permanenttable values ('s d g f h s d g f h s @ 1 2 1 3 1 3 1 3 1')

select * from permanenttable 
cross apply string_split(val, ' ')

select * from p1
select * from p2


SELECT 
    p1.id,
    CASE 
        WHEN p1.code = 0 THEN p2.code
        ELSE p1.code
    END AS code
FROM p1
JOIN p2 ON p1.id = p2.id

select * from Employees

SELECT 
        case
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) BETWEEN 1 AND 4 THEN 'Junior'
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) BETWEEN 5 AND 9 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) BETWEEN 10 AND 19 THEN 'Senior'
        ELSE 'Veteran'
    END AS employment_stage
FROM Employees

select * from GetIntegers

SELECT 
    SUBSTRING(Vals, 1, 
        CASE 
            WHEN PATINDEX('%[^0-9]%', Vals) > 0 
            THEN PATINDEX('%[^0-9]%', Vals) - 1 
            ELSE LEN(Vals)
        END
     ) AS ExtractedInteger
FROM GetIntegers

--difficult level tasks 

select * from MultipleVals

select
       SUBSTRING(Vals, 1, charindex(',', vals)-1), 
	   SUBSTRING(Vals,  charindex(',', vals)+1, CHARINDEX(',', vals,  charindex(',', vals)+1)-CHARINDEX(',', vals)-1)
	   from MultipleVals



select a.player_id, a.device_id, a.event_date from Activity a
join (
select player_id, MIN(event_date) min_a from Activity
group by player_id) b on a.player_id= b.player_id and a.event_date = b.min_a


select * from WeekPercentagePuzzle



select 
  a.FinancialWeek,
  a.Area,
  a.DayName,
  round((SalesLocal+ SalesRemote) * 100 / b.weeklyTotalSales, 2) as PerWeekPercentage
from WeekPercentagePuzzle a
join ( select FinancialWeek,
  SUM(SalesLocal + SalesRemote) as weeklyTotalSales
from WeekPercentagePuzzle
group by FinancialWeek) b on a.FinancialWeek = b.FinancialWeek

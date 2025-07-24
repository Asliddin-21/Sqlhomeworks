
Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

select * from Employee emp join employee man
on emp.managerId = man.id 
where emp.salary > man.salary

--3 

Create table  Person_ (id int, email varchar(255)) 

insert into Person_ (id, email) values ('1', 'a@b.com') 
insert into Person_ (id, email) values ('2', 'c@d.com') 
insert into Person_ (id, email) values ('3', 'a@b.com')

select * from Person_

SELECT email
FROM Person_
GROUP BY email
HAVING COUNT(*) > 1


--4 

DELETE FROM Person_
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person_
    GROUP BY email
);

select * from Person_

 --5 

 CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');


select * from Boys 
select * from Girls 




select distinct g.Parentname from girls g 
left join boys b on g.ParentName = b.ParentName
where b.ParentName is null 

--6 
use TSQL2012

select * from TSQL2012.Sales.Orders
select * from TSQL2012.sales.OrderDetails

select o.custid, 
sum(case when freight >50 then qty*unitprice else 0 end) Totalsales, 
min(o.freight) Minweight 
from TSQL2012.Sales.Orders o
join TSQL2012.sales.OrderDetails ord on o.orderid = ord.orderid
group by o.custid


--7

DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO


select isnull(Cart1.item, '') Cart1_item, 
       isnull(Cart2.item, '') Cart2_item 
from Cart1 
full join Cart2 on Cart1.item = cart2.item 
order by 1 desc 

--8 

Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

select c.name Customers from Customers c
left join Orders o on c.id=o.customerId
where o.id is null

--9 

Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
Truncate table Subjects
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
Truncate table Examinations
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')


Select st.student_id, st.student_name, sub.subject_name, 
count(e.student_id) attended_students

from Students st cross join Subjects sub
left join Examinations e 
on e.student_id = st.student_id and sub.subject_name = e.subject_name
group by st.student_id, st.student_name, sub.subject_name
order by 1,2

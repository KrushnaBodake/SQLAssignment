CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY identity(1,1),
	FIRST_NAME varchar(25),
	LAST_NAME VARCHAR(25),
	SALARY numeric(7,2),
	JOINING_DATE DATE,
	DEPARTMENT VARCHAR(25)
)

drop table Worker --drop table and schema but in database there are blank rows remaining
Truncate table Worker-- truncate delete all rows once and pointer goes on first rows
INSERT INTO Worker VALUES ( 'Monika', 'Arora', 10000, cast('2020-02-20' as date), 'HR')
INSERT INTO Worker VALUES( 'Monika', 'Arora', 10000, cast('2020-02-20' as date), 'HR')
INSERT INTO Worker VALUES( 'Niharika', 'Verma', 8000, cast('2011-06-11'as date), 'Admin')
INSERT INTO Worker VALUES( 'Vishal', 'Singhal', 30000,cast( '2020-02-20 'as date), 'HR')
INSERT INTO Worker VALUES( 'Amitabh', 'Singh', 50000, cast('2020-02-20 'as date), 'Admin')
INSERT INTO Worker VALUES( 'Vivek', 'Bhati', 50000, cast('2011-06-11 'as date), 'Admin')
INSERT INTO Worker VALUES( 'Vipul', 'Diwan', 20000, cast('2011-06-11 'as date), 'Account')
INSERT INTO Worker VALUES( 'Satish', 'Kumar', 75000, cast('2020-01-20 'as date), 'Account')
INSERT INTO Worker VALUES( 'Geetika', 'Chauhan', 90000, cast('2011-04-11 'as date), 'Admin')

CREATE TABLE Bonus (	
	BONUS_AMOUNT Numeric(7,2),
	BONUS_DATE DATE,
	WORKER_ID INT,
	Constraint FK_Worker Foreign key (WORKER_ID) references Worker(WORKER_ID)
)
INSERT INTO Bonus VALUES (5000, cast('2020-02-20' as date),1)
INSERT INTO Bonus values (3000, cast('2016-06-11' as date),2)
INSERT InTO Bonus values (4000, cast('2020-02-20'as date),3)
insert into Bonus Values (4500, cast('2020-02-20'as date),1)
insert into Bonus Values (3500, cast('2016-06-11'as date),2)


CREATE TABLE Title (
	WORKER_ID INT,
	WORKER_TITLE VARCHAR(25),
	AFFECTED_FROM DATE,
	Constraint FK_WorkerTitle Foreign key (WORKER_ID) references Worker(WORKER_ID)
)
INSERT INTO Title VALUES (1, 'Manager', cast('2020-02-20' as date))
insert into Title values (2, 'Executive', cast('2016-06-11'as date))
insert into Title Values (8, 'Executive', cast('2016-06-11 'as date))
insert into Title Values (5, 'Manager', cast('2016-06-11'as date))
insert into Title Values (4, 'Asst. Manager',cast( '2016-06-11'as date))
insert into Title Values (7, 'Executive', cast('2016-06-11'as date))
insert into Title Values (6, 'Lead',cast( '2016-06-11 'as date))
insert into Title values(3, 'Lead', cast('2016-06-11'as date))

select*from Worker
select*from Bonus
select*from Title

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>
select First_name as 'WorkerName' from Worker

-- Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
Select Upper(First_name) as 'WorkerName'from Worker 

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select Distinct ( Department) from Worker 

-- Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select SUBSTRING(First_Name,1,3) as 'WorkerName' from Worker

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.


--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(FIRST_NAME) From Worker

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select Ltrim(Department) from Worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select Distinct(len(Department))from  Worker

--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select Replace(First_Name,'a','A') as'After relapce' from Worker 

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. 
--      a space char should separate them.
Select CONCAT(First_Name,' ',Last_Name) as 'Complete_Name'From Worker

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
Select*from Worker 
order by First_Name 

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
--      Ascending and DEPARTMENT Descending.
Select*from Worker
order by First_Name,Department desc

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
Select *from Worker Where First_Name in ('Vipul','Satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select*from Worker Where First_Name not in ('Vipul','Satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
Select*from Worker Where Department='admin'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
Select *from Worker Where First_Name Like 'a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
Select *from Worker Where First_Name Like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
Select*from Worker Where First_Name Like '_____h'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 10000 and 50000.
Select*from Worker Where Salary Between 10000 and 50000

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
Select*from Worker Where year(Joining_Date) =2020 and month(Joining_Date)=2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
Select Count(Worker_id) as 'Total emp Count' from Worker where department='Admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 10000.
select First_name , salary from Worker where Salary  between 50000 and 100000
-- with Subquerry
select Concat(First_name,' ',Last_name) ,Salary  
from Worker 
where Worker_id in
(Select Worker_ID from Worker Where Salary  between 50000 and 100000)

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department, Count(Worker_id) as 'Total Count' from Worker 
group by department
order by Count(Worker_id) desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
select W.First_Name,t.WORKER_TITLE
from Worker w
inner join Title t on w.Worker_ID=t.Worker_ID and t.WORKER_TITLE in ('Manager')

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

--Q26. Write an SQL query to show only odd rows from a table.

--Q-27. Write an SQL query to show only even rows from a table.

--Q28. Write an SQL query to clone a new table from another table.
Select* into Workers from Worker
select*from Workers

--Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM Workers)

--Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Worker
MINUS
SELECT * FROM Title

--Q-31. Write an SQL query to show the current date and time.
Select CURRENT_TIMESTAMP

--Q-32. Write an SQL query to show the top n (say 10) records of a table.
select Top 10*from Workers

--Write an SQL query to determine the nth (say n=5) highest salary from a table.
Select salary from Worker
Order by salary desc
Offset 4 rows 
fetch next 1 rows only

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select salary from Worker where salary=(
select max(salary) from Worker where salary <(
select max(salary) from Worker where Salary <(
select max(salary) from Worker where salary <(
select max(salary) from Worker where Salary <
(select max(salary) from Worker)))))

--Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select w.*
from Worker w,Worker w1
Where w.Salary=w1.Salary 
and  w.Worker_id!=w1.Worker_id

--Q-36. Write an SQL query to show the second highest salary from a table.
Select Salary as 'Second Highest salary'from Worker
Order by Salary desc
Offset 1 rows
fetch next 1 rows only
-- OR

Select MAX(salary) from Worker Where salary <>
(select Max(Salary) from Worker)

--**Write an SQL query to show one row twice in results from a table.
Select  salary, Department from Worker Where Department='Admin'
Union All
Select  salary, Department from Worker Where Department='Admin'

--Q-38. Write an SQL query to fetch intersecting records of two tables.
Select *from Worker
Intersect
Select*from Workers

--Q-39. Write an SQL query to fetch the first 50% records from a table.
Select * from  Worker where Worker_id <=
(Select COUNT(worker_id)/2 from Worker)

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.
Select department, COUNT(Worker_id) as 'no of Worker' from Worker
Group by Department 
Having COUNT(Department)<5

--Q-41. Write an SQL query to show all departments along with the number of people in there.
select department,COUNT(Worker_id)as 'total People' from Worker
group by department

--Q-42. Write an SQL query to show the last record from a table.
select top 1*from Worker
order by Worker_id desc
--or
Select *from Worker where Worker_id=(
select count(Worker_id)from Worker)

--Q-43. Write an SQL query to fetch the first row of a table.
select top 1*from Worker
--or
Select*from Worker Where Worker_id=
(select min(Worker_id)from Worker)

--**Q-44. Write an SQL query to fetch the last five records from a table.
select Top 5*from Worker
order by Worker_Id desc, 



--**Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select department ,max(Salary)from Worker 
group by Department 

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary 
from
(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker 
group by DEPARTMENT) TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary

 -- Write an SQL query to fetch three max salaries from a table.
 Select Top 3* from Worker
 Order by Salary desc


 --47. Write an SQL query to fetch three min salaries from a table.
 select top 3*from Worker
 order by Salary

 --Q-48. Write an SQL query to fetch nth max salaries from a table.
 select max(salary) from Worker

 --Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 select department, sum(salary) as' Total Salary 'from Worker
 group by department

--Write an SQL query to fetch the names of workers who earn the highest salary.
select First_name,Salary from Worker Where salary =(
select max(salary) from Worker)



select*from Worker
order by salary
select*from Bonus
select*from Title


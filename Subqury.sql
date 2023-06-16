-- sub query
--emp who get less salary than avg salary of qa dept
select*from Employe
Select*from Dept

select e.esalary, e.ename from Employe e 
inner join Dept d on d.deptid=e.deptid
where   e.esalary< all(
select Avg(esalary) from employe where deptid=(
select deptid from dept Where deptname='QA'))
--OR
select ename from Employe where esalary <(
select AVG(esalary) from Employe where deptid=(
select deptid from Dept where deptname='QA'))


--select emp name and avg salay where departname is QA
select e.ename, AVG(e.esalary) as 'avg salary'
from Employe e
inner join Dept d on e.deptid=d.deptid
where d.deptname='QA'
group by e.ename

select Avg(esalary) from Employe
group by deptid
--Or
select  avg(e.esalary) from Employe e
where deptid=(
select deptid from Dept Where deptname='QA'
group by deptid)

--select the employee whose country is same as id 3
select ename from Employe where ecountry =
(select ecountry from Employe where eid=5)

select ename from Employe where ecountry=(
select ecountry from Employe where eid=3)

--display employee who get more salary than empid 11
select * from Employe where esalary>(
select esalary from Employe where eid=11)


--**display avg salary of all department 
select Avg(esalary) from Employe
group by deptid

--find the Employee who has less salary than the avg salary of that Dept
select * from Employe
where esalary < all(
select Avg(esalary) from Employe
group by deptid)

select deptid,avg(esalary) from Employe 
group by deptid


-- suquery with insert , update , delete
--add 20% hike to tht emp who work in QA 

update Employe set esalary=esalary+(esalary*0.20) where deptid=(
select deptid from Dept Where deptname='QA')

--insert with subquery
--insert products whose price is more than 1000
select*from Productt
select*from Orderr
truncate table orderr

insert into Orderr 
select id ,name,price 
from Productt where id in(
select id from productt where price>1000)

--delete
delete from Orderr where id in(
select id from productt where price>1000)


--**find the employe who has less salary than the avg salary of that dpartment
select * from Employe where esalary < all
(select avg(esalary) from Employe
group by deptid)


--find nth highest salary
select esalary from Employe e1
where 1=(
select count(distinct esalary) from employe e2
where e2.esalary>=e1.esalary)

--find 2nd max salary using max
select max(esalary) 
from Employe
Where esalary < 
(select max(esalary) from Employe)

select esalary from Employe
order by esalary desc
offset 1 rows
fetch next 1 rows only

--find nth highest salary without max 
select max(esalary) from Employe e1
where 1=(
select count(Distinct esalary)
from Employe e2
where e2.esalary>=e1.esalary)

select*from Employe 
order by esalary desc

--find nth lowest salary
select esalary from Employe e1
where 2=(
select count(distinct esalary) from Employe e2
where e2.esalary<=e1.esalary)


select distinct(esalary) from Employe
order by esalary desc

--find the no of employees working in each department
select deptid, count(eid) as ' no of employee' from Employe
group by deptid
-- OR
select deptname, 
(select count(eid)  from Employe where deptid=Dept.deptid) as 'Totalcount'
from Dept

--with join 
--find deptname where more than 2 emp works.
select d.deptname, count(*) as 'total employees' 
from Employe e
inner join Dept d on d.deptid=e.deptid
group by deptname
having count(*)>2

select d.deptname, d.deptid , count(*) as 'count'
from Employe e , Dept d
where e.deptid=d.deptid
group by d.deptname , d.deptid
having count(*)>2

select d.deptname , count(e.eid) as 'total emp'
from Employe e
inner join Dept d on d.deptid=e.deptid
group by deptname
having count(e.eid)>2

-- without join
--find deptname where more than 2 emp works.
select d.deptname, d.deptid , count(*) as 'count'
from Employe e , Dept d
where e.deptid=d.deptid
group by d.deptname , d.deptid
having count(*)>2

select d.deptname , count(e.eid) as 'count'
from Employe e,Dept d
where d.deptid=e.deptid
group by deptname
having count(e.eid)>2

--find duplicate rows in a table with single and multiple columns
-- count doesnt consider null 
select count(esalary) from Employe
select count(*) from Employe -- it count null values also

select eage, email ,count(*) as 'duplicate' 
from Employe
group by eage,email
having  count(*)>1

--Delete Duplicate rows in a table  using (Group by and having clause) and (Self Join)
--delete from  Employe where eid in 
-- (select  count(*) as 'duplicate' 
--from Employe
--group by email
--having  count(*)>1)

Delete e
from Employe e, Employe e1
where e.email=e1.email
and e.eid<e1.eid

-- swap value of male and female
select*from Employe

--if case
update Employe 
set eage= 
case eage 
     when '25' then '31'
	 End

update Employe 
set
eage=
case  eage
     when Null then 31
	 else 29
	 End

--join 
--find dept name where more than 2 emp works
select d.deptname, count(e.deptid) as 'emp count'
from Employe e
inner join Dept d on d.deptid=e.deptid
group by deptname
having count(e.deptid)>2

select d.deptname, avg(e.esalary) as 'avg salary'
from Employe e
inner join Dept d on d.deptid=e.deptid
group by d.deptname
having  avg(e.esalary)>30000

select*from Employe

--display dep name, managername,empname,esalary where salary in between 35000 and 90000
select d.deptname, m.managername,e.ename,e.esalary
from Employe e
inner join Dept d on d.deptid=e.deptid
inner join manager m on m.manid=e.manid
where e.esalary between 350000 and 90000

--find no of workers work in qa dept
select count(eid) from employe where deptid=
(select deptid from Dept where deptname='QA')

select d.deptname,count(e.eid)
from Employe e
inner join Dept d on d.deptid=e.deptid
group by d.deptname
having d.deptname='QA'

--Group By
--Display deptname except QA Dept where total salary of each department is greater than 17000
select deptname ,
(select sum(esalary) as 'totalsalary' from Employe where deptid=Dept.deptid and esalary>17000)
from Dept where deptname!='QA' 

-- OR
select d.deptname,sum(e.esalary)
from Employe e
inner join Dept d on d.deptid=e.deptid
where deptname !='QA'
group by deptname
having sum(e.esalary)>17000

--department with total salary
select d.deptname , sum(e.esalary)
from employe e 
inner join Dept d on d.deptid=e.deptid
group by d.deptname 
having sum(e.esalary)>100000


-- Self join --> select manger and employe from same table
select e.ename as 'employee' ,m.ename as 'manager'
from Employe e, Employe m
where m.eid=e.manid and e.ename='abd'



--mock
select*from Student
select*from Trainer
select*from Course

insert into Student Values(201,'Tushar','BE',cast('1995-01-10' as date),102,'3',5000,'No','No')

select s.sname
from Student s
inner join Course c on c.courseid=s.courseid
where coursename='Design'
--delte trainer 

delete from Trainer 
where trainerid =(
select t.trainerid
from Student s 
inner join Course c on c.courseid=c.courseid
inner join Trainer t on t.trainerid=c.trainerid
group by t.trainerid
having count(s.rollno)=3
)

select * from employe where esalary<all
(select AVg(esalary) from Employe 
 group by deptid)

 select max(esalary) from employe where esalary<
 (select max(esalary) from Employe)

 select * from Employe
 order by esalary desc
________________________________________________________________________________________________________________
_________________________________________IMP____________________________________________________________________
 --ALTER TABLE DROP COLUMN failed because 'birthday' is the only data column in table 'Persons'. 
		--A table must have at least one data column.
--rename the column in sql server
sp_rename 'Employee.empname' , 'ename'

select deptname, deptid,
(select count(eid)  from Employe where deptid=Dept.deptid) as 'Totalcount'
from Dept


SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary 
from
(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker 
group by DEPARTMENT) TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
and TempNew.TotalSalary=t.Salary

select *from Employe

select d.deptid ,d.deptname,res.totalsalary from Dept d,
(Select e.deptid,sum(e.esalary) as 'totalsalary'
from Employe e
group by e.deptid) res
where res.deptid=d.deptid

** Update query with Join
update Employee set salary=salary+(10 *salary)/100
from Employee e left join Dept d on e.deptid=d.deptid
where d.deptname='Development'

update Employee set salary=salary+(10 *salary)/100 where deptid=(select deptid from Dept where deptname='Development')



-- if column Contain null value we can not compare using operator
--is null
-- is not null
Select*from Employe
select*from Dept
update Employe set ecountry =null where eid=1

-- offset fetch select & top order by
select*from Employe
order by esalary
offset 3 rows
fetch next 3 rows only

-- Display 2nd 3rd 4th highest salary
select*from Employe
order by esalary desc
offset 1 rows
fetch next 3 rows only

-- find first 3 highest salary
Select Top 3 *from Employe
order by esalary desc

-- find first 3 lowset salary
select top 3 *from Employe
order by esalary 

-- Display 3rd 4th & 5th lowest salary
select*from Employe
order by esalary
offset 2 rows
fetch next 3 rows only


select * from Employe where ecountry is not null
select*from Employe where ecountry is null

--Order by
-- Sort the records either in asending or desending order

select*from Employe order by ename 
select *from Employe order by ename desc
select*from Employe order by esalary desc
select*from Employe order by eage, ename
select*from employe order by eage,ename desc
select*from employe order by eage,ename desc 

-- Inner join 
select*from Employe
select*from Dept
select e.*,d.deptname
from Employe e
inner join Dept d on d.deptid=e.deptid



select Employe.ename,Employe.eid, dept.deptname
from Employe
inner join Dept on dept.deptid=Employe.deptid

select e.*, d.deptname
from Employe e
left join Dept d on d.deptid=e.deptid

select e.*,d.deptname
from Employe e
Right join Dept d on d.deptid=e.deptid

select e.*,d.deptname
from Employe e
full join Dept d on d.deptid=e.deptid

select e.*,d.deptname from Employe e
left join Dept d on d.deptid=e.eid

select e.*,d.deptname from Employe e 
right join Dept d on d.deptid=e.eid

select e.*, d.* from Employe e  
full join Dept d on d.deptid=e.eid

alter table employe add managerid int

update Employe set managerid=2 where eid in(3,4)
update Employe set managerid=5 where eid in (6,7,8)
update Employe set managerid=9 where eid in(10,11,12)
update Employe set managerid=13 where eid in (14)

select emp.ename as 'employee' , man.ename as 'manager'
from Employe emp, Employe man
where man.eid=emp.managerid and emp.ename='Satya'

create table Product(
pname varchar(10) not null,
pprice numeric(10,2) not null
)
select*From Product
select*from Size
Select*from Colour

create table Size(
psize int not null
)


create table Colour(
pcolour varchar(10) not null
)

insert into Product values('T-shirt',400)
insert into Product values('shirt', 1200)
delete from Product where pprice=1200

insert into Size values(32)
insert into Size values(34)
insert into Size values (36)

insert into Colour values('red')
insert into Colour values ('white')
insert into colour values ('Green')

select*from Product cross join Size cross join Colour


Select AVG(esalary) as 'Avg salary' from Employe
select min(esalary) as' min salary' from Employe

Select max(esalary) as 'max Salary' from Employe
select count(esalary) as' count salary' from Employe



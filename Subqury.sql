-- sub query
--emp who get less salary than avg salary of qa dept
select*from Employe
Select*from Dept
select ename from Employe where esalary <(
select AVG(esalary) from Employe where deptid=(
select deptid from Dept where deptname='QA'))


select e.ename, AVG(e.esalary) as 'avg salary'
from Employe e
inner join Dept d on e.deptid=d.deptid
where d.deptname='QA'
group by e.ename

--select the employee whose countery is same as id 3
select ename from Employe where ecountry =
(select ecountry from Employe where eid=5)

--display employee who get more salary than empid 11
select ename,esalary from Employe where esalary>
(select esalary from employe where eid=11)

--**display avg salary of all department 
select Avg(esalary) from Employe
group by deptid


--**find the employe who has less salary than the avg salary of that dpartment
select * from Employe where esalary < all
(select avg(esalary) from Employe
group by deptid)

--find nth highest salary
--find max salary using max
select max(esalary) 
from Employe
Where esalary < 
(select max(esalary) from Employe)

select esalary from Employe
order by esalary desc
offset 1 rows
fetch next 1 rows only

--find nth salary without max 
select esalary from Employe e1
where 2=(
select count(Distinct esalary)
from Employe e2
where e2.esalary>=e1.esalary)

select esalary from Employe e1
where 2=(
select count(distinct esalary)
from Employe  e2
where e2.esalary>=e1.esalary)

select distinct(esalary) from Employe
order by esalary desc

--find the no of employees working in each department
select deptid, count(eid) as ' no of employee' from Employe
group by deptid

--with join 
select d.deptname, count(*) as 'total employees' 
from Employe e
inner join Dept d on d.deptid=e.deptid
group by deptname
having count(*)>2

-- without join
select d.deptname, d.deptid , count(*) as 'count'
from Employe e , Dept d
where e.deptid=d.deptid
group by d.deptname , d.deptid
having count(*)>2

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

update Employe 
set eage= case eage 
     when '25' then '31'
	 End

update Employe 
set
eage=
case  eage
     when 25 then 31
	 else 29
	 End









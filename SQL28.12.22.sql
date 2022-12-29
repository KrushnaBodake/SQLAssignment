create table Dept(
deptid int primary key,
deptname varchar(20)
)

create table Employe(
eid int primary key,
ename varchar(10)not null,
esalary numeric(10,2) not null,
eage int check(eage>18),
ecountry varchar(10) default 'India',
deptid int foreign key references Dept(deptid)
)
sp_help Employe

select*from Employe
select*from Dept

insert into Dept values (1,'HR')
insert into Dept values (2,'QA')
insert into Dept values(3,'Production')
insert into Dept values (4,'Purchase')
insert into Dept values (5,'Maintanance')
insert into Dept values (6, 'Assembly')
insert into Employe (eid,ename,email,eage,deptid) values (1,'John','john3@gmail.com',23,1)
insert into Employe values (2,'Vicky','vicky12@gmail.com',25,'UK',2)
insert into Employe values (3,'Holl','holl34@gmail.com',20,'USA',3)
insert into Employe values (4,'Tim','Tim812@gmail.com',22,'UK',4)
insert into Employe values (5,'Ajay','Ajay88@gmail.com',27,'India',5)
insert into Employe values (6,'Jacky','Jacky42@gmail.com',28,'China',6)
insert into Employe values (7,'Satya','satyya@gmail.com',35,'India',2)
insert into Employe values (8,'Sam','sam55@gmail.com',23,'UK',6)
insert into Employe values (9,'Navin','Navin612@gmail.com',29,'India',1)
insert into Employe values (10,'ABD','abd45@gmail.com',29,'RSA',2)
insert into Employe values (11,'Smith','SmitStiv@gmail.com',25,'WI',5)
insert into Employe values(12,'Ken','kenW34@gmail.com',22,'NZ',4)
insert into Employe values(13,'Tailor','rostailor@gmail.com',22,'NZ',3)
insert into Employe values(14,'Shakib','shakib@gmail.com',26,'BAN',6)

alter table Employe add esalary decimal
update Employe set esalary=23000 where eid=1
update Employe set esalary=15000 where eid=2
update Employe set esalary=15000 where deptid=4
update Employe set esalary=25000 where eid=3
update Employe set esalary=18000 where eid=5
update Employe set esalary=70000 where eid=6
update Employe set esalary=50000 where eid=7
update Employe set esalary=15500 where eid=8
update Employe set esalary=13500 where eid=9
update Employe set esalary=45859 where eid=10
update Employe set esalary=30000 where eid=11
update Employe set esalary=60000 where eid=13
update Employe set esalary=35000 where eid=14

--DQL Select
select *from Employe
select email,eage,esalary from Employe where deptid=1
select *from Employe where esalary<30000
select *from Employe where esalary Between 10000 and 90000
select ename from Employe where eid=1
select email from Employe
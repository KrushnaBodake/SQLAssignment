-- Select Commands to run Perticular query.

create table Employee(
empid int,
empname varchar,
empsalary int
)

-- alter to modify the data type or its size
alter table Employee alter column empname varchar(40)
alter table Employee alter column empsalary numeric(10,2)

--rename the column in sql server
sp_rename 'Employee.empname' , 'ename'

-- drop the column in the table
alter table Employee drop column ename

--add new column in the table
alter table Employee add ename varchar(20)

sp_help Employee

create table Person(
pid int,
pname varchar(20),
pincome numeric(10,2),
)
create table PersonAccount(
pid int,
pname varchar(20),
pincome numeric(10,2),
)
-- Add Primary key
alter table person alter column pid int not null
alter table Person add constraint pk_person primary key(pid)
alter table Person alter column pname varchar(40)
alter table Person drop column pincome
alter table Person add pincome numeric(10,2)

-- Add foreign key
alter table PersonAccount add constraint fk_personid foreign key(pid) references Person(pid)

sp_rename 'Person.pincome','personincome'
sp_help Person

create table Dept(
deptid int primary key,
deptname varchar(20)
)

create table Employe(
eid int primary key,
ename varchar(10)not null,
email varchar(20)unique,
eage int check(eage>18),
ecountry varchar(10) default 'India',
deptid int foreign key references Dept(deptid)
)
sp_help Employe

create table Store(
storeno int primary key,
storename varchar(20)
)

create table Customer(
cusid int primary key,
cusname varchar(20)not null,
cusmobileno int unique,
custype varchar(10) default 'regular',
storeno int foreign key references Store(storeno)
)
sp_help store
sp_help Customer
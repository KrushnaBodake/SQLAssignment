--
create table Students(
sid int primary key identity(1,1),
sname varchar(30),
scity varchar(30),
)
insert into Students Values('Ram','Pune')
insert into Students Values('Sham','Mumbai')
insert into Students Values('Sita','Pune')
insert into Students Values('Gita','Nashik')


create table Subjects(
subid int primary key identity(1,1),
subname Varchar(30),
maxmarks int ,
passingmarks int 
)
insert into Subjects Values('Maths',100,40)
insert into Subjects Values('English',100,40)
insert into Subjects Values('Marathi',50,15)
insert into Subjects Values('Hindi',50,15)

create table Exam(
sid int
constraint fk_sid foreign key (sid) references Students(sid),
subid int
constraint fk_subid foreign key (subid) references Subjects(subid),
marks int
)
insert into Exam Values (1,1,100)
insert into Exam Values (1,2,85)
insert into Exam Values (1,3,40)
insert into Exam Values (1,4,45)
insert into Exam Values (2,1,35)
insert into Exam Values (2,2,55)
insert into Exam Values (2,3,25)
insert into Exam Values (3,1,95)
insert into Exam Values (3,2,87)
insert into Exam Values (3,3,45)
insert into Exam Values (3,4,42)

select*from Students
select*from Subjects
select*from Exam

--insert new stud (sid=5, name=Ramesh,city=Hyderabad) into Students table.
insert into Students Values('Ramesh','Hyderabad')

--2. Change City of SID=4 Gita to Sangli.
update Students set scity='Sangli' where sid=4

--3. Return list of all Students with col sid, name and city
select sid, sname,scity
from Students

--d. return list containing col sid, name, sbuname,marks,maxmarks,percentage
select s.sid,ss.subname,s.sname,e.marks,ss.maxmarks,((e.marks*100)/ss.maxmarks) as percentage
from Students s
inner join Exam e on e.sid=s.sid
inner join Subjects ss on ss.subid=e.subid

--e. return list containing col sid,name,Subname,Marks,maxmarks,pass(return "p" if student has passed, "f" for fail)
select s.sid,s.sname,ss.subname,e.Marks,ss.maxmarks,
case
when e.marks>=ss.passingmarks then 'P'
when e.marks<=ss.passingmarks then 'F'
end as 'Result'
from students s
inner join Exam e on e.sid=s.sid
inner join Subjects ss on ss.subid=e.subid

--f. return list containing col sid,sname,subname of students who were absent for the exam



--g. Return sub list with name of just the student who came first in that subject along 
--   with his/her marks,subid,subname,name,marks,maxmarks
select ss.subname,s.sname,e.marks,ss.subid,ss.maxmarks
from Students s
inner join Exam e on e.sid=s.sid
inner join Subjects ss on ss.subid=e.subid
where e.marks in(
select max(marks)
from Exam 
where Exam.subid=ss.subid)




--h. Return sub list with count of students who attempted the exam and count of students who passed the exam
--   -SubId ,subname,Attemtcount,passCount
select subname, count(sid) 


--i. Return total percentage of students with column sid, name,total marks,total maxmarks,Percentage

--j. How would you generate an output showing the list of all students in the first column and 
--   list of subjects as colmns with the marks obtained by each student populated in the appropriate cell


select*from Employe
Select*from Dept

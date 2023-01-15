Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
Course – course id , course name, duration (in months), trainer id , total fees
Trainer – Trainer id , trainer name , join date , email , experience in years 

create table Trainer(
trainerid int Primary key,
trainername varchar(20),
joindate Date ,
experience int
)

insert into Trainer Values (1, 'Rahul',cast('2017-07-20' as date) ,10)
insert into Trainer Values (2, 'Abhijit',cast('2015-06-15' as date) ,6)

select*from Trainer
select*from Course
Create table Course(
courseid int primary key,
coursename varchar(20),
duration int,
trainerid int,
Constraint fk_trainer foreign key (trainerid) references Trainer(trainerid)
)
alter table Course add constraint notnull_fees unique (totalfees)
alter table Course alter column totalfees int not null
alter table course add totalfees1 int 
alter table course drop column totalfees1
delete from Course where totalfess=Null

update Course set totalfees=10000 where courseid=101
update Course set totalfees=10000 where courseid=102
update Course set totalfees=10000 where courseid=103
update Course set totalfees=20000 where courseid=101


insert into Course values (101,'PowerEngine',3,1)
insert into Course values (102,'Design',4,2)
insert into Course values (103,'softwaretesting',1,2)



Create table Student (
rollno int primary key,
sname varchar(30),
degree varchar(20),
birthdate date,
courseid int,
Constraint fk_course foreign key (courseid) references Course(courseid),
batchid int,
feespaid numeric (10,2),
remark varchar(10),
isplaced varchar(10)
)
select*from student
insert into Student Values (200,'krushna','B.E',cast('1997-12-19' as date),101,1,10000,'pais','no')
insert into Student Values (201,'Pratik','B.E',cast('2000-10-15' as date),102,2,20000,'no','yes')
insert into Student Values (202,'Ganesh','B.E',cast('1996-08-10' as date),101,2,20000,'no','no')
insert into Student Values (203,'Tushar','B.E',cast('1995-04-16' as date),103,1,20000,'no','no')


--1. Show list of students. List contains roll no , student name , course name , trainer name in order of course name and student name.
select s.rollno,s.sname,c.coursename,t.trainername
from Student s
inner join Course c on c.courseid=s.courseid
inner join Trainer t on t.trainerid=c.trainerid


--2. Show list of students who have pending fees more than 1000rs . List should have student
--name , course name , balance fees . Show this list in descending order of balance fees.



--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.


--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.
update student set remark='Eligible' where remark='pais'
select*from Student


--5. Create a index to make retrieval faster based on course name.
create index in_course on course (coursename)
select*from Course


--6. List name of course for which more than 20 students are enrolled.
select c.coursename ,count(s.courseid)as 'enrolled stu for sam course'
from student s
inner join course c on c.courseid=s.courseid
group by c.coursename
having count(s.courseid)>1

select*from course

--**7. List name of course for which maximum revenue was generated. ( max fee collection)
select coursename from Course where totalfees in 
(select totalfees from Course )

--8. Select name of student who are in same batch as ‘krushna’.
select sname from student where courseid=(
select courseid from student where sname='krushna')

--9. Delete all students who are in course which is less than 2 months duration.
delete from student where courseid =(
select courseid from course where duration<2)
select*from student

--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from student where isplaced='yes' and feespaid=20000
select*from student

--11. Create a trigger to add student data in ex-student table if student is deleted from student table.


--12. Create a view which shows name of trainer and number of students he is training.
select t.trainername,count(s.rollno) as 'no of students'
from Student s
inner join Course c on c.courseid=s.courseid
inner join Trainer t on t.trainerid=c.trainerid
group by t.trainername


--13. Show names of students who are more than 20 years old.
select sname from Student
where birthdate < cast('2003-01-01' as date)

--14. Show names of students who have paid all the fees.
select sname from Student where remark='Eligible'

--15. Write a procedure which accepts student id and returns his balance fees. 
create proc SP_GetBalance(@rollno int)
as begin
select*from Student where rollno=@rollno
return
end

exec SP_GetBalance
@rollno=200

-- In built Functions
-- Substring
Select *from Employe

select SUBSTRING(ename,2,2) as' empname' from Employe

-- Concate two Columns
select CONCAT(ename,' : ',email) as 'emp details' from Employe
--len
select email,len(email) as 'emp email' from Employe
select email, len(email) as 'length of mail' from Employe Where len(email)>15
--Upper and Lower
select UPPER(ename) ,Lower(email) from Employe
--Trim --> LTRIM --> RTRIM
select LTrim(ename) from Employe
--Reverse
select REVERSE(email) from Employe
--round
select round(esalary,2) from Employe

select CURRENT_TIMESTAMP
select cast(CURRENT_TIMESTAMP as date) as 'todays date'
select cast(Getdate() as time) as 'Current Time' 

select cast(esalary as varchar(20)) as 'String Salary' from Employe

-- isnull -> found any null value replace with new word
select ename,ISNULL(ecountry,'NA') as 'Country' from Employe
--product price qty total
 select isnull(esalary,1000), ISNULL(qty,'NA'), price *(isnull(qty,1))

--User defined Functions
create function Addition(@a int, @b int)
returns int 
as begin
declare @Sum int
Set @Sum=@a+@b
return @Sum
End

Select dbo.Addition(23,77) as 'Sum'

Create function GetEmpNameById(@id int)
returns Varchar(20)
as begin 
return(select ename from Employe Where eid=@id)
end

Select dbo.GetEmpNameById(2) as 'ename'

Create function GetEmpDetails(@id int)
returns table
as
return (select*from Employe Where eid=@id)

select*from dbo.GetEmpDetails(2) 

Create function GetEmpByDept(@id int)
Returns Table
As
return(Select *from Employe Where deptid=@id)

Select*from dbo.GetEmpByDept(6)

--
create function GetEmpOldNewSalary(@esalary numeric(10,2))
Returns numeric(10,2)
as begin
declare @NewSalary numeric(10,2)
Set @NewSalary=@esalary+(@esalary*0.15)
return @NewSalary
end

Select ename ,esalary as 'old salary', dbo.GetEmpOldNewSalary(esalary) as 'New Salary' from Employe


-- Stored Procedure
Create Proc SP_GetEmpByDepid(@did int)
as begin
Select*from Employe Where deptid=@did
return
end

Exec SP_GetEmpByDepid
@did=2

Select*from Employe



--Insert 
Create Procedure SP_InsertEmployee(
@eid int ,
@ename varchar(10),
@esalary numeric(10,2),
@email varchar(20),
@eage int,
@ecountry varchar(10),
@deptid int,
@mangerid int)
as begin
Insert into Employe Values(@eid,@ename,@esalary,@email,@eage,@ecountry,@deptid,@mangerid)
return
end

Exec SP_InsertEmployee 
@eid=15,
@ename='Krushna' ,
@esalary=11000,
@email ='bodkekrushna@gmail.com(20)',
@eage=25,
@ecountry='India',
@deptid=1,
@mangerid =1

Create Procedure SP_UpdateEmpDetailss(
@eid int ,
@ename varchar(10),
@esalary numeric(10,2),
@email varchar(20),
@eage int,
@ecountry varchar(10),
@deptid int,
@mangerid int)
as begin
Update Employe set ename=@ename,esalary=@esalary,eage=@eage,ecountry=@ecountry,deptid=@deptid,managerid=@mangerid Where eid=@eid
return
end

Exec SP_UpdateEmpDetailss
@eid=15,
@ename='Krushna1' ,
@esalary=11000,
@email ='bodkekrushna@gmail.com(20)',
@eage=25,
@ecountry='India',
@deptid=1,
@mangerid =1

SP_Help Employe
Create Procedure SP_DeleteEmpDetails(
@eid int
)
as begin
Delete from Employe Where eid=@eid
return
end

exec SP_DeleteEmpDetails
@eid=2





--Triggers
Create table EmpLog(
logid int primary key identity(1,1),
description varchar(500)
)
select*from EmpLog
Select*from Employe

--**Insert Trigger
Create trigger tr_Insert_Emp
on Employe for Insert
as begin
declare @eid int
select @eid=eid from inserted
insert into EmpLog Values ('new record with id '+cast(@eid as varchar(10))+
'added at '+cast(getdate() as varchar(30)))
end

Create trigger tr_Insert
on Employe for insert
as begin
declare @ename varchar(20)
select @ename=ename from inserted
insert into EmpLog values('new record inserted at'+ cast (GETDATE() as varchar(30)) + 'By Eid'+ cast(@ename as varchar(10)))
end

insert into Employe Values( 17,'Prakash',20000,'prakash@gmail.com',19,'India',2,1)

--Delete Trigger
Create trigger tr_Delete_emp
on Employe for delete
as begin
declare @eid int
Select @eid=eid from deleted
insert into EmpLog Values('Exiting recors with id'+ cast(@eid as varchar(10))+
'Removed at'+ cast(getdate() as varchar(30)))
end

create trigger tr_Delete
on Employe for Delete
as begin
declare @eid int 
select @eid=eid from deleted
insert into EmpLog values('delete record at '+ cast(GETDATE() as varchar(20))+' by id '+cast(@eid as varchar(20)))
end

Delete from Employe Where eid=15

--Update Triggers
create trigger tr_emp_Update
on Employe for Update
as begin
select *from deleted
select*from inserted
end

update Employe set ename='Pinky' , eage=21, esalary=40000 where eid=2








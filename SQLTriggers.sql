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

insert into Employe Values( 16,'Prakash',20000,'prakash@gmail.com',19,'India',2,1)

--Delete Trigger
Create trigger tr_Delete_emp
on Employe for delete
as begin
declare @eid int
Select @eid=eid from deleted
insert into EmpLog Values('Exiting recors with id'+ cast(@eid as varchar(10))+
'Removed at'+ cast(getdate() as varchar(30)))
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

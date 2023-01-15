-- master database
create table AwardsMaster (
awardType_id int primary key,
award_name varchar(20),
award_price numeric(10,2)
)
insert into AwardsMaster Values (1,'Akademi Award',2000)
insert into AwardsMaster Values (2,'A Award',3000)
insert into AwardsMaster Values (3,'Book of century',5000)
insert into AwardsMaster Values (4,'Book of year',5000)
insert into AwardsMaster Values (5,'Book of decade',4000)

select*from  AwardsMaster

create table Author1(
author_id int primary key,
author_name Varchar(30),
Ph_no varchar(15),
email varchar(35),
author_address Varchar(40),
city varchar(15)
)
insert into Author1 values(1,'R.K Narayan', '8600416072', 'rknarayan@gmail.com' ,'malgudi india' ,'malgudi')
insert into Author1 values(2,'Raj Anand', '8600416073', 'rajanand@gmail.com' ,'walandi maharashtra' ,'Deoni')
insert into Author1 values(3,'Anne Frank', '9600416073', 'annefrank@gmail.com' ,'halfar Netherland' ,'Nether')
insert into Author1 values(4,'bak hank', '7600416073', 'baknahk@gmail.com' ,'Wajai ' ,' sakol')
insert into Author1 values(5,'Chetan bhagat', '7800416073', 'chetan@gmail.com' ,'vallabhnagar ' ,' Delhi')

select*from Author1


Create table Book1(
book_id int primary key,
book_name Varchar(20) not null,
author_id int,
Constraint fk_Auth Foreign key (author_id) references Author1(author_id),
price numeric(10,2) not null,
published_date Date not null
)
insert into Book1 Values(1,'The Guide', 1, 140, cast('2020-02-20' as date))
insert into Book1 Values(2,'The private life', 2, 140, cast('2019-03-11' as date))
insert into Book1 Values(3,'Diary of Ann Frank', 3, 140, cast('2020-04-15' as date))
insert into Book1 Values(4,'Diary of bak', 4, 300, cast('2015-04-15' as date))
insert into Book1 Values(5,'Five Points', 5, 200, cast('2004-04-25' as date))
insert into Book1 Values(6,'The life', 1, 140, cast('2020-02-20' as date))

select*from Book1

create table Award1(
award_id int primary key,
awardType_id int ,
Constraint fk_AwardsMaster Foreign key (awardType_id) references AwardsMaster(awardType_id),
author_id int,
Constraint fk_Autho Foreign key (author_id) references Author1(author_id),
book_id int,
Constraint fk_Book1 Foreign key (book_id) references Book1(book_id),
Award_year int
)
insert into Award1 values(1,1,1,1,2021)
insert into Award1 values(2,2,2,2,2020)
insert into Award1 values(3,3,3,3,2022)
insert into Award1 values(4,4,4,4,2018)
insert into Award1 values(5,5,5,5,2005)

select*from Award1



--1.Write a query to show book name , author name and award name for all books which has received any award. 
select b.book_name,a.author_name,m.award_name
from Book1 b 
inner join Author1 a on a.author_id=b.author_id
inner join Award1 a1 on a1.author_id=a.author_id
inner join AwardsMaster m on m.awardType_id=a1.awardType_id
 


--2.Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
update Author1 set author_name= concat('Honourable',' ', author_name)  
where author_id in(
select author_id from Book1
Where price >100)

--3.Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
select a.author_name, count(book_id) as 'no of books'
from Author1 a
inner join Book1 b on b.author_id=a.author_id
group by a.author_name
order by count(book_id) desc


--4.	Write a query to select book name with 5 th highest price.
select book_name from Book1
order by price desc
offset 1 rows
fetch next 1 rows only


--5.	Select list of books which have same price as book ‘Diary of Ann Frank’.
select book_name from Book1 where price=140
(select price from Book1 Where book_name='Diary of Ann Frank')

--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.
update Book1 set price=price+(price*0.05)
from Book1 b
inner join Author1 a on a.author_id=b.author_id
where author_name='Chetan bhagat'

--7.	Show award names and number of books which got these awards.
select award_name , count(awardType_id)as 'no of books' 
from  AwardsMaster 
group by award_name

--8.	Delete all books written by ‘Chetan Bhagat’ 
delete from Book1 where author_id in
(select author_id from Author1 where author_name='Chetan bhagat')

--9.Create view to show name of book and year when it has received award. 
create view yearwise_award
as
select Book_name , Award_year 
from Book1 b
inner join Award1 a on a.book_id=b.book_id

--10.	Create trigger to ensure min price of any book must be Rs. 100. 


--11.Increase price of book by 10% if that book has received any award.
update Book1 set price=price+(price*0.1)
from Book1 b
inner join Award1 a on a.award_id=b.author_id
where award_id in(
select award_id from Award1 )

--12.	Show names of author and number of books written by that Author.
select a.author_name, count(book_id) as 'total Books'
from Book1 b
inner join Author1 a  on b.author_id=a.author_id
group by a.author_name
 

--13.	Show names of authors whose books are published before year 2020.
select a.Author_name 
from Author1 a
inner join Book1 b on b.author_id=a.author_id
Where b.published_date < cast('2020-01-01' as date)

select *from  Author1

--**14. Show name of books which has published within 1 year after 15 August 2020.
select book_name 
from Book1 
where published_date between cast('2020-08-15' as date) and cast('2021-08-15' as date)


--15. Delete all authors whose no book is published in year 2020.
 Delete from Author1
 where author_id in
 (select author_id from Book1 where year(cast( published_date as date)) not in (year(cast('2020' as date) )))






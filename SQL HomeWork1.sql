
create table Products(
prodid int primary key,
prodprice numeric (10,2)
)
alter table Products add prodname varchar(10) 
update Products set prodname='pizza' where prodid=23
update Products set prodname='Goulash' where prodid=25

insert into Products values(11,14)
insert into Products values(22,16)
insert into Products Values(23,18)
insert into Products Values (25,20)

create table Customer(
custid int primary key,
custname varchar(10) not null,
custcity varchar(10) ,
custcountry varchar(10) default 'india'
)
alter table Customer add postalcode varchar(10)
insert into Customer (postalcode) values (121110 )
Update Customer set postalcode=121113 where custid=23

alter table Customer drop column custadd 

insert into Customer values(21,'Sam','berlin','Germany')
insert into Customer values (22,'ken','london','England')
insert into Customer values(23,'David', 'norvay','Europe')
insert into Customer values (24,'Smith', 'france','Europe')
insert into Customer values (25,'Ross','norway','Europ','121114')

select*from Products
select*from Customer


--Q1.  Write a statement that will select the City column from the Customers table
   select custcity from Customer

--Q2 Select all the different values from the Country column in the Customers table.
    select distinct custcountry from Customer

--Q3. Select all records where the City column has the value "London
     select*from Customer
	 where custcity='London'

--Q4.Use the NOT keyword to select all records where City is NOT "Berlin".
    select * from Customer
	where custcity not in ('berlin')

--Q5 Select all records where the CustomerID column has the value 23.
     select*from Customer
	 where custid=23

--Q6. Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
    select*from Customer
	where custcity='Berlin'and postalcode='121110 '

--Q7.	Select all records where the City column has the value 'Berlin' or 'London'.
       select *from Customer
	   where custcity in ('London','berlin')

--Q8.	Select all records from the Customers table, sort the result alphabetically by the column City.
        select*from Customer
		order by custcity

--Q9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
        select*from Customer
		order by custcity desc

--Q10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
        select*from Customer
		Order by custcountry, custcity 

--Q 11.	Select all records from the Customers where the PostalCode column is empty.
       select*from Customer where postalcode is null

--Q12.	Select all records from the Customers where the PostalCode column is NOT empty.
       select*from Customer 
	   where postalcode is not null

--Q13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
        update Customer set custcity='Oslo' where custcity='norway'

--Q14.	Delete all the records from the Customers table where the Country value is 'Europ'.
        delete from Customer where custcountry='Europ'
				
--Q15.	Use the MIN function to select the record with the smallest value of the Price column.
        select MIN (prodprice) as 'smallest value'from Products

--Q16.	Use an SQL function to select the record with the highest value of the Price column.
        select max (prodprice) as 'high value' from Products

--Q17.	Use the correct function to return the number of records that have the Price value set to 20
        select COUNT(prodprice) as'20 count' from Products 
		where prodprice=20

--Q18.	Use an SQL function to calculate the average price of all products.
        select AVG(prodprice) as 'prod price' from Products

--Q19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
       select Sum(prodprice) as 'Sum product' from Products
        
--Q20.	Select all records where the value of the City column starts with the letter "a".
       select *from Customer where custcity like 'a%'

--Q21.	Select all records where the value of the City column ends with the letter "a".
       select*from Customer 
	   where custcity like '%a'

--22.	Select all records where the value of the City column contains the letter "a".
        select*from Customer
		where custcity like '%a%'

--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
        select*from Customer
		where custcity like 'a%b'

--24.	Select all records where the value of the City column does NOT start with the letter "a".
        select *from Customer
		where custcity not like 'a%'

--25.	Select all records where the second letter of the City is an "a".
        select*from Customer
		where custcity like  '_o%'

--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
        select*from Customer
		where custcity like '[acs]%'

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
        select*from Customer
		where custcity like '[a-f]%'

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
        select*from Customer
		where custcity not like '[acf]%'
--29.	Use the IN operator to select all the records where the Country is either "Norway" or "France".
        select*from Customer
		where  custcountry in ('norway','france')

--30.	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
        select*from Customer
		where custcountry not in ('norway','france')

--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
        select*from Products
		where prodprice between 10 and 20

--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
        select*from Products
		where prodprice not between 10 and 15

--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
        select*from Products
		where prodname between 'Geitost' and 'Pavlova'
		order by prodname

--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
        select c.*,c.postalcode as 'Pno'
		from Customer c

--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.
        select Consumers.*
		from Customer Consumers

--36.	List the number of customers in each country.
       select custcountry ,Count(custid) as 'Total cus'
	   from Customer
	   group by custcountry

--37.	List the number of customers in each country, ordered by the country with the most customers first.
        select custcountry , count(custid) as 'Total Customer'
		from Customer
		group by custcountry
		order by [Total Customer] desc

--38.	Write the correct SQL statement to create a new database called testDB.
        create database testDB

--39.	Write the correct SQL statement to delete a database named testDB
        drop database testDB

--40.	Add a column of type DATE called Birthday in Persons table
        create table Persons(
		birthday date 
		)
		select*from Persons
		insert into Persons values (cast('12.19.1997' as date))

--41.	Delete the column Birthday from the Persons table
        alter table Persons drop column birthday
		--ALTER TABLE DROP COLUMN failed because 'birthday' is the only data column in table 'Persons'. 
		--A table must have at least one data column.

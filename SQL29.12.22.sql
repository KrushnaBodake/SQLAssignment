-- in clause is used to select the multiple match values
select*from Employe where deptid in(2,3,4)

select*from Employe where eage not in (22,23,24)

select*from Dept where deptid in(1,2,3)

-- like uesd to match thr string with specific pattern
select*from Employe
select*from Employe where ename like 'a%'
select*from Employe where ename like'%s'
select*from Employe where ename like'%s%'

select*from Employe where ename like '%[asp]'
select*from Employe where ename like '[ask]%'

select*from Employe where ename like'[a and k]%'
select*from Employe where ename like '[a-s]%'
select*from Employe where ename like '%[a-k]'

select *from Employe where ename like 'S____'
select*from Employe where ename like '__i__'

--not like
select *from Employe where ename not like 'a%'
select*from Employe where ename not like'[ask]%'




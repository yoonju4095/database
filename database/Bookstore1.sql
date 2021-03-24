select eno, ename, dno
from employee
where salary in(select min(salary)
                from employee
                group by dno);

select eno, ename, job, salary
from employee
where salary < any (select salary
    from employee
    where job='SALESMAN')
    and job<>'SALESMAN';
    
select eno, ename, job, salary
from employee
where salary < any (select salary
    from employee
    where job='ANALYST')
    and job <> 'ANALYST';
    
SELECT eno, ename
FROM employee
where dno in (select dno
    from employee
    where ename like '%k%');
    
//----------------------------------------

select bookname
from book
where price >=20000;

SELECT count(*)
from book;

select count(distinct publisher)
from book;

select orderid
from orders
where orderdate not between '19/7/4' and '19/7/7';

select name, address
from customer
where name like '김%아';

select sum(saleprice)
from orders
where custid=2;

select count(*)as "도서수량",sum(saleprice) as "총액"
from orders 
group by custid;

select custid, count(*)
from orders
where saleprice>=8000
group by custid
having count(*) >= 2;

select bookname, price
from book
where price = (select max (price)
    from book);

create table publishingcomp(
    pubid number primary key,
    pubname varchar2(40) not null,
    pubaddr varchar2(60),
    pubtel varchar2(15) not null,
    pubrespon varchar2(10) not null
);
    
alter table publishingcomp
modify pubname varchar(40);

desc publishingcomp;

//종이 20문제 sql 5문제
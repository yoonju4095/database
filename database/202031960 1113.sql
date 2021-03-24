select name, sum(saleprice)
from customer, orders
where customer.custid=orders.custid
group by name
order by name;

alter table orders
add foreign key(bookid) references book(bookid);


select cu.name, bk.bookname, od.orderdate
from customer cu, orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid;

select cu.name, bk.bookname, od.orderdate
from customer cu, orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid
and price=20000;

select stff.eno, stff.ename, stff.job, stff.manager
from employee stff,employee mgr
where stff.manager=mgr.eno and mgr.ename like 'BLAKE';

select name, saleprice
from customer cu left outer join
orders on cu.custid=orders.custid;

select bk.bookid, bk.bookname, od.orderid, od.orderdate
from book bk left outer join orders od
on bk.bookid=od.bookid
order by bk.bookid;

select bk.bookname, count(od.bookid)
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.bookname;

select bk.publisher, count(od.bookid)as "salecount" 
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.publisher;

select dp.dno, dp.ename
from department dp, employee ep 
where dp.dno=ep.ename='scott';

selct stff.ename, stff.job, stff.hiredate, mgr.ename 
from employee stff, employee mgr
where stff.manager=mgr.eno
and stff.hiredate<mgr.hiredate;

select cu.name, bk.bookname, od.orderdate
from customer cu, book bk, orders od
where cu.custid=od.custid
and od.bookied=bk.bookied
order by od.orderdate;

select * from dba_users;

create user dituser1
IDENTIFIED BY ditdb20;

create user dituser2
IDENTIFIED BY ditdb20;

grant create session to dituser1;

grant select, update on customer to dituser1;

grant connect, resource to dituser2;



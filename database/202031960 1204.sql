select * from Book;
select * from Customer;
select * from Bookorders;

select bk.bookname "µµ¼­¸í",nvl(od.saleprice, 0) "ÆÇ¸Å°¡°Ý"
from book bk left outer join bookorders od
on od.bookid = bk.bookid;

select cu.name "°í°´¸í", 
nvl((select bookname from book bk
where bk.bookid=od.bookid),'±¸¸ÅÀÌ·Â¾øÀ½')"µµ¼­¸í"
from customer cu left outer join bookorders od
on od.custid = cu.custid;

select name
from customer
where custid in(select custid
from bookorders
where bookid in (select bookid
from book where publisher='´ëÇÑ¹Ìµð¾î'));

insert into customer(custid,name,address)
values(6, '±è¿¬¾Æ','´ëÇÑ¹Î±¹ ´ëÀü');

insert into bookorders(orderid,custid, bookid, saleprice)
values(12,6,3,21000);

select od.custid, cu.name, sum(saleprice)
from customer cu, bookorders od
where od.custid=cu.custid
group by od.custid, cu.name
order by od.custid;

select od.custid "°í°´¾ÆÀÌµð", cu.name "°í°´¸í", count(*)"±¸¸ÅÈ½¼ö"
from customer cu, bookorders od
where od.custid=cu.custid
group by od.custid, cu.name;

select od.custid "°í°´¾ÆÀÌµð", cu.name "°í°´¸í", count(*)"±¸¸ÅÈ½¼ö"
from customer cu, bookorders od
where od.custid=cu.custid
group by od.custid, cu.name
having count(*) >= (select avg(count(*))
from bookorders
group by custid
);

select ROWNUM "NO", cu.custid, cu.name, bk.bookname
from customer cu, book bk, bookorders od
where cu.custid=od.custid and bk.bookid=od.bookid
and saleprice>=20000;

create view salebook_vw
as select od.bookid, bk.bookname, count(*)"±Ç¼ö", sum(saleprice)"ÃÑÆÇ¸Å¾×"
from customer cu, book bk, bookorders od
where bk.bookid=od.bookid and cu.custid = od.custid
group by od.bookid, bk.bookname;

drop view salebook_vw;

create table newBookorders(
    orderid NUMBER,
    custid NUMBER,
    bookid NUMBER,
    saleprice NUMBER,
    orderdate DATE,
    constraint bookorders_pk PRIMARY KEY (orderid),
    constraint bookorders_custid_fk FOREIGN KEY(custid) REFERENCES Customer,
    );
    
alter table newbookorders
modify orderdate date defalut sysdate;

alter table newbookorders
add FOREIGN key(bookid)REFERENCES book(bookid);

insert into member
values(10,'','','','');

update book
set publisher='±Â½ºÆ÷Ã÷'
where bookid=3;

select * from Book;


update customer
set address='´ëÇÑ¹Î±¹ ºÎ»ê'
where custid=6;

select * from customer;

select bookname, sum(saleprice)"ÃÑÆÇ¸Å¾×", 
round(avg(saleprice),0) "Æò±Õ"
from book bk, bookorders od
where od.bookid = bk.bookid
group by bookname;

select count(*)"ÃÑÆÇ¸Å¼ö", sum(saleprice) "ÃÑÆÇ¸Å¾×"
from bookorders;

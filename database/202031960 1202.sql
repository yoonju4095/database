create table Book (
    bookid NUMBER,
    bookname VARCHAR2(40) NOT NULL,
    publisher VARCHAR2(30) NOT NULL,
    price NUMBER NOT NULL,
    constraint book_bookid_pk PRIMARY KEY(bookid)
);
create table Customer(
    custid NUMBER,
    name VARCHAR(20) NOT NULL,
    address VARCHAR(40) NOT NULL,
    phone VARCHAR(20),
    constraint customer_custid_pk PRIMARY KEY(custid)
);

create table Bookorders(
    orderid NUMBER,
    custid NUMBER,
    bookid NUMBER,
    saleprice NUMBER,
    orderdate DATE,
    constraint bookorders_pk PRIMARY KEY (orderid),
    constraint bookorders_custid_fk FOREIGN KEY(custid) REFERENCES Customer,
    constraint bookorders_bookid_fk foreign key(bookid)REFERENCES book
    );
    
alter table Bookorders
modify orderdate default sysdate;
    

insert into Book values(2,'�౸�ƴ� ����', '������', 13000);
insert into Book values(3,'�౸�� ����', '���ѹ̵��', 22000);
insert into Book values(4,'���� ���̺�', '���ѹ̵��', 35000);
insert into Book values(5,'�ǰ� ����', '�½�����', 8000);
insert into Book values(1,'�౸�� ����', '�½�����', 7000);
insert into Book values(6,'���� �ܰ躰 ���', '�½�����', 6000);
insert into Book values(7,'�߱��� �߾�', '�̻�̵��', 20000);
insert into Book values(8,'�߱��� ��Ź��', '�̻�̵��', 13000);
insert into Book values(9,'�ø��� �̾߱�', '�ɼ���', 7500);
insert into Book values(10,'Olympic Champion', 'Pearson', 13000);

insert into Customer values(1,'������', '���� ��ü��Ÿ', '000-5000-0001');
insert into Customer values(2,'�迬��', '���ѹα� ����', '000-6000-0001');
insert into Customer values(3,'��̶�', '���ѹα� ������', '000-7000-0001');
insert into Customer values(4,'�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into Customer values(5,'������', '���ѹα� ����','');


insert into Bookorders values(1,1,1,6000,'2019-07-01');
insert into Bookorders values(2,1,3,21000,'2019-07-03');
insert into Bookorders values(3,2,5,8000,'2019-07-03');
insert into Bookorders values(4,3,6,6000,'2019-07-04');
insert into Bookorders values(5,4,7,20000,'2019-07-05');
insert into Bookorders values(6,1,2,12000,'2019-07-07');
insert into Bookorders values(7,4,8,13000,'2019-07-07');
insert into Bookorders values(8,3,10,12000,'2019-07-08');
insert into Bookorders values(9,2,10,7000,'2019-07-09');
insert into Bookorders values(10,3,8,13000,'2019-07-01');
insert into bookorders(orderid, custid, bookid, saleprice)
values(11,2,4,32000);

select * from Book;
select * from Customer;
select * from Bookorders;

select bookid, bookname, publisher, price
from book;

select distinct publisher
from book;

select * from book
where price <20000;

select * 
from book
where publisher in('�½�����','���ѹ̵��');

select * from book order by price, bookname;

select sum(saleprice),
round(avg(saleprice),2),
min(saleprice),max(saleprice)
from bookorders;

select custid, count(*) "��������", sum(saleprice) "�Ѿ�"
from bookorders
group by custid;

select custid, count(*) as "��������"
from bookorders
where saleprice >=8000
group by custid 
having count(*)>=2;

select cu.name, cu.phone, bk.bookname
from customer cu, book bk, bookorders od 
where cu.custid=od.custid
and od.bookid=bk.bookid;

select cu.name, sum(od.saleprice)
from customer cu, bookorders od
where cu.custid = od.custid
group by cu.name;

select cu.name, bk.bookname
from customer cu,  bookorders od, book bk
where cu.custid=od.custid
and bk.bookid=od.bookid
and od.saleprice >= 20000;

select cu.name, od.saleprice
from customer cu left outer join bookorders od
on cu.custid=od.custid;

select bk.bookname, od.saleprice
from book bk left outer join bookorders od
on bk.bookid = od.bookid;

select name
from customer
where custid in(select custid from bookorders
where bookid in(
));
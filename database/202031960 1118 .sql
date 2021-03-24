create table member(
    memberid VARCHAR2(20) PRIMARY KEY,
    membername VARCHAR2(20) not null,
    phone VARCHAR(15),
    email VARCHAR(30)
);

create table mem_order(
    orderid NUMBER PRIMARY KEY,
    memberid VARCHAR(10) not null,
    orderdate DATE
);

alter table mem_order
add foreign key(memberid) references member;

drop table member;
drop table mem_order;

alter table mem_order
MODIFY orderdate default sysdate;

insert into member(memberid, membername)
values('lee1','이순신');
insert into member(memberid, membername)
values('lee2','이순진');
insert into member(memberid, membername)
values('lee3','이순희');

insert into mem_order(orderid, memberid)
values(1,'lee2');
insert into mem_order(orderid, memberid)
values(2,'lee1');

SELECT * FROM mem_order;

UPDATE member
set phone='010-2121-3433'
where memberid='lee2';









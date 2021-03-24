create table han_member(
    memberid VARCHAR2(30) not null,
    passwd VARCHAR2(20) not null,
    mem_name VARCHAR2(30) not null,
    age number,
    job VARCHAR2(40),
    grade VARCHAR2(20) default 'silver' not null,
    reserve number default 0 not null,
    constraint mem_memberid_pk primary key(memberid),
    constraint mem_grade_value check(grade in('sliver','gold','vip')),
    constraint mem_age_value check(age>=17)
);

create table han_product(
    productid VARCHAR2(40) not null,
    productname VARCHAR2(20) not null,
    totalstock number,
    price number not null,
    manufacturer VARCHAR(50) not null,
    supplydate date default sysdate,
    supply number not null,
    constraint product_id_pk PRIMARY key(productid),
    CONSTRAINT product_price_value check(price>=1000),
    CONSTRAINT product_supply_value check(supply >=10)
);

create table manufacture(
    manufacturer VARCHAR2(50) CONSTRAINT manufact_manufacture_pk PRIMARY key,
    telephone VARCHAR2(15) not null,
    address VARCHAR2(60),
    managerid VARCHAR2(20) not null
);

ALTER table han_product
add constraint product_manufacture_fk foreign key(manufacturer)
REFERENCES manufacture;

create table han_board(
    brdno number not null,
    brdtitle VARCHAR2(40) not null,
    brdcontents VARCHAR2(1000) not null,
    brddate date default sysdate not null,
    memberid VARCHAR2(30) not null,
    constraint board_brdno_pk primary key(brdno),
    constraint board_memberid_fk foreign key(memberid)
    references han_member(memberid)
);

drop table han_board;

create table han_orders(
    orderno number not null,
    memberid VARCHAR2(30) not null,
    productid VARCHAR2(40) not null,
    ordercnt number default 1 not null,
    address VARCHAR2(100) not null,
    orderdate date default sysdate not null,
    constraint orders_orderno_pk primary key(orderno),
    constraint orders_memid_fk foreign key(memberid)
    references han_member(memberid),
    constraint orders_productid_fk foreign key(productid)
    references han_product(productid)
);

select * from han_member;
select * from manufacture;
select * from han_product;
select * from han_board;
select * from han_orders;

select distinct manufacturer from han_product;

select * 
from han_product
where manufacturer like '%의류%' or
manufacturer like '%패션%';

select ho.orderno, hm.mem_name, hp.productname
from han_orders ho, han_member hm, han_product hp
where ho.memberid = hm.memberid and ho.productid = hp.productid
order by orderno desc;
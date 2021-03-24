drop table dept_second;
drop table dept_third;

create table dept_second(
    dno number(2) constraint pk_dept_second primary key,
    dname varchar2(14),
    loc varchar2(13)
);

drop table dept_second;

insert into dept_second
values(10, '¿µ¾÷ºÎ','¼­¿ï');

insert into dept_second(dno, dname)
values(20,'ÃÑ¹«ºÎ');

create table Customer1(
    id VARCHAR2(20) constraint Customer1_id_uk unique,
    pwd VARCHAR2(20) not null,
    name VARCHAR2(20) not null,
    phone VARCHAR2(30),
    address VARCHAR2(100)
);

drop table Customer1;

insert into customer1
values('greentea', '1234','³ìÂ÷¾Æ°¡¾¾','010-1111','seoul');

select * from customer1;

insert into customer1
values(null, '134','³ìÂ÷¾Æ°¡¾¾','010-1111','seoul');

select * from customer1;

create table emp_second1(
    eno number CONSTRAINT emp_second1_eno_pk primary key,
    ename VARCHAR2(9),
    job VARCHAR2(10),
    dno NUMBER CONSTRAINT emp_second1_dno_fk REFERENCES departmant
);

drop table emp_second1;

insert into emp_second1
values(1, 'SMITH', 'SALESMAN',50);

select * from emp_second1;

create table emp3(
    eno number constraint emp3_eno_pk primary key,
    ename VARCHAR2(10)constraint emp3_ename_nn not null,
    salary number(7,2) default 1000
    constraint emp3_salary_min check(salary>0)
);

drop table emp3;

insert into emp3
values(1,'È«±æµ¿',1);

insert into emp3(eno, ename)
values(2,'±è±æµ¿');

select * from emp3;

create table emp_copy
as
select * from employee;

create table dept_copy
as
select * from department;

select table_name, constraint_name
from user_constraints
where table_name in('EMPLOYEE','DERARTMENT');

alter table emp_copy
add constraint emp_copy_eno_pk primary key(eno);

alter table dept_copy
add constraint dept_copy_eno_pk primary key(dno);

alter table emp_copy
add constraint emp_copy_dno_fk
foreign key(dno) references dept_copy(dno);

select table_name, constraint_name
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');

insert into emp_copy(eno, ename, job)
values(1,'hong','manager');

SELECT * FROM emp_copy
where eno=1;

alter table dept_copy
drop primary key;

insert into emp_copy(eno, ename, dno)
values(8000,'À±Á¤È­',50);

alter table emp_copy
enable constraint emp_copy_dno_fk;

select table_name, constraint_name, status
from user_constraints
where table_name='EMP_COPY';


create table emp_sample
as
select * from employee
where 0=1;

drop table emp_sample;

select table_name, constraint_name, status
from user_constraints
where table_name='EMP_SAMPLE';

alter table emp_sample
add constraint emp_sample_dno_fk
FOREIGN KEY(dno) REFERENCES department(dno);

insert into emp_sample(eno, ename, dno)
values(1, 'È«±æµ¿', null);

insert into emp_sample(eno, ename, dno)
values(2, 'È«±æµ¿', 50);

create sequence sample_seq
start with 1
increment by 1;

select sample_seq.nextval from dual;

create sequence dno_seq1
start with 10
increment by 10;

select * from department;

create table dept_copy10
as
select * from department where 0=1;

drop table dept_copy10;

insert into dept_copy10
values(dno_seq1.nextval, 'ACCOUNTING', 'NEW YORK');

insert into dept_copy10
values(dno_seq1.nextval, 'SALES', 'CHICAGO');

delete dept_copy10
where dno = 20;

select * from dept_copy10;

insert into dept_copy1(dno, dname)
values(40,'¿µ¾÷');

insert into dept_copy1(dno, dname, loc)
values(20, 'ÃÑ¹«', 'ºÎ»ê');

select * from dept_copy10
order by dno;

update dept_copy10
set danme='PROGRAMMING'
where dno = 10;

update dept_copy10
set danme='HR'

update dept_copy10
set danme='PROGRAMMING', loc='SEOUL'
where dno = 10;

delete dept_copy10
where dno=10;

select * from dept_copy10;

delete dept_copy10;
select * from dept_copy10;

create table dept_cp
as
select * from department;

select * from dept_cp;

delete dept_cp;

ROLLBACK;

delete dept_cp
where dno=10;

select * form dept_cp;

commit;
rollback;

select * form dept_cp;




    
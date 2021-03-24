select * from employee;

select ename, salary
from employee
where salary >=2000
order by salary desc;

SELECT ename, job, hiredate
FROM employee
WHERE hiredate >= '81/02/20' and hiredate <= '81/05/01';

SELECT ename, job, hiredate
FROM employee
WHERE hiredate between '81/02/20' and '81/05/01';

select ename, hiredate, salary
from employee
where hiredate like '81%';

select sum(salary) as "�޿��Ѿ�",
    avg(salary) as "�޿����",
    max(salary) as "�ִ�޿�",
    min(salary) as "�ּұ޿�"
from employee;

select sum(commission) as "Ŀ�̼� �Ѿ�", 
    max(commission) as "�ִ밪",
    min(commission) as "�ּҰ�"
from employee;

select max(hiredate), min(hiredate)
from employee;

select count(*)
from employee;

select count(commission)
from employee;

select count (distinct dno)
from employee;
    
select dno as "�μ���ȣ", avg(salary) as "�޿����"
from employee
group by dno;

select dno as "�μ���ȣ", round (avg(salary),1)
from employee
group by dno;

select dno, job, count(*), sum(salary)
from employee
group by dno, job;

//
select job, sum(salary)
from employee
where job not like '%MANAGER%'
group by job
having sum(salary) >= 5000;

select job,
    max(salary) as "MAXIMUM", 
    min(salary) as "MINIMUM",
    sum(salary) as "Sum",
    round(avg(salary)) as "Avg"
from employee
group by job;

select job, count(*)
from employee
group by job;

select dno, count(*), 
    round(avg(salary),2)
from employee
group by dno;



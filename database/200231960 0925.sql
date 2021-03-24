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

select sum(salary) as "급여총액",
    avg(salary) as "급여평균",
    max(salary) as "최대급여",
    min(salary) as "최소급여"
from employee;

select sum(commission) as "커미션 총액", 
    max(commission) as "최대값",
    min(commission) as "최소값"
from employee;

select max(hiredate), min(hiredate)
from employee;

select count(*)
from employee;

select count(commission)
from employee;

select count (distinct dno)
from employee;
    
select dno as "부서번호", avg(salary) as "급여평균"
from employee
group by dno;

select dno as "부서번호", round (avg(salary),1)
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



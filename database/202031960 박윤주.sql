SELECT *
from employee;

//1
SELECT ename, salary, salary+300
FROM employee;

//2
SELECT ename, salary, salary*12+100
FROM employee
order by salary*12+100 desc;

//3
SELECT ename, salary
FROM  employee
WHERE salary > 2000
order by salary desc;

//4
SELECT ename, dno
FROM employee
WHERE eno = 7788;

//5
SELECT ename, salary
FROM employee
WHERE salary not between 2000 and 3000;

//6 따로 실행하면 오류 안 뜨는데 다 같이 적고 실행하니까 오류 뜹니다..
SELECT ename, job, hiredate
FROM employee
WHERE hiredate between '81/02/20' and '81/05/01'


//7
select ename,dno
from employee
where dno in(20,30)
order by ename;

//8
select ename, salary, dno
from employee
where salary between 2000 and 3000
and dno in (20,30)
order by ename;

//9 따로 실행하면 오류 안 뜨는데 다 같이 적고 실행하니까 오류 뜹니다..
select ename, hiredate
from employee
where hiredate like '81%'

//10
select ename, salary, commission
from employee where
commission is not null
order by salary, commission;

//11
select ename
from employee
where ename like '%A%'
and ename like '%E%';

//12
select ename, job, salary,commission
from employee
where commission >= 500;

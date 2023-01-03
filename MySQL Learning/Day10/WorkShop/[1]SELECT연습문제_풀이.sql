-- Q1
select * from emp;

-- Q2
select empno, ename, sal
from emp;

-- Q3
select distinct sal
from emp;

-- Q4
select ename as '이 름', sal as '월 급'
from emp;

-- Q5
SELECT ENAME as '이름', IFNULL(SAL, 0)+IFNULL(COMM, 0)  as '실급여'
FROM EMP;

-- Q6
select empno, ename, sal
from emp
where ename = 'SCOTT';

-- Q7
select empno, ename, job
from emp
where job = 'SALESMAN';

-- Q8
select empno, ename, sal
from emp
where empno in(7499,7521,7654);

-- Q9
select empno, ename, sal
from emp
where sal between 1500 and 3000;

-- Q10
select ename
from emp
where ename like 'A%' and ename not like '%N' ;

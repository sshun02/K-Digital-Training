select job, sum(sal)
from emp
group by job
order by sum(sal) ASC;

select job, sum(sal)
from emp
where job != 'MANAGER'
group by job
having  sum(sal) > 5000 ;

select job, max(sal)
from emp
where job != 'CLERK'
group by job
having  max(sal) >= 2000
order by max(sal) desc;

select deptno, sum(sal)
from emp
where deptno != 30
group by deptno
having sum(sal) >= 8000
order by 2 desc;

select deptno, avg(sal)
from emp
where comm is not null
group by deptno
having avg(sal) >= 1000
order by avg(sal) desc;

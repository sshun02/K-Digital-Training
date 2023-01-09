-- 1)
select ename, MY_EMP.deptno, dname
from MY_EMP join MY_DEPT using(deptno)
order by deptno;

-- 2)
select ename, job, deptno, dname
from MY_EMP join MY_DEPT using(deptno)
where MY_DEPT.loc = 'DALLAS';

-- 3)
select ename, dname
from MY_EMP join MY_DEPT using(deptno)
where ename like '%A%';

-- 4)
select ename, dname, sal
from MY_EMP join MY_DEPT using(deptno)
where sal >= 3000;

-- 5)
select job, ename, dname
from MY_EMP join MY_DEPT using(deptno)
where job = 'SALESMAN';

-- 6) 
select empno 사원번호, ename 사원이름, sal 연봉, (sal+comm) 실급여, GRADE 급여등급
from My_EMP JOIN SALGRADE ON(sal between losal and HISAL)
WHERE NOT comm is NULL;

-- 7)
select deptno, dname, ename, sal, grade
from My_EMP JOIN MY_DEPT using(deptno) JOIN salgrade on(sal between losal and HISAL)
where deptno = 10;

-- 8)
select deptno, dname, ename, sal, grade
from My_EMP JOIN MY_DEPT using(deptno) JOIN salgrade on(sal between losal and HISAL)
where deptno =10 or deptno =20
order by deptno ASC, grade desc;

-- 9)
select 사원.empno 사원번호, 사원.ename 사원이름, 관리자.EMPNO 관리자번호, 관리자.ename 관리자이름 
From My_emp 사원 join My_emp 관리자 on 사원.Mgr = 관리자.EMPNO
order by 사원.empno ASC;

-- 10)
select 사원.ename EMPLOYEE,사원.hiredate EMPHIREDATE, 관리자.ename MANAGER, 관리자.hiredate EMPHIREDATE 
From My_emp 사원 join My_emp 관리자 on 사원.Mgr = 관리자.EMPNO
where 사원.hiredate < 관리자.hiredate
order by 사원.hiredate ASC;

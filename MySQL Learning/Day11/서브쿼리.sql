-- 서브쿼리 
-- Q1. 'Jones'의 월급보다 많은 월급을 받는 사원의 이름과 월급을 출력하자.

-- step 01 'jones'의 월급

	select sal
    from emp
    where ename = 'JONES'; -- 2975
    
-- step 02. 많은 월급을 받는 사원의 이름과 월급 출력하자.

	select ename, sal
    from emp
    where sal > 2975;
    
-- 서브쿼리 : Single Row Subquery_ 서브쿼리의 걀과가 1개의 ROW인 경우
-- >, <, =, >=, <= 등의 단일값 비교 연산자.    
	select ename, sal
    from emp
    where sal > (select sal
				from emp
				where ename = 'JONES');
                
-- Multi Row Subquery = 서브쿼리의 결과가 여러 Row인 경우.
-- in, not in, >any, <any, >all, <all 등의 연산자.
	select ename, sal
	from emp
    where sal = (select sal
				from emp
				where job = 'SAKESMAN');

	select ename, sal
    from emp
    where sal in (1600,1250,1250,1500);
    

-- Q2) 부서번호가 10번인 사원들과 같은 월급을 받는 사원의 이름과 월급을 출력하라.and
    
	select ename, sal
	from emp
	where sal in (select sal
						from emp
                        where deptno = 10);
                        
-- Q3. 직업이 CLERK 인 사원과 같은 부서(deptno)에서 근무하는 사원의 이름과 월급과 부서번호를 출력하라.

	select ename, sal, deptno
    from emp
    where deptno in (select deptno
					from emp
                    where job = 'CLERK');
                    
-- Q4. 'CHICAGO'에서 근무하는 사원들과 같은 부서에서 큰무하는 사원의 이름과 월급을 출력하라.
	
    select ename, sal
    from emp
    where deptno = ( select deptno
					from dept
					where loc = 'CHICAGO');
                    
-- Q5). 부하직원이 있는 사원의 사원번호와 이름을 출력하라. <자기 자신이 관리자>
	select empno, ename
    from emp
    where empno in (select mgr
					from emp); -- (DATA OR DATA OR ...)
                    
-- Q6) 부하직원이 없는 사원의 사원번호와 이름울 출력하라.
	select empno, ename
    from emp
    where empno not in (select ifnull(mgr,0)
					from emp); -- king 이 null 값을 리턴하개된다.
    
-- Q7). 'KIMG'에게 보고하는 즉, 직속상관이 king인 사원의 이름을 나타내시오

		select ename, sal
        from emp
        where mgr = (select empno
					from emp
                    where ename = 'King');
		select * from emp;
        
-- Q8 20번 부서의 사원 중 가장 많은 월급을 받는
-- 사원들보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하라.

select ename, sal         #1
from emp
where sal > (select max(sal)
			from emp
            where deptno = 20);
            
select ename, sal         #2
from emp
where sal > all(select sal
			from emp
            where deptno = 20);

select sal         #20번 부서의 사원 월급 
from emp
where deptno=20;

-- Q9 20번 부서의 사원 중 가장 적은 월급을 받는 **
-- 사원들보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하라.

select ename, sal        #1
from emp
where sal > (select min(sal)
			 from emp
			 where deptno = 20);
             
select ename, sal        #2
from emp
where sal > any (select sal
			 from emp
			 where deptno = 20);
             
-- Q10 직업이 'SALESMAN'인 사원 중 가장 큰 월급을 받는 사원보다
-- 더 많은 월급을 받는 사원들의 이름과 월급을 출력하라.
-- 단, MIN(), MAX()등 함수를 사용하지 않고 연산자를 이용할 것.

select ename, sal
from emp
where sal > all(select sal
			from emp
            where job = 'SALESMAN');
            
-- Q11. 직업이 'SALESMAN'인 사원 중 가장 적은 월급을 받는 사원보다
-- 더 적은 월급을 받는 사원들의 이름과 월급을 출력하라.
-- 단, MIN(), MAX()등 함수를 사용하지 않고 연산자를 이용할 것.
            
select ename, sal
from emp
where sal < all(select sal
			from emp
            where job = 'SALESMAN');
            
            
-- *****************************
-- Q1. 직업이 'SALESMAN'인 사원과 같은 부서에서 근무하고 
-- 같은 월급을 받는 사원들의 이름, 월급, 부서번호를 출력하라.

select ename, sal, deptno
from emp
where deptno in(select deptno
			from emp
            where job = 'SALESMAN')
AND sal in (select sal
			from emp
            where job = 'SALESMAN');
            
-- Q2. 30번 부서 사원들과 같은 월급과
-- 같은 커미션을 받는 사원들의 이름, 월급, 커미션을 출력하라.

select ename, sal, comm
from emp
where sal in(select sal
			from emp
            where deptno=30)
AND comm in(select comm
			from emp
			where deptno=30);
            
-- ***************************************

-- Q1. TEST라는 테이블을 EMP 테이블로 만들어 보자. -> 테이블 제약 규칙은 오지 않는다.

create table TEST
AS
select * from EMP;
DESC emp;
select * from TEST;


-- Q2. TEST02라는 테이블을 EMP 테이블로 원하는 컬럼만 추려서 만들어 보자.
create table TEST02
as
select ename, empno, sal
from emp;
desc TEST02;
select * from TEST02;

-- Q3. TEST03라는 테이블을 EMP 테이블로 <원하는 컬럼과 원하는 타입>으로 만들어 보자.
create table TEST03 (ENAME VARCHAR(50))
as
select ename
from emp;
desc TEST03;
select * from TEST03;

drop table TEST03;

-- Q3. TEST04라는 테이블을 EMP 테이블로 만들어 보자 
-- 'CHICAGO'에서 근무하는 사원들과 같은 부서에서 큰무하는 사원의 이름과 월급으로 TEST04를 만들어보자.

create table TEST04
as
select ename, sal 
from emp
where deptno = (select deptno
				from dept
                where loc = 'CHICAGO');
desc TEST04;
select * from TEST04;


drop table TEST, TEST02;
drop table TEST03, TEST04;


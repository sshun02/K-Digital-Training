-- 테이블 질의어 insert, updata,delete구문을 활용할 수 있다.
-- 	view의 이해도를 설명할 수 있다.
-- if, while, loop를 통해서 프로시저, 사용자 함수를 만들 수 있다.
-- 판다스, 넘파이 등을 아용한 데이터 구현할 수 있다.

-- Q1. 사원 테이블에서 사원번호가 7749사원의 월급을 5000 으로 변경하자.
use my_emp;

select * 
from my_emp;

update MY_EMP 
set sal = 5000
where EMPNO = 7499;

-- Q2. 부서 번호가 20번인 사원의 월급은 2000으로 변경하자.

update my_emp
set sal = 2000
where deptno = 20;

-- Q3 MY_DEPT 테이블에 데이터를 입력 해보자. 50, RESERCH, BOSTON
select * from my_dept;
insert into my_dept
values (50, 'RESERCH', 'BOSTON');
-- Q$) 방금 전 입력한 데이터를 삭제 해보자.


-- Q5. FORD의 월급을 4000으로 변경하고 부서번호를 30으로 결경한다.
select *
from my_emp
where ename = 'FORD';

UPDATE my_EMP
set sal = 4000, deptno = 30
where ename = 'FORD';

-- Q6) 사원번호가 7698인 사원의 부서번호를 7499번 사원의 부서번호로 바꾸자
select deptno
from my_emp
where empno = 7934;

select deptno
from my_emp
where empno = 7698;

update my_emp
set deptno = 10
where empno = 7968;

/* 시험문제용
update my_emp
set deptno = (select deptno
from my_emp
where empno = 7934)
where empno = 7968;
*/

update my_emp
set deptno = (select deptno
from emp
where empno = 7934)
where empno = 7968; -- 실행됨

-- Q7. MY_EMP 테이블에 값을 추가해보자.

DESC MY_EMP;
INSERT INTO MY_EMP VALUES(0001, '홍길동', 'CLERK',  '7783', NOW(), 9000, NULL, 10);
INSERT INTO MY_EMP VALUES(0001, '홍길동', 'CLERK',  '7784', NOW(), 9000, NULL, 10);
INSERT INTO MY_EMP VALUES(0001, '홍길동', 'CLERK',  '7785', NOW(), 9000, NULL, 10);
select * from my_emp;
delete from my_emp
where empno = 1;


-- 7-1 : 사원의 번호가 1이고 매니저가 7785인 사원을 삭제하자.
delete from my_emp
where empno = 1 and mgr = 7785;

-- 7-2 : 데이터의 다양한 추가.
INSERT INTO MY_EMP(EMPNO, ENAME) VALUES(0002, '홍길동02');
select * from my_emp;

-- 7-3 : 사번 0002에 DEPTNO 20을 입력해보자. -> UPDATE 

UPDATE MY_EMP
SET DEPTNO =20
WHERE EMPNO = 2;

-- 7-4 : MY_EMP에 있는 내용을 삭제하자.
DELETE FROM MY_EMP;  -- 구조삭제가 아닌 전체 내용 삭제. (구조는 남아있다.) 


-- Q8. 서브쿼리를 이용한 INSERT, UPDATE, DELETE를 해보자.
DROP TABLE MY_EMP;

CREATE TABLE MY_EMP
AS
SELECT * FROM EMP;

SELECT COUNT(*) FROM MY_EMP;


-- 8-1 : WARD 과 같은 직업을 가진 사원을 모두 삭제하라.
delete from my_emp
where job = (select M_NEW.JOB 
			FROM (select job from my_emp where ename = 'WARD') M_NEW);


            
-- 8-2 : 'WARD'의 월급을 'SMITH'의 월급과 같게 수정하라.
update my_emp
set sal = (select MY.sal 
			from (select sal from My_EMP where ename = 'SMITH') MY)
where ename = 'WARD';


-- 8-3 : 'ALLEN'의 직업을 'JONES'의 직업과 같게 수정하라.
update my_emp
set job = (select MY.job 
			from (select job from my_emp where ename = 'JONES') MY)
where ename = 'ALLEN';

-- 8-4 : 사원번호가 7499번인 사원과 같은 직업을 가진 사원들의 입사일을 오늘 날짜로 바꾸어라.
update my_emp
set hiredate = now()
where job = (select my.job 
			from (select job from my_emp where empno = 7499) my);



select *
from my_emp;
-- Q9) 트랜잭션을 연동해 보자. ROLLBACK 취소; COMMIT 저장;
set autocommit = fales;
start transaction;

set autocommit =0;
set autocommit =1;
commit;
DELETE
FROM MY_EMP
WHERE DEPTNO = 10;

DELETE
FROM MY_EMP
WHERE DEPTNO = 20;

ROLLBACK;
SELECT COUNT(*) FROM MY_EMP;

-- DDL(CRRATE, ALTER, DROP)은 트랜잭션이 적용되지 않는다.

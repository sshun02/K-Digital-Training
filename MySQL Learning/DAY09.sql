

-- Q1) 오늘의 날짜를 출력해보자.
select now();

# USE MY_EMP 
-- Q2) SELECT 컬럼리스트,,, FROM 테이블 명;
-- 사원 테이블의 있는 전체 내용을 확인 해보자.

select *
from emp;

-- Q3) 부서 테이블에 있는 전체 내용을 확인 해보자.
select *
from dept;

-- Q4) my_emp의 내용중에 전체 테이블 목록을 확인 해 보자.
show tables;

-- Q5) 사원 테입ㄹ의 스키마 구조를 확인 해 보자.[필드명, 데이터타입. 널값 유무, 키값, 기본값, 시퀸스값]
desc emp;
describe emp;

-- Q6) 사원 테이블에서 사원의 이름, 번호, 매니저, 봉급을 출력해보자.
select ENAME, EMPNO, MGR, SAL
from EMP;

-- Q7) 부서 테이블에서 부서번호, 부서명을 출력 해보자.
SELECT DEPTNO, DNAME
FROM DEPT;

-- Q8) 두개의 테이블의 모든 내용을 출력 해보자.
SELECT *
FROM EMP, DEPT;

-- Q9) 별칭 : 컬럼의 별칭, 테이블 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원 테이블에서 사원의 이름, 사원의 번호로 두개의 컬럼을 출력해보자.
SELECT ENAME '사원의 이름' , EMPNO '사원의 번호'
FROM EMP;

-- Q10) 별칭 : 컬럼의 별칭, 테이블 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원 테이블에서 사원의 이름, 사원의 번호로 두개의 컬럼을 출력해보자.
SELECT ENAME AS '사원의 이름' , EMPNO AS '사원의 번호'
FROM EMP;

-- Q11) 별칭 : 컬럼의 별칭, 테이블 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원 테이블에서 사원의 이름, 사원의 번호로 두개의 컬럼을 출력해보자.
SELECT ENAME AS 사원이름 , EMPNO AS 사원번호
FROM EMP;

-- Q12) 별칭 : 컬럼의 별칭, 테이블 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원 테이블에서 사원의 이름, 사원의 번호로 두개의 컬럼을 출력해보자.
SELECT ENAME 사원이름 , EMPNO 사원번호
FROM EMP;

## "" , '' 상관 없음 (오라클은 다름) AS는 생략가능. 띄어쓰기가 있는 경우는 '' 로 묶어야함


-- Q13) 테이블의 별칭을 주자 _ 사원의 이름, 부서번호, 부서명을 출력해보자.
SELECT ENAME, DEPT.DEPTNO, DNAME
FROM EMP, DEPT;

SELECT ENAME, D.DEPTNO, DNAME
FROM EMP, DEPT D;

SELECT ENAME, 부서.DEPTNO, DNAME
FROM EMP, DEPT AS 부서;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D;
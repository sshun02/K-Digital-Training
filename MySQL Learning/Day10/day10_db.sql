-- Q1 전체 테이블 목록
-- use my_emp 

show tables;

-- Q2 사원의 이름 봉급 커미션
SELECT ENAME, SAL, COMM FROM EMP;

-- Q3 사원의 이름과 매니저
SELECT ENAME, MGR FROM EMP;

-- Q4 사원 이름 연봉
SELECT ENAME, SAL*12 AS `연봉` FROM EMP;

-- Q5 사원의 이름과 급여를 출력하되 급여는 봉급 + 커미션 (NULL은 0으로 변환)
-- ORACLE = NVL(컬럼, 대체값)
SELECT ENAME, IFNULL(SAL, 0)+IFNULL(COMM, 0) FROM EMP;

-- Q6 커미션이 책정되지 않은 사원은 커미션을 3000으로 지정한 후
-- 사원의 이름, 봉급, 커미션을 출력하자
SELECT ENAME, IFNULL(COMM,3000) FROM EMP;


-- Q7 급여 = 봉급 + 커미션 - 세금, 세금 = 봉급의 15%
-- 사원의 이름 봉급 커미션 세금 급여
SELECT ENAME, SAL, COMM, SAL*0.15 `세금`, SAL+IFNULL(COMM,0)-(SAL*0.15) `급여` FROM EMP;

/* 실행순서
SELECT 3
FROM 1
WHERE 2
비교 연산자 <> 같지않다

*/
-- Q1 사원의 봉급이 1000이상인 사원의 이름과 봉급
SELECT ENAME, SAL FROM EMP WHERE SAL >= 1000;

-- Q2 부서번호가 10번인 사원의 이름과 부서 번호
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO = 10

-- Q3 부서 번호가 10번이고 월급이 1000이상인 사원의 이름, 부서번호, 월급
SELECT ENAME, DEPTNO, SAL FROM EMP WHERE DEPTNO = 10 AND SAL >= 1000;

-- Q4 부서번호가 10, 20번인 사원의 이름과 부서번호
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO IN(10,20);
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=10 OR DEPTNO=20;

-- Q5 사원의 입사년도가 80년 이후에 입사한사원의 이름과 입사년도
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE >= 1980-01-01;
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE >= 1980/01/01;
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE >= 80/01/01;
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE >= 80-01-01;

/*
문자열 LIKE %모든 _하나
*/

-- Q1 사원테이블에서 사원의 이름이 A로 시작하는 사원
SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%';

-- Q2 사원테이블에서 사원이름이 T자가 2개 들어간 사원의 이름을 출력하자.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%T%T%';

-- Q3 사원테이블에서 사원이름중 L자가 2개 들어간 사원의 이름
SELECT ENAME FROM EMP WHERE ENAME LIKE '%L%L%';

-- Q4 사원이름이 T로 끝나는 사원의 이름
SELECT ENAME FROM EMP WHERE ENAME LIKE '%T';

-- Q5 사원이름이 A로 시작하고 L로 끝나는 사원의 이름
SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%N';

-- Q6 두번째가 M인 사람
SELECT ENAME FROM EMP WHERE ENAME LIKE '_M%';

/*
SELECT 칼럼1, 칼럼2, 칼럼3
FROM 테이블
ORDER BY 칼럼1;
ASC /DESC를 컬럼명 뒤에 오름차순, 내림차순
*/

-- Q1 사원의 이름을 오름차순
SELECT ENAME FROM EMP ORDER BY ENAME;
SELECT ENAME FROM EMP ORDER BY 1;

-- Q2 내림차순
SELECT ENAME FROM EMP ORDER BY ENAME DESC;
SELECT ENAME FROM EMP ORDER BY 1 DESC;

-- Q3 이름은 오름차순 봉급은 낼미차순
SELECT ENAME, SAL FROM EMP ORDER BY ENAME ASC, SAL DESC;
SELECT ENAME, SAL FROM EMP ORDER BY 1, 2 DESC;

/*
집계함수(컬럼명) : NULL처리 안됨
SUM, AVG, COUNT ... STD 표준편차
*/

-- Q1 봉급을 집계함수를 사용해 출력
SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), STD(SAL)
FROM EMP;

-- Q2 COUNT 함수
SELECT COUNT(ENAME), COUNT(*), COUNT(IFNULL(COMM,0)), COUNT(COMM) FROM EMP;
-- COUNT는 NULL이면 계산에 포함이 안됨

SELECT SUM(COMM), SUM(IFNULL(COMM,0)) FROM EMP;
-- SUM은 NULL도 처리 함

SELECT AVG(COMM), AVG(IFNULL(COMM,0)) FROM EMP;
-- AVG는 NULL 처리 안함

SELECT MAX(COMM), MAX(IFNULL(COMM,0)) FROM EMP;
-- MAX는 NULL 처리 함

SELECT MIN(COMM), MIN(IFNULL(COMM,0)) FROM EMP;
-- MIN는 NULL 처리 함

-- Q3 사원 테이블에서 부서번호가 10번인 사람의 평균 월급
SELECT AVG(IFNULL(SAL,0)) FROM EMP WHERE DEPTNO=10;

-- Q4 사원테이블에서 부서번호가 10번과 20번인 평균 월급
SELECT AVG(IFNULL(SAL,0)) FROM EMP WHERE DEPTNO IN(10,20);

-- Q5 직업이 SALESMAN인 사원의 평균 월급
SELECT AVG(IFNULL(SAL,0)) FROM EMP WHERE JOB='SALESMAN';
-- mysql 만 대소문자 무관, oracle은 대소문자 구분

/*
1. group by 문 다음에는 데이터를 구분짓기 위한 표현식으로 해당 테이블의 컬럼 명이나 변수 값등이 올수 있으며
그룹함수를 사용한 형태는 올 수 없다 <group by avg(sal) 안됨>

2. select-list 에는 ㄱgroup by 문에는 명시된 표현식과 그외 그룹함수를 사용한 표현식만이 올 수 있다.
 *는 안됨

3. 출력된 결과를 정렬하기 위해 order by 문을 사용하면 된다.
단 order by 문ㄷ ㅏ음에는 select-list에서 명시된 컬럼 또는
표현식과 컬럼의 별칭(alias), 컬럼 번호 등만 사용
*/

-- Q1. 부서별 평균 월급
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY 2;

SELECT DEPTNO AS NO, AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY NO;

SELECT DEPTNO AS NO, AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY NO DESC;

SELECT DEPTNO AS NO, AVG(SAL) AS 별칭 FROM EMP GROUP BY DEPTNO ORDER BY NO DESC;

SELECT DEPTNO AS NO, AVG(SAL) AS 별칭 FROM EMP GROUP BY DEPTNO ORDER BY 별칭 DESC;

-- Q2. 직업별 평균 월급
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB;

-- Q3 10번 부서의 평균 월급을 구하되 10번 부서의 평균 월급만 출력
SELECT DEPTNO, AVG(SAL) FROM EMP WHERE DEPTNO=10 GROUP BY DEPTNO;

SELECT DEPTNO, AVG(SAL) FROM EMP WHERE DEPTNO=10;
-- 이거도 되네 근데 부서의 평균 월급을 구하되가 적혀있음녀 GROUP BY를 한다.


-- Q4 직업별 월급의 합
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;
-- Q5 직업이 SALESMAN인 사원의 월급의 합
SELECT JOB, SUM(SAL) FROM EMP WHERE JOB='SALESMAN' GROUP BY JOB;

-- Q6 사원테이블에서 사원의 최대 월급
SELECT MAX(SAL) FROM EMP;
-- Q7 각 부서별로 최대월급
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;


/*
IS[NOT] NULL
*/

-- Q1 사원테이블에서 커미션이 책정되어있는 사원의 이름과 커미션
SELECT ENAME, COMM FROM EMP WHERE COMM IS NOT NULL;

-- Q2 사원테이블에서 커미션이 책정되지 않은 사원의 이름과 커미션
SELECT ENAME, COMM FROM EMP WHERE COMM IS NULL;


/*
HAVING
- GROUP함수로 집계된 데이터에 조건을 줄 때 사용
- 연산자는 GROUP BY 연산에 의해서 나누어진 데이터들을 다시 걸러주기 위해서 사용한다
제 2의 WHERE조건문이라고 할 수 있으며 조건문에서 그룹함수의 사용 가능
- HAVING 문 다음에는 SELECT-LIST 에서 사용한 컬럼과 그룹함수를 사용한 컬럼에 대해서만 조건을 줄 수 있다.

내부 수행 호출 순서
SELECT 5
FROM 1
WHERE 2
GROUP BY 3
HAVING 4
ORDER BY 6

내부 실행순서 * --> 2회
SELECT 6
FROM 1
WHERE 2
GROUP BY 3
HAVING 4
ORDER BY 5
*/

-- Q1 직업별 총월급을 구하고, 총월급이 5000이상인 것만 출력
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB HAVING SUM(SAL)>=5000;

-- Q2 부서별 월급의 합을 구하고 그 총합이 10000이상인 것만 출력
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO HAVING SUM(SAL) >=10000;

/*
WITH ROLLUP = 그롭 총합, 부분 소계 : rollip 
*/

-- Q1. 부서별 총합 뿐만 아니라 전체 총합 및 세부 내역을 보고 싶을 때
SELECT DEPTNO, ENAME, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, ENAME WITH ROLLUP;

-- Q2. ROLLUP을 이용하여 직위별 사원의 이름과 월급을 출력하라.
SELECT JOB, ENAME, SUM(SAL)
FROM EMP
GROUP BY JOB, ENAME WITH ROLLUP;

SELECT JOB, ENAME, SUM(SAL)
FROM EMP
GROUP BY JOB, ENAME WITH ROLLUP
ORDER BY 1;

/*
CUBE = 소계, 총계 : GROUP BY 문과 함께 사용되며 GROUP BY 문에서 명시한 
전체 컬럼에 대하여 추가적인 요약 정보를 단계적으로 만들어 준다.


GROUPING : GROUPING 함수는 그룹 기준에서 고려하지 않은 부분 총계인 경우에 1을
			그렇지 않은 경우 0을 리턴한다.
*/

SELECT ENAME, COMM, SUM(COMM) as SUM, grouping(ENAME), grouping(comm)
from emp
group by ename, comm with rollup


/* -------------------ROW_NUMBER()------------------------
SELECT ROW_NUMBER() [OVER PARTITION BY, 
							ORDER BY ]

열 A값의 내림차순으로 일련 번호 리턴 : SELECT ROW_NUMBER () OVER (ORDER BY A DESC)

컬럼 X의 값으로 그룹핑 분할 하고, 그 중에서 컬럼 A의 값의 내림차순으로 일련번호를 리턴
SELECT ROW_NUMBER() OVER (PATITION BY ORDER BY A DESC);
SELECT RANK() OVER (PARTITION BY, ORDER BY );
SELECT DENSE_RANK() OVER (PARTITION BY, ORDER BY);
*/
SELECT ROW_NUMBER() OVER (ORDER BY ENAME), ENAME
FROM EMP;

SELECT ROW_NUMBER() OVER (PARTITION BY JOB ORDER BY ENAME), ENAME
FROM EMP;

SELECT RANK() OVER ( ORDER BY YEAR(HIREDATE)) AS RANK_NO,
	   DENSE_RANK() OVER ( ORDER BY YEAR(HIREDATE)) AS DENSE_NO,
       EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT weekday('23-01-04');  # 0 ~ 6

/*  DATETIME OR DATE

	YEAR() : 1000 ~ 9999 4자리 표시
    MONTH() : 1 ~ 12 
    DAY() : 1 ~ 31
    DAYOFMONTH() = DAY()
	HOUR() / MINUTE() / SECOND()
    DATE_ADD( INTERVAL ), DATE_SUB()
    
*/

DESC EMP;

-- Q1 변수를 총해서 날짜함수를 활용해보자.
SET @DATE = NOW();

SELECT @DATE, YEAR(@DATE), MONTH(@date), DAY(@DATE);
SELECT HOUR(@DATE), MINUTE(@DATE), SECOND(@DATE);

-- Q2 변수를 통해서 날짜함수 WEEKDAY를 활용해보자.
-- 제어문 IF, while, loop, repeat문, case~when~then 문 (case ~ end문)

SET @DATE = NOW();
SELECT @DATE,
	CASE WEEKDAY(@DATE)
		WHEN 0 THEN '월'
        WHEN 1 THEN '화'
        WHEN 2 THEN '수'
        WHEN 3 THEN '목'
        WHEN 4 THEN '금'
        WHEN 5 THEN '토'
        WHEN 6 THEN '알'
	END AS 요일;
    
-- 함수만들기, 프로시저만들기, 트리거 = 활용

-- 중복 데이터에서 단일 값 출력 distinct, between ~ and 연산자

select distinct job
from emp;

-- 사원의 봉급이 1000 에서 2000 사이의 사원의 이름과 봉급을 출력해보자.
select ename, sal
from emp
where sal between 1000 and 2000;

-- 1000~2000 사이 제외 출력
select ename, sal
from emp
where sal not between 1000 and 2000;
 
-- 없을땐 없는대로 없다고 출력된다.
select ename, sal
from emp
where sal between 6000 and 7000;


/* 
	데이터 형변환 : 
    [ BINARY, CHAR, DATE, DATETIME, DECIMAL, JSON. NCHAR, SIGNED, TIME, UNSIGNED]
			CAST(expr AS type)
            
*/

select cast(now() as signed);  -- 형식변환

/*
	select
    from
    where
    group by
    having
    order by
    limit ;
*/

select *
from emp
order by empno desc
limit 5;

select *
from emp
order by empno desc
limit 5 offset 10;

select *
from emp
order by empno desc
limit 10 ,5;
-- QUESTION
-- 1. 사원 테이블에서 사원이름을 첫글자는 대문자로, 나머지는 소문자로 출력하라
 SELECT CONCAT(UPPER(LEFT(ENAME,1)), SUBSTRING(LOWER(ENAME),2)) FROM EMP;

-- 2. 사원테이블에서 사원이름을 뽑고 또 이름의 두번째 글자부터 네번째 글자까지
-- 출력하라.
SELECT ENAME, SUBSTRING(ENAME,2,5) FROM EMP;

-- 3. 사원테이블의 사원 이름의 철자 개수를 출력하라.
SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- 4. 사원테이블에서 사원 이름의 앞 글자 하나와 마지막 글자 하나만 출력하되 
-- 모두 소문자로 각각 출력하라.
SELECT ENAME, LOWER(LEFT(ENAME,1)), LOWER(RIGHT(ENAME,1)) FROM EMP;

-- 5. 3456.78의 소수점 첫번째 자리에서 반올림하라.
SELECT ROUND(3457.78,1);

-- 6. 3의 4제곱을 구하고, 64의 제곱근을 구하라.
SELECT POW(3, 4),SQRT(64);

-- 7. 오늘날짜와 오늘날짜에서 10일을 더한 날짜를 출력하라.
SELECT CURDATE(), DATE(CURDATE()+10);

-- 8. 현재 날짜보다 세달 후는  언제인지 를 출력하라.
SELECT DATE_ADD(CURDATE(), INTERVAL 3 MONTH);

-- 9. 사원테이블에서 사원이름과 사원들의 오늘 날짜까지의 근무일수를 구하라.
SELECT ENAME, HIREDATE, DATEDIFF(CURDATE(), HIREDATE) '근속' FROM EMP;


-- 10. 위 문제에서 근무일수를 00년 00개월 00일 근무하였는지
-- 확인할 수 있도록 변환하라.(단, 한 달을 30일로 계산하라)
-- 예)
--  | ENAME	| 근무일수		|
--  | KING	| 00년 00개월 00일	|

SELECT ENAME, HIREDATE, DATEDIFF(CURDATE(), HIREDATE) '근속',
FLOOR(DATEDIFF(CURDATE(), HIREDATE) / (12*30) ) '연',
FLOOR(DATEDIFF(CURDATE(), HIREDATE)%(12*30) ) '월',
FLOOR(DATEDIFF(CURDATE(), HIREDATE) / (12*30) ) '일'
FROM EMP;

SELECT FLOOR(DAYS/365) , MOD(DAYS , 365) FROM TB_DAYS;

-- 11.  사원테이블에서 사원의 이름 30자확보한다음  출력하고  오른쪽에 #을 채워라
SELECT RPAD(ENAME, '30', '#') FROM EMP;

-- 12. 사원테이블에서 이름의 공백을 없앤 후 출력하라
SELECT REPLACE(ENAME,' ','') FROM EMP;
      
-- 13 사원테이블에서 입사년도와 일만 출력하자. 
SELECT YEAR(HIREDATE), DAY(HIREDATE) FROM EMP;




-- @@@@@@@@@@@@@@@@@ 조인 @@@@@@@@@@@@@@@@@@
-- 테이블의 컬럼안에 공통 값(VALUE)추출하는 것
-- USING(공통컬럼)  on(컬렁명이 다를 때)
-- INNER JOIN = JOIN : 같은 값만 추출 / FALSE / NULL은 추출되지 않는다.
-- OTEERE 	Join : 주종관계 / 주 테이블은 전체를 출력 하고 종테이블이 같은 값만 출력
--              -- 종테이블이 출력하다 망가질 수 있습니다.
-- CROSS JOIN : 비교 컬럼이 속한 모든 테이블을 출력

-- Q1. INNER JOIN을 이용해서 사원의 이름과 사원이 속해있 부서 이름을 출력하자.
create table My_DEPT
as
select *
from dept;


USE MY_ENP;

-- ANSI
select ename, dname
from MY_EMP inner join My_DEPT using(DEPTNO);



-- MYSQL
select ename, dname
from MY_EMP, MY_DEPT
where MY_EMP.deptno = MY_DEPT. deptno;

-- Q2) 전체 컬럼을 리턴해서 출력 해보자.
select *
from MY_EMP join MY_dept using(deptno);

-- Q3) 간단한 테이블을 생성해서 JOIN을 생각해 보자.
drop table X, Y;
CREATE TABLE X(
	X1 VARCHAR(5),
    X2 VARCHAR(5)
    );

CREATE TABLE Y(
	Y1 VARCHAR(5),
    Y2 VARCHAR(5)
    );
    
INSERT into X values('A', 'D');

INSERT into Y values('A', '1');
INSERT into Y values('B', '2');
INSERT into Y values('C', '3');
INSERT into Y values(NULL, '1');


SELECT * from X;
select * from Y;

select *
From X, Y
where X1 = Y1;

select *
from X JOIN Y ON X1 = Y1;


select *
from X right outer join Y       #Y가 주 테이블 X는 종 테이블
on X1 = Y1;

select *
from X left outer join Y        #X가 주 테이블 Y는 종 테이블
on X1 = Y1;

-- *ANSI*   RIGHT OUTER JOIN + LEFT OUTER JOIN 
-- select * 
-- from X full outer join Y    
-- on X1 = Y1;

-- Q5) 
drop table SALGRADE;
create table SALGRADE(
	GRADE INT,
    LOSAL INT,
    HISAL INT
    );
    

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

select *
from SALGRADE;

select * from MY_EMP;

-- Q6) . NONEQUI JOIN
-- 각 사원의 이름과 월급 그리고 그 사원의 급여등급을 출력해보자.

select ename, sal, grade
from My_EMP JOIN SALGRADE ON(sal between losal and HISAL);

-- Q7) 각 사원의 이름과 월급 그리고 그 사원의 급여등급, 부서이름을 출력해보자.
-- 테이블 제약사항이 있는것을 선 조인, 나머지는 후 조인
select ename, sal, grade, dname
from MY_EMP join MY_dept using(DEPTNO)
	join SALGRADE ON(sal between losal and HISAL);

-- Q8) SELF JOIN : 테이블 하나에 같은 값을 가진 컬럼을 조인하는 것
-- 	테이블의 별칭을 지정 한 후 조인힌다.
-- 사원의 번호와 이름, 관리자의 번호와 이름을 출력해보자.
-- 사원의 MGR과 관리자의 EMPNO 같은 값을 조인한다.

select 사원.empno, 사원.ename, 관리자.EMPNO, 관리자.ename 
From My_emp 사원 join My_emp 관리자 on 사원.Mgr = 관리자.EMPNO;

-- 1) CREATE TABLE로 새 테이블 만들기
-- 2) CREATE TABLE에서 기본 키 (PRIMARY KEY) 제약 조건 지정
-- 3) CREATE TABLE에서 고유 키(UNIQUE KEY) 제약 조건 지정
-- 4) CREATE TABLE에서 검사 (CHECK) 제약 조건 지정
-- 5) CREATE TABLE에서 열에 기본값 지정
-- 6) CREATE TABLE에서 외래 키 (FOREIGN KEY) 제약 조건 지정

CREATE DATABASE  STUDENTS;
USE STUDENTS;

--  << 학생 정보를 유지하기 위한 students 테이블 생성 >>- 
/*
student_id: 레코드 ID(정수 유형) int
student_number: 학생 번호(최대 10자리 문자열 유형) varchar
first_name: 아래 이름(최대 50자리 문자열 유형) varchar
last_name: 이름(최대 50자리 문자열 유형). varchar
middle_name: 중간 이름(최대 50자리 문자열 유형). varchar
birthday: 생일(날짜형). DATE
gender: 성별(문자열 형식으로 M: 남성, F: 여성) ENUM
paid_flag : 수업료를 지불했는지 여부 플래그 (BOOL 형식으로 FALSE (0) : 미결제, TRUE (1) : 지불됨)

*/

drop table students;
create table students(
student_id 		int 			 not null,
student_number 	varchar(10)	 	 not null,
first_name 		varchar(50)		 not null,
last_name		varchar(50) 	 not null,
middle_name 	varchar(50)		 null,
birthday		DATE 			 not null,
gender 			ENUM('M','F')	 not null,
paid_flag 		BOOL 			 not null
);
desc students;

insert into students values (1,1,1,1,1,now(),'M',true);
insert into students values (1,1,1,1,1,now(),'f',0);
insert into students values (1,1,1,1,1,now(),'M',true);
select * from STUDENTS;

-- 2) CREATE TABLE에서 기본 키 (PRIMARY KEY) 제약 조건 지정
-- *식별키 테이블당 하나의 컬럼만 지정할 수 있다. NULL XX
create table students02(
student_id 		int 			 not null,
student_number 	varchar(10)	 	 not null,
first_name 		varchar(50)		 not null,
last_name		varchar(50) 	 not null,
middle_name 	varchar(50)		 null,
birthday		DATE 			 not null,
gender 			ENUM('M','F')	 not null,
paid_flag 		BOOL 			 not null,
primary key (student_id)
);
insert into students02 values (1,1,1,1,1,now(),'M',true);
insert into students02 values (2,1,1,1,1,now(),'f',0);
select * from STUDENTS02;

create table students03(
student_id 		int, 			 
student_number 	varchar(10),
primary key (student_id)
);	 	 

create table students04(
student_id 		int 	AUTO_INCREMENT,		 
student_number 	varchar(10),
primary key (student_id)
);	 	 
desc students04;

insert into students03 values(1,1);
insert into students03 values(1,null);
insert into students04 values(null,null); # AUTO_INCREMENT,	로 인해 자동으로 3이 들어간다.

select * from students04;

drop table students05;
create table students05(
student_id 		int  	AUTO_INCREMENT,
student_number 	varchar(10) DEFAULT 'ABC',
primary key (student_id, student_number)
);	 	 
desc students05;

insert into students05 values(1,1);
insert into students05 values(1,2);
insert into students05 values(2,1);
insert into students05 values(2,2);

select * from STUDENTS05;
insert into students05 values(null, 3);

-- 3) CREATE TABLE에서 고유 키(UNIQUE KEY) 제약 조건 지정
-- 4) CREATE TABLE에서 검사 (CHECK) 제약 조건 지정

drop table students06;
create table students06 (
	student_id int ,
    student_number 	varchar(10),
	birthday		DATE 	,		
	unique key (student_id),
    check (birthday >= '2000-01-01')
    );

desc students06;

insert into students06(student_id) values(NULL);
select * from students06;
insert into students06(student_id, birthday) values (1, now());
insert into students06(student_id, birthday) values (2, now());
insert into students06(student_id, birthday) values (3, '1999-02-12');

select * from students06;

-- 6) CREATE TABLE에서 외래 키 (FOREIGN KEY) 제약 조건 지정

drop table students05;
create table students05(
student_id 		int  	AUTO_INCREMENT,
student_number 	varchar(10),
primary key (student_id)
);	 	 
desc students05;

insert into students05 values(1,1);
insert into students05 values(2,2);
select * from students05;

-- 현재 student_my테이블의 student_id를 students05의 student_id로 참조
drop table student_my;
create table student_my
(
student_id 	int  not null,
foreign key (student_id)
references students06(student_id)
);	 	 

insert into student_my values(7);
insert into student_my values(1);

-- 제약조건 확인
select * from information_schema.table_constraints
where table_name = 'students06';

select * from information_schema.table_constraints
where table_name = 'students05';

select * from information_schema.table_constraints
where table_name = 'student_my';

-- 7) 제약조건을 삭제 해보자.
select * from information_schema.table_constraints
where table_name = 'students03';
alter table students03 drop primary key;

-- 8)
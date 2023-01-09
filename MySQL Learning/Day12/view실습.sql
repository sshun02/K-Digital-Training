use my_emp;
select count(*) from my_emp;
select * from my_emp;
create view empview
as
select *
from my_emp;

select count(*) from empview;
select * from empview;

-- Q1) empview를 통해서 데이터를 삭제 한 후 원본과 비교
delete from empview
where empno = 7499;

-- Q3) 조인된 
create view my_view
as
select ename, empno, deptno, dname
from my_emp join my_dept using(deptno);

select * from my_view;
insert into my_view(ename, empno, deptno, dname) 
			values('홍길동', 1111, 50, '서울'); -- 안들어감
            
            
-- Q4) 참조형으로 되어 있는 테이블을 사용해서 뷰를 만들고, 값을 입력해보자.
drop view my_view02;
create view my_view02
as
select ename, empno, deptno, dname
from emp join dept using(deptno);

select * from my_view02;

insert into my_view02(ename, empno, deptno, dname) 
			values('홍길동', 1111, 50, '서울');

commit;
SELECT * FROM my_view;
select * from my_view02;

delete from my_view02
where deptno = 10;


-- Q1)
Drop table My_REPORT;
create table My_REPORT(
name varchar(10),
color varchar(10),
sales int);

-- Q2)
insert into My_REPORT
values ('shoes', 'Red', 5200),
('Wallet', 'White', 3800),
('shoes', 'Red', 5100),
('shoes', 'Black', 4600),
('Wallet', 'Black', 3900),
('Wallet', 'White', 4000),
('shoes', 'Red', 5200);

-- Q3)
SELECT name, sum(sales) FROM My_REPORT GROUP BY name;

-- Q4)
SELECT name, color, sum(sales) FROM My_REPORT group by name, color;

-- Q5)
select name, sum(sales) from My_REPORT group by name with rollup;

-- Q6)
SELECT name, color, sum(sales) FROM My_REPORT group by name, color;

-- Q7)
select name, color, sum(sales) from My_REPORT group by name,color with rollup;

-- Q8)
select name as NAME, avg(sales) as average
from My_REPORT
where sales >= 150 
group by name HAVING avg(sales) >= 200 






	

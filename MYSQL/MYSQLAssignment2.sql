#Answer 1

CREATE VIEW VW_Emp
AS
SELECT * FROM EMPLOYEES WHERE EMP_NO IN (10001,10002,10003,10004,10005);

CREATE VIEW VW_DEpt_Emp
AS
SELECT * FROM DEpt_Emp WHERE EMP_NO IN (10004,10005,10006,10007,10008);

SELECT * FROM VW_Emp t1
LEFT JOIN VW_DEpt_Emp t2 ON t1.EMP_NO = t2.EMP_NO
UNION
SELECT * FROM VW_Emp t1
RIGHT JOIN VW_DEpt_Emp t2 ON t1.EMP_NO = t2.EMP_NO

#Answer 2
select concat(first_name,' ',last_name) as name, case when gender='M' THEN 'Male'
 when gender='F' THEN 'Female' END Gender
 from employees
 
#Answer 3

select title,count(1) as count from titles group by  title

#Answer 4

select '<50000' as salary,avg(salary) from salaries where salary<50000
union  all
select '50000-100000' as salary,avg(salary) from salaries where salary between 50000 and 100000
union all
select '>100000' as salary,avg(salary) from salaries where salary>100000

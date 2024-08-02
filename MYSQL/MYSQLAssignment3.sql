
use employees
#Write a query to display all the details from employee table with department, title and latest salary.

with cte as(
select emp_no,salary,to_date,row_number() over (partition by emp_no order by to_date desc ) rnk 
from salaries
)
select  emp_no,salary,to_date from cte where rnk=1

#Write a procedure which accepts the parameters (emp_no,birth_date, first_name, last_name, gender, hire_date)
# and to update the table if emp_no already exists in the table or insert a new record if emp_no does not exists in table


DELIMITER $$
create procedure USP_EmpDetails(IN emp_no1 INT, IN birth_date date, IN first_name varchar(14), IN last_name varchar(16), IN gender CHAR(1), IN hire_date date)
begin 

    if  exists (SELECT emp_no FROM employees WHERE emp_no =emp_no1 ) then
		
        update employees set birth_date=birth_date,first_name=first_name,last_name=last_name,gender=gender,hire_date=hire_date
		where  emp_no =emp_no1 ;
   
    else 
        insert INTO employees(emp_no,birth_date,first_name,last_name,gender,hire_date)
    VALUES(emp_no1,birth_date,first_name,last_name,gender,hire_date);
    end if;
end$$
DELIMITER ;

SELECT *  FROM employees WHERE emp_no =10001;
CALL USP_EmpDetails(10001, '1986-06-26','sham','XYZ','M','1986-10-11');
select * from employees where emp_no=10001;

#Write a function to return the experience of an employee by passing the emp_no.

DELIMITER $$
CREATE FUNCTION employeeExperience(emp_id INT) RETURNS integer READS SQL DATA
BEGIN
    DECLARE TotalYearExp INTEGER;

    SELECT TIMESTAMPDIFF(year,hire_date,current_date ) into TotalYearExp from employees where emp_no=emp_id ;
        RETURN  TotalYearExp;
END;$$	
select employeeExperience(10003) from dual;
























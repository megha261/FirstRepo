#Assignment2 :Write a query to display the employees whose firstname starts with 'Y' and ends with 'n' from employees table
SELECT * FROM employees WHERE first_name LIKE 'Y%n';

#Assignment3 :Write a query to display the emp_no and salary increased by 30% from salaries table.
SELECT  emp.emp_no,sal.salary+(sal.salary*30/100) as increased_salary from employees emp JOIN salaries sal ON emp.emp_no=sal.emp_no ;

#Assignment4 :Write a query to display unique titles from titles table.
SELECT DISTINCT title FROM titles




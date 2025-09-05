/*Change the “Business Analysis” department name to 
“Data Analysis”.
Hint: To solve this exercise, use the “departments” table.*/

update departments
set dept_name = 'Data Analysis'
where dept_no= 'd010';

-- Remove the department number 10 
-- record from the “departments” table.
delete from departments
where dept_no='d010';

/*How many departments are there in the “employees” database?
 Use the ‘dept_emp’ table to answer the question.*/
 select count(distinct dept_no)
 from dept_emp;
 
 /*What is the total amount of money spent on salaries 
 for all contracts starting after the 1st of January 1997?*/
 select sum(salary) from salaries
 where from_date>'1997-01-01';
 
 /*1. Which is the lowest employee number in the database?
2. Which is the highest employee number in the database?*/
 select  min(emp_no) from employees;
 select  max(emp_no) from employees;
 
 /*What is the average annual salary paid to 
 employees who started after the 1st of January 1997?*/
 select avg(salary) from salaries
 where from_date>'1997-01-01';
 
 
 /*Round the average amount of money spent 
 on salaries for all contracts that
 started after the 1st of January 1997 to a precision of cents.*/
 
 select round(avg(salary),2) from salaries
 where from_date>'1997-01-01';
 
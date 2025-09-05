/*Write a query that upon execution, assigns a row number to all managers we have information 
for in the "employees" database (regardless of their department).

Let the numbering disregard the department the managers have worked in.
 Also, let it start from the value of 1. Assign that value to the manager with the lowest
 employee number.*/
 
 SELECT
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM
dept_manager;
;


/* Write a query that upon execution, assigns a sequential number for each employee number 
registered in the "employees" table. Partition the data by the employee's
 first name and order it by their last name in ascending order (for each partition)*/
 
select emp_no,first_name,last_name,
row_number() over(partition by first_name order by last_name asc) as row_num
from employees; 
 
/*Obtain a result set containing the salary values each manager has signed a contract for. 
To obtain the data, refer to the "employees" database.

Use window functions to add the following two columns to the final output:
- a column containing the row number of each row from the obtained dataset, starting from 1.

- a column containing the sequential row numbers associated to the rows for each manager, where 
their highest salary has been given a number equal to the number of rows in the given partition,
and their lowest - the number 1.*/

select dm.emp_no,s.salary,row_number() over() as row_num1,
row_number() over(partition by emp_no order by salary asc) as row_num2
from dept_manager dm 
join salaries s 
on dm.emp_no=s.emp_no
order by row_num1,emp_no,salary ASC;
 
 
 
 
/*Write a query that provides row numbers for all workers from the "employees" table, 
partitioning the data by their first names and ordering each partition by their employee 
number in ascending order.

NB! While writing the desired query, do *not* use an ORDER BY clause in the relevant SELECT
 statement. At the same time, do use a WINDOW clause to provide the required window specification.*/
 
 select emp_no,first_name,row_number() over w as row_num1
 from employees
 window w as (partition by first_name order by emp_no asc);
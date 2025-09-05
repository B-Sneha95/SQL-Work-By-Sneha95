SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
 -- Retrieve a list with data about all
 -- female employees who were hired in the year 2000 or after.   
 SELECT 
    *
FROM
    employees
WHERE
    hire_date >=  '2000-01-01' AND gender = 'F'
    
-- Extract a list with all employees’ 
-- salaries higher than $150,000 per annum.
select * from salaries
where salary > 150000;

/* Obtain a list with all different “hire dates” 
from the “employees” table.
Expand this list and click on “Limit to 1000 rows”. 
This way you will set the limit of output
rows displayed back to the default of 1000.  */  
select distinct hire_date from employees
limit 1000 ;


/* How many annual contracts with a value higher than 
or equal to $100,000 have been registered in the 
salaries table?
*/
 
select count(*) as Annualcontract_count from salaries 
where salary > 100000;

/*How many managers do we have in the “employees” database?
Use the star symbol (*) in your code to solve this exercise.*/
select count(*) from dept_manager;

/* Select all data from the “employees” 
table, ordering it by “hire date” in descending order.*/

select * from employees 
order by hire_date desc;
/*Write a query that obtains two columns. 
The first column must contain annual salaries 
higher than 80,000 dollars. The second column,
 renamed to “emps_with_same_salary”, must show 
 the number of employees contracted to that salary. 
 Lastly, sort the output by the first column.*/
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
group by salary
ORDER BY salary ASC;

/*Select all employees whose average salary is higher 
than $120,000 per annum.
Hint: You should obtain 101 records.*/

SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT first_name, COUNT(first_name) as names_count
FROM employees
where hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) > 200
order by  first_name desc;


SELECT COUNT(*) FROM employees
WHERE hire_date > '1999-01-01';


SELECT first_name, COUNT(*) as name_count
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
ORDER BY name_count DESC;

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

/*Select the employee numbers of all individuals who have 
signed more than 1 contract after the 1st of January 2000.
Hint: To solve this exercise, use the “dept_emp” table.*/
select emp_no
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date)>1;

-- Select the first 100 rows from the ‘dept_emp’ table. 
select * from dept_emp
limit 100;

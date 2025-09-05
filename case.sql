/*Similar to the exercises done in the lecture, obtain a result set containing the employee number, 
first name, and last name of all employees with a number higher than 109990. Create a fourth column in the query, 
indicating whether this employee is also a manager, according to the data provided in the 
dept_manager table,
 or a regular employee*/
 
 select e.emp_no,e.first_name,e.last_name,
 CASE 
 WHEN dm.emp_no IS NOT NULL THEN 'Manager'
 ELSE 'Regular_Employee'
 END AS IS_MANAGER
 from employees e 
 left join dept_manager dm
 on e.emp_no=dm.emp_no
 where e.emp_no> 109990;
 
/*Extract a dataset containing the following information about the managers: employee number,
 first name, and last name. Add two columns at the end – one showing the difference between 
 the maximum and minimum salary of that employee, and another one saying whether this salary 
 raise was higher than $30,000 or NOT.If possible, provide more than one solution. */

-- solution 1
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'
        ELSE 'Salary was NOT raised by more then $30,000'
    END AS salary_raise
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;  

-- solution:2
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000,
        'Salary was raised by more then $30,000',
        'Salary was NOT raised by more then $30,000') AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;
 
 
 /*Extract the employee number, first name, and last name of the first 100 employees, 
 and add a fourth column, called “current_employee” saying “Is still employed” if the employee
 is still working in the company, or “Not an employee anymore” if they aren’t.

Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to
 solve this exercise. */
 select de.emp_no,e.first_name,e.last_name,
 case
 when max(de.to_date)>sysdate() then 'Is_still employed'
 else 'Not_an_employee anymore'
 end as current_employee
 from 
 employees e 
 join dept_emp de on e.emp_no=de.emp_no
 group by de.emp_no
 limit 1000;
 
 
 
 
 
 
 
 
 
 
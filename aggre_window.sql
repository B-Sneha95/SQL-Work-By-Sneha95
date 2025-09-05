/*Exercise #1:

Consider the employees' contracts that have been signed after the 1st of January 2000 and terminated
 before the 1st of January 2002 (as registered in the "dept_emp" table).
Create a MySQL query that will extract the following information about these employees:
- Their employee number
- The salary values of the latest contracts they have signed during the suggested time period
- The department they have been working in (as specified in the latest contract they've signed 
during the suggested time period)
- Use a window function to create a fourth field containing the average salary paid in the 
department the employee was last working in during the suggested time period. Name that field 
"average_salary_per_department".*/
WITH latest_contracts AS (
    SELECT 
        de.emp_no,
        de.dept_no,
        s.salary,
        ROW_NUMBER() OVER (PARTITION BY de.emp_no ORDER BY s.from_date DESC) AS rn
    FROM dept_emp de
    JOIN salaries s 
        ON de.emp_no = s.emp_no
        AND s.from_date BETWEEN de.from_date AND de.to_date
    WHERE de.from_date > '2000-01-01'
      AND de.to_date < '2002-01-01'
)
SELECT 
    emp_no,
    salary AS latest_salary,
    dept_no,
    AVG(salary) OVER (PARTITION BY dept_no) AS average_salary_per_department
FROM latest_contracts
WHERE rn = 1;





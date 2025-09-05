/*Exercise #1:
Store the highest contract salary values of all male employees in a temporary table 
called male_max_salaries.*/

CREATE TEMPORARY TABLE male_max_salaries AS
SELECT s.emp_no, MAX(s.salary) AS highest_salary
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
WHERE e.gender = 'M'
GROUP BY s.emp_no;

/*Exercise #2:
Write a query that, upon execution, allows you to check the result set contained in 
the male_max_salaries temporary table you created in the previous exercise.*/

SELECT * FROM male_max_salaries;

-- the rows are by default limit by 1000 so instead we can check by aggregate function count
SELECT COUNT(*) 
FROM male_max_salaries;












DROP TEMPORARY TABLE IF EXISTS male_max_salaries;



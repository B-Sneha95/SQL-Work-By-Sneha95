/*Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a 
query to find out how many salary contracts signed by male employees had a salary value below or
 equal to the all-time company average.
In this task, a salary contract is defined as any record in the salaries table.*/
with CTE as(
select avg(salary) as Avg_salary
from salaries)
select 
sum(case when s.salary < c.Avg_salary then 1 else 0 end)as no_salaries_below_avg,
COUNT(s.salary) AS no_of_salary_contracts from salaries s join 
employees e on e.emp_no=s.emp_no and e.gender='M'	
join
CTE c;


/*Exercise #2:
Use a CTE (a Common Table Expression) and at least one COUNT() function in the SELECT statement 
of a query to determine how many salary contracts signed by male employees had a salary value
 below or equal to the all-time company salary average.
In this task, a salary contract is defined as any record in the salaries table.*/
with cte as(
select avg(salary) as salary_average from salaries s
)
select count(case when s.salary < c.salary_average then 1 else 0 end)
no_salaries_below_avg_w_count,
COUNT(s.salary) AS no_of_salary_contracts
from salaries s join employees e on s.emp_no=e.emp_no
and e.gender='M'
join cte c;

/*Exercise #3:
Use MySQL joins (and don’t use a Common Table Expression) 
in a query to find out how many male employees have never signed a contract with a salary
value higher than or equal to the all-time company salary average (i.e. to obtain the same result
as in the previous exercise).*/

SELECT 
    e.emp_no,
    SUM(CASE WHEN s.salary >= (SELECT AVG(salary) FROM salaries) THEN 1 ELSE 0 END) AS sal_greater_avg,
    COUNT(s.salary) AS salary_count
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.gender = 'M'
GROUP BY e.emp_no
HAVING sal_greater_avg = 0;   -- means employee never had salary >= avg

/*Exercise #4:
Use a cross join in a query to find out how many male employees have never signed a contract
with a salary value higher than or equal to the all-time company salary average (i.e. to obtain 
the same result as in the previous exercise).*/
WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries
)
SELECT
SUM(CASE WHEN s.salary < c.avg_salary THEN 1 ELSE 0 END) AS no_salaries_below_avg_w_sum,
# COUNT(CASE WHEN s.salary < c.avg_salary THEN s.salary ELSE NULL END) AS no_salaries_below_avg_w_count,
COUNT(s.salary) AS no_of_salary_contracts
FROM salaries s JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M' CROSS JOIN cte c;








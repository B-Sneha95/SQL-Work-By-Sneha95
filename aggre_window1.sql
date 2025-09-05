/*Exercise #1:
Create a query that upon execution returns a result set containing the employee numbers, 
contract salary values, start, and end dates of the first ever contracts that each employee signed 
for the company.
To obtain the desired output, refer to the data stored in the "salaries" table.*/
select s.emp_no,s.salary,s.from_date,s.to_date
from salaries s
join
(
	select emp_no,min(from_date) as first_salary_contract
	from salaries 
	group by emp_no
)as d
on s.emp_no=d.emp_no 
where s.from_date=d.first_salary_contract;
-- or																																																																																																																								
-- SELECT s.emp_no, s.salary, s.from_date, s.to_date
-- FROM salaries s
-- JOIN (
--     SELECT emp_no, MIN(from_date) AS first_contract_date
--     FROM salaries
--     GROUP BY emp_no
-- ) sub
-- ON s.emp_no = sub.emp_no
-- AND s.from_date = sub.first_contract_date;

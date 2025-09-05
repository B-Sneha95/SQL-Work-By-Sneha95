/* Write a query that ranks the salary values in descending order of all contracts signed by 
employees numbered between 10500 and 10600 inclusive. Let equal salary values for one and the 
same employee bear the same rank. Also, allow gaps in the ranks obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result.
*/
select d.emp_no,d.salary,d.rank1 from(
select 
e.emp_no,s.salary,rank() over(partition by e.emp_no order by s.salary desc) as rank1
from employees e 
join salaries s 
on e.emp_no=s.emp_no
where e.emp_no between 10500 and 10600
)d
order by salary desc;

/*Exercise #2:

Write a query that ranks the salary values in descending order of the following contracts
from the "employees" database:
- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
- contracts that have been signed at least 4 full-years after the date when the given employee 
was hired in the company for the first time.
In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps 
in the ranks obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result.*/
select e.emp_no,
	s.salary,
    dense_rank() over(PARTITION BY e.emp_no order by salary desc) as sal_rank,
    e.hire_date,
    s.from_date,
    (YEAR(s.from_date) - YEAR(e.hire_date)) AS years_from_start
    from employees e 
    join salaries s on e.emp_no=s.emp_no
    where e.emp_no between 10500 and 10600 
    order by salary desc;
    





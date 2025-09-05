/*Exercise #1:
Write a query containing a window function to obtain all salary values that 
employee number 10560 has ever signed a contract for.
Order and display the obtained salary values from highest to lowest.*/

SELECT
emp_no,salary,
ROW_NUMBER() OVER w AS row_num FROM salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

/*Exercise #2:
Write a query that upon execution, displays the number of salary contracts that each manager
 has ever signed while working in the company.*/
 
 select dm.emp_no,count(salary) as salary_contract
 from dept_manager dm join salaries s on 
 dm.emp_no=s.emp_no
 group by emp_no;
 
 /*Exercise #3:
Write a query that upon execution retrieves a result set containing all salary values that 
employee 10560 has ever signed a contract for. Use a window function to rank all salary values 
from highest to lowest in a way that equal salary values bear the same rank and that gaps in the 
obtained ranks for subsequent rows are allowed.*/
SELECT emp_no,
       salary AS salary_value,
       RANK() OVER (ORDER BY salary DESC) AS rank_s
FROM salaries
WHERE emp_no = 10560
ORDER BY salary_value DESC;

/*Exercise #4:

Write a query that upon execution retrieves a result set containing all salary values that 
employee 10560 has ever signed a contract for. Use a window function to rank all salary values 
from highest to lowest in a way that equal salary values bear the same rank and that gaps in the
obtained ranks for subsequent rows are not allowed.*/
select emp_no,salary, dense_rank() over(order by salary desc) as ranks
from salaries
where emp_no=10560
order by salary desc;
 




 
 
 
 
 
 
 
 


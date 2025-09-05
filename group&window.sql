/* Exercise #1:

Find out the lowest salary value each employee has ever signed a contract for. 
To obtain the desired output, use a subquery containing a window function, as well as a 
window specification introduced with the help of the WINDOW keyword.
Also, to obtain the desired result set, refer only to data from the “salaries” table.*/
SELECT emp_no, salary AS min_salary
FROM (
    SELECT emp_no,
           salary,
           ROW_NUMBER() OVER w AS rn
    FROM salaries
    WINDOW w AS (PARTITION BY emp_no ORDER BY salary ASC)
) sub
WHERE rn = 1;

-- Exercise #2:
-- Again, find out the lowest salary value each employee has ever signed a contract for.
--  Once again, to obtain the desired output, use a subquery containing a window function. 
-- This time, however, introduce the window specification in the field list of the given subquery.
-- To obtain the desired result set, refer only to data from the “salaries” table.

SELECT a.emp_no,
MIN(salary) AS min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num
FROM
salaries) a
GROUP BY emp_no;

/*Exercise #3:
Once again, find out the lowest salary value each employee has ever signed a contract for. 
This time, to obtain the desired output, avoid using a window function. Just use an aggregate 
function and a subquery.
To obtain the desired result set, refer only to data from the “salaries” table.*/

select emp_no,min(salary) as min_salary from
(select emp_no,salary from salaries) as s
group by emp_no;

/*Exercise #4:
Once more, find out the lowest salary value each employee has ever signed a contract for.
 To obtain the desired output, use a subquery containing a window function, as well as a window
 specification introduced with the help of the WINDOW keyword. Moreover, obtain the output without
 using a GROUP BY clause in the outer query.
To obtain the desired result set, refer only to data from the “salaries” table.*/
select emp_no,salary as min_sal
from(select emp_no,salary,row_number()over w as rn
from salaries 
window w as (partition by emp_no order by salary asc))t
where rn=1;

/*Exercise #5:
Find out the second-lowest salary value each employee has ever signed a contract for.
 To obtain the desired output, use a subquery containing a window function, as well as a 
 window specification introduced with the help of the WINDOW keyword. Moreover, obtain the
 desired result set without using a GROUP BY clause in the outer query.
To obtain the desired result set, refer only to data from the “salaries” table.*/

select emp_no,salary as min_salary from
(select emp_no,salary,row_number() over w as rn
from salaries
window w as (partition by emp_no order by salary))as d
where rn=2;













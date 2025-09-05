/* Starting your code with “DROP TABLE”, create a table called
 “emp_manager” (emp_no – integer of 11, not null; dept_no
 – CHAR of 4, null; manager_no – integer of 11, not null). */
 
drop table if exists emp_manager; 
create table emp_manager
(
emp_no int not null,
dept_no char(4) null,
manager_no int not null
);




/*A and B should be the same subsets used in the last lecture
 (SQL Subqueries Nested in SELECT and FROM). 
In other words, assign employee number 110022 as a manager
 to all employees from 10001 to 10020 (this must be subset A),
 and employee number 110039 as a manager to all employees from
 10021 to 10040 (this must be subset B).*/

insert into emp_manager 
SELECT 
    U.*
FROM
    (SELECT 
    a.* from
        (select 
        e.emp_no as Employee_ID,
            MIN(de.dept_no)as deptartment_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;




select * from dept_manager;


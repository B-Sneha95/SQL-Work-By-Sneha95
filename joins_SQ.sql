DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup
(dept_no CHAR(4) NULL,dept_name VARCHAR(40) NULL);

INSERT INTO departments_dup
(dept_no,dept_name)
SELECT * FROM departments;

INSERT INTO departments_dup (dept_name)
VALUES('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002'; 

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
  emp_no int(8) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
);

INSERT INTO dept_manager_dup
select * from dept_manager;

select * from dept_manager_dup;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';



/* Select all managers’ first and last name,
 hire date, job title, start date, and department name.*/
 
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

/*How many male and how many 
female managers do we have in the ‘employees’ database?*/
SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

/*Extract the information about all department managers who were hired
 between the 1st of January 1990 and the 1st of January 1995.*/
 SELECT 
    e.first_name, 
    e.last_name
FROM 
    employees e
JOIN 
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE 
    e.hire_date BETWEEN '1990-01-01' AND '1995-01-01';
    
-- using subquery
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
 
 
 /*Select the entire information 
 for all employees whose job title is “Assistant Engineer”.*/
 select * from employees e 
 where exists
 (select * from titles t join employees e on e.emp_no=t.emp_no 
 where title="Assistant Engineer");
 
 
 
 
 
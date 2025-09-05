/*Create a procedure that will provide the average salary
 of all employees.
Then, call the procedure.*/

Delimiter $$
create procedure AVG_SALARY()
begin
 select avg(salary) as avg_sal from salaries;
END$$
Delimiter ;

call employees.AVG_SALARY();
call employees.AVG_SALARY;
call AVG_SALARY();
call AVG_SALARY;



-- IN and OUT parameters
/*Create a procedure called ‘emp_info’ that uses as 
parameters the first and the last name of an individual,
 and returns their employee number.*/
drop procedure if exists emp_info;
Delimiter $$
create Procedure emp_info(in p_first_name varchar(255),
in p_last_name varchar(255),out p_emp_no int)
Begin
select emp_no
into p_emp_no
from employees
where first_name=p_first_name and 
last_name=p_last_name
limit 1;
End$$

Delimiter ;
call emp_info();
 
 select first_name,last_name from employees;
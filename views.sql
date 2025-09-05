/*Create a view that will extract the average salary 
of all managers registered in the database. 
Round this value to the nearest cent.
If you have worked correctly, after executing the view from
 the “Schemas” section in Workbench, you should obtain the 
 value of 66924.27.*/
 
 create view v_avg_sal_managers as 
 select round(avg(salary),2) as Manager_avg_salary
 from salaries s join
 dept_manager dm on s.emp_no= dm.emp_no;

 
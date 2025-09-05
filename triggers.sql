/* trigger in SQL is a special type of stored procedure
 that automatically executes (or "fires") in response to
 certain events on a table
 or view — such as an INSERT, UPDATE, or DELETE.*/

/*Create a trigger that checks if the hire date
 of an employee is higher than the current date. 
 If true, set this date to be the current date. 
 Format the output appropriately (YY-MM-DD).*/
 
 delimiter $$
 create trigger set_date
 before insert on employees
 for each row
 begin
     if new.hire_date > date_format(sysdate(), '%Y-%m-%d')
     then
     set new.hire_date = date_format(sysdate(), '%Y-%m-%d');
     end if;
 end$$
 delimiter ;
 
 select * from employees 
 limit 4;
 
    

INSERT employees VALUES ('999904', 
'1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');
INSERT employees VALUES ('999906', 
'1970-01-31', 'Johny', 'Johnsonred', 'M', '2025-09-01');


SELECT  * 
FROM employees
ORDER BY emp_no DESC;
  
 
-- DELIMITER $$
-- CREATE TRIGGER trig_hire_date  
-- BEFORE INSERT ON employees
-- FOR EACH ROW  
-- BEGIN  
-- IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') 
-- THEN     
-- SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
-- END IF;  
-- END $$  
-- DELIMITER ;  

   
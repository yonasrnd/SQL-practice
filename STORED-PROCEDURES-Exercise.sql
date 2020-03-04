use employees;

drop procedure if exists select_employees;

DELIMITER $$ 
CREATE PROCEDURE select_employees()

Begin
	Select * from employees
    limit 1000;
END $$
Delimiter ;

drop procedure if exists average_salary;

Delimiter $$
create procedure average_salary()

begin 
	select avg(salary) as average_salary from salaries;
end $$
Delimiter ;

call employees.average_salary();

drop procedure if exists emp_info;

Delimiter $$
create procedure emp_info(in e_first_name varchar(16), e_last_name varchar(16), out emp_no integer)

begin 
select e.emp_no 
into emp_no
from employees e
where e.first_name = e_first_name and e.last_name = e_last_name;
end $$

Delimiter ;


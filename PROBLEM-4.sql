drop procedure if exists find_avg_salary;

DELIMITER $$ 
CREATE PROCEDURE find_avg_salary(in low_salary FLOAT, high_salary FLOAT)
Begin
	Select 
    e.gender, d.dept_name , AVG(s.salary) as avg_salary
    FROM
    t_departments d
        JOIN
    t_dept_emp de ON d.dept_no = de.dept_no
        JOIN
    t_salaries s ON de.emp_no = s.emp_no
        JOIN
    t_employees e ON s.emp_no = e.emp_no
    WHERE s.salary between low_salary and high_salary
    group by d.dept_no, e.gender;
END $$
Delimiter ;

CALL find_avg_salary(50000, 90000)
Delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
begin
 declare v_avg_salary decimal (10,2);
 
SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
return  v_avg_salary;
end $$
delimiter ;

drop function if exists emp_info;
Delimiter $$
create function emp_info (e_first_name varchar(255), e_last_name varchar(255)) returns integer
begin
 declare v_max_from_date date;
 declare v_salary decimal (10,2);
SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = e_first_name
        AND e.last_name = e_last_name;
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = e_first_name
        AND e.last_name = e_last_name
        AND s.from_date = v_max_from_date;
return  v_salary;
end $$
delimiter ;
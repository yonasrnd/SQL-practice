SELECT 
    d.dept_name,
    e.gender,
    ROUND(AVG(s.salary),2) AS average_salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_departments d
        JOIN
    t_dept_emp de ON d.dept_no = de.dept_no
        JOIN
    t_salaries s ON de.emp_no = s.emp_no
        JOIN
    t_employees e ON s.emp_no = e.emp_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= '2002'
ORDER BY d.dept_no;
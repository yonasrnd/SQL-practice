SELECT 
    YEAR(de.from_date) AS calendar_year,
    e.gender AS gender,
    COUNT(e.emp_no) AS number_of_employees
FROM
    t_dept_emp de
        JOIN
    t_employees e ON de.emp_no = e.emp_no
WHERE
    YEAR(de.from_date) >= '1990'
GROUP BY calendar_year , gender
ORDER BY calendar_year , gender;


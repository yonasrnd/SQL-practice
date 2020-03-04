SELECT 
    emp_no,
    first_name,
    last_name,
    CASE gender
        WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    Employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees;
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 300000 THEN 'Salary was raised more than $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY s.emp_no;

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'This salary was raised more than $30,000'
        ELSE 'This salary was raised less than $30,000'
    END AS salary_raise
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY s.emp_no;

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000,
        'Salary was raised by more then $30,000',
        'Salary was NOT raised by more then $30,000') AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

SELECT 
    de.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > sysdate() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
    dept_emp de
        JOIN
    employees e ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;

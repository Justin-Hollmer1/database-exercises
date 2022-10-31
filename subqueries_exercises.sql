SELECT * FROM employees WHERE employees.hire_date = (SELECT employees.hire_date FROM employees WHERE emp_no = 101010);



SELECT title FROM titles
JOIN employees
ON employees.emp_no = titles.emp_no
WHERE (employees.first_name = 'Aamod');


SELECT employees.first_name, employees.last_name
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
WHERE employees.gender = 'F' AND dept_manager.to_date = '9999-01-01';





SELECT * from titles;
SELECT * FROM employees;
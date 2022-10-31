CREATE DATABASE join_test_db;
SHOW databases;
USE join_test_db;
SHOW tables;
DESCRIBE users;
DESCRIBE roles;
SELECT * FROM roles;

INSERT INTO users (name, email, role_id) VALUES
('User 1', 'User1@gmail.com', 2),
('User 2', 'User2@gmail.com', 2),
('User 3', 'User3@gmail.com', 2),
('User 4', 'User4@gmail.com', NULL);
SELECT * FROM users;

SELECT users.name, roles.name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.id AS employeeID, users.name AS name, users.email AS user_email, roles.name AS their_job
FROM users
JOIN roles
ON users.role_id = roles.id;


SELECT users.name AS employee_name, roles.name AS their_job
FROM users
JOIN roles
ON users.role_id = roles.id;

USE employees;
SELECT database();
SHOW tables;
DESCRIBE dept_manager;
DESCRIBE departments;
SELECT * FROM departments;
SELECT * FROM dept_manager;

SELECT departments.dept_name AS Department_Name, dept_manager.emp_no AS Department_Manager
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;









SELECT * FROM employees LIMIT 10;
SELECT * FROM dept_manager LIMIT 10;
SELECT * FROM departments LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM titles;
# Departments with corresponding department manager.
SELECT departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name) AS Department_Manager
FROM departments
JOIN dept_manager
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no
WHERE YEAR(dept_manager.to_date) = 9999;

# All departments currently managed by women.
SELECT departments.dept_name AS department_name, CONCAT(employees.first_name, ' ', employees.last_name) AS name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no
WHERE employees.gender = 'F' AND YEAR(dept_manager.to_date) = 9999;

# Employees working in customer service.
SELECT titles.title, COUNT(titles.title) AS total
FROM employees
JOIN titles
ON employees.emp_no = titles.emp_no
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE titles.to_date = '9999-01-01' AND dept_emp.to_date = '9999-01-01' AND departments.dept_name = 'Customer Service'
GROUP BY titles.title;


# Salary of all current managers.
SELECT departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name), salaries.salary
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date ='9999-01-01' AND salaries.to_date ='9999-01-01'
ORDER BY dept_name;
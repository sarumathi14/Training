CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Sales');
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO employees (employee_id, employee_name, department, salary) VALUES
(1, 'Alice', 'Engineering', 70000),
(2, 'Bob', 'Marketing', 65000),
(3, 'Charlie', 'Engineering', 80000),
(4, 'Diana', 'HR', 60000),
(5, 'Evan', NULL, 55000);
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department = d.department_name;
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department = d.department_name;
SELECT e.employee_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department = d.department_name;
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department = d.department_name
UNION
SELECT e.employee_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department = d.department_name
WHERE e.employee_id IS NULL;


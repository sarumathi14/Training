CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    department VARCHAR(255),
    salary DECIMAL(10, 2)
);
CREATE TABLE department_stats (
    department VARCHAR(255) PRIMARY KEY,
    avg_salary DECIMAL(10, 2)
);
INSERT INTO employees (name, department, salary) VALUES
('Alice', 'Engineering', 70000),
('Bob', 'Engineering', 75000),
('Charlie', 'Engineering', 80000),
('David', 'Marketing', 60000),
('Eve', 'Marketing', 65000);
DELIMITER //
CREATE PROCEDURE CalculateAvgSalary(IN department_name VARCHAR(255))
BEGIN
    DECLARE avg_sal DECIMAL(10, 2);
    SELECT AVG(salary) INTO avg_sal
    FROM employees
    WHERE department = department_name;
    INSERT INTO department_stats (department, avg_salary)
    VALUES (department_name, avg_sal)
    ON DUPLICATE KEY UPDATE avg_salary = avg_sal;
END //
DELIMITER ;
CALL CalculateAvgSalary('Engineering');
SELECT * FROM department_stats WHERE department = 'Engineering';




CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'Product manager'),
    (2, 'scrum master'),
    (3, 'PL crusing');

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary)
VALUES
    (101, 'priyanka', 'Burshi', 2, 60000.00),
    (102, 'Bharath', 'O', 1, 65000.00),
    (103, 'Siranjivi', 'ks', 2, 50000.00),
    (104, 'Allwyn', 'Immanuvel', 3, 40000.00);
SELECT first_name, last_name, salary
FROM employees;
SELECT first_name, last_name, department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE department_name = 'Engineering';
SELECT department_name, AVG(salary) AS avg_salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name;
UPDATE employees
SET salary = 62000.00
WHERE employee_id = 101;
DELETE FROM employees
WHERE employee_id = 104;
CREATE DATABASE Company_simple_DB;

CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO Departments (department_name) VALUES
('Software Development'),
('Quality Assurance'),
('Product Management'),
('Marketing'),
('Finance and Accounting'),
('Human Resources ');


-- Create employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary NUMERIC(10, 2),
    department_id INT REFERENCES Departments(department_id)
);

-- Insert employees 
INSERT INTO employees (employee_name, email, salary, department_id) 
VALUES
('Sunil', 'sunil123@gmail.com',  65000, 1), 
('Mudit', 'Mudit34@gmail.com', 70000, 2),
('Yash', 'Yash54@gmail.com', 75000, 3),
('Diana', 'diana.p@example.com', 48000, 3),
('Ravi', 'Ravi.c@example.com', 62000, 4),
('Fiona','fiona.w@example.com',50000, 5); 


-- Create projects table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    employee_id INT REFERENCES employees(employee_id)
);


INSERT INTO projects (project_name,  employee_id) 
VALUES
('HR Portal',1),
('Mobile Banking App',3),
('AI Chatbot Assistant',5),
('Smart Billing System',1);

SELECT * FROM Departments;
SELECT * FROM employees;
SELECT * FROM  projects ;

-- Practice with JOINs
--  1. Retrieve all employees with their department names

SELECT e.employee_id, d.department_name
FROM employees as e
JOIN Departments as d 
ON e.department_id = d.department_id;

-- 2. List all employees and the projects they are working on. Include employees even if not assigned to any project.

SELECT e.employee_id, p.project_name
FROM employees as e
LEFT JOIN projects as p
ON e.employee_id = p.employee_id;

-- 3. Show all departments and the number of employees in each department.

SELECT 
    d.department_name,
    COUNT(e.employee_id) as employee_count
FROM departments as d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 4. List employees who are not assigned to any project.
SELECT e.employee_id
FROM employees as e
LEFT JOIN projects as p ON 
e.employee_id = p.employee_id
WHERE p.project_id IS NULL;

-- 5. Get the names of all employees along with their department names and the projects they are working on (if any).

SELECT e.employee_id, d.department_name, p.project_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
LEFT JOIN projects p ON e.employee_id = p.employee_id;



- Part 2: Practice with GROUP BY and Aggregates

-- 6. Show the total salary paid by each department
SELECT 
    d.department_name,
    SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 7. Find the average salary in each department
SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


-- 8. List departments having more than 3 employees
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 3


-- 9. Display the department with the highest average salary
SELECT 
    d.department_name,
    AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC
LIMIT 1;

-- 10. Count the number of projects each employee is assigned to

SELECT 
    e.employee_id,
    e.employee_name,
    COUNT(p.project_id) AS project_count
FROM employees e
LEFT JOIN projects p ON e.employee_id = p.employee_id
GROUP BY e.employee_id, e.employee_name;


SELECT DISTINCT salary FROM employees;

SELECT DISTINCT salary, job_id FROM employees;

SELECT DISTINCT salary FROM employees
ORDER BY salary DESC;

SELECT DISTINCT job_id, salary FROM employees
ORDER BY job_id, salary DESC;

SELECT DISTINCT phone_number FROM employees
ORDER BY phone_number DESC;

-- LIMIT CLAUSE

SELECT * FROM employees LIMIT 10;

SELECT first_name last_name, salary, job_id, department_id FROM employees
WHERE salary >= 4500
ORDER BY salary DESC
LIMIT 10
OFFSET 5;


SELECT employee_id, first_name, last_name
FROM employees
ORDER BY first_name
LIMIT 5
OFFSET 3;



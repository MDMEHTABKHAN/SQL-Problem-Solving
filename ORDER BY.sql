SELECT employee_id, first_name, last_name
FROM employees
ORDER BY first_name;

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY first_name DESC;

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY 
first_name,
last_name DESC;

SELECT first_name, last_name, hire_date FROM employees
ORDER BY hire_date DESC;

SELECT salary FROM employees
ORDER BY salary DESC;

SELECT salary FROM employees
ORDER BY salary;

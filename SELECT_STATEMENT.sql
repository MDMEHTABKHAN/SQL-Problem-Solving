SELECT * FROM employees;

SELECT first_name, last_name FROM employees;

SELECT DISTINCT first_name FROM employees;

SELECT DISTINCT salary FROM employees;

SELECT DISTINCT salary, job_id FROM employees;


SELECT first_name FROM employees
WHERE MONTH(hire_date) = 3;

SELECT first_name, job_id FROM employees
WHERE YEAR(hire_date) = 2020 AND MONTH(hire_date) = 3;

SELECT first_name FROM employees
WHERE MONTHNAME(hire_date) = 'March';

SELECT first_name FROM employees
WHERE YEAR (hire_date) = 2020;


SELECT first_name, last_name, salary, salary * 1.05 AS new_sal 
FROM employees;

SELECT first_name, last_name, salary, salary * 1.10 AS new_sal 
FROM employees;

SELECT first_name, last_name, salary, salary * 1.12 AS new_sal 
FROM employees;

SELECT first_name, last_name, salary, salary * 1.9 AS new_sal 
FROM employees;
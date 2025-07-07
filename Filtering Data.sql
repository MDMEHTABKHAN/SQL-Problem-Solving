-- WHERE Clause

SELECT * FROM employees;
SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'A%';

SELECT first_name, last_name FROM employees
WHERE first_name LIKE '%A%';

SELECT first_name, last_name FROM employees
WHERE first_name LIKE '%h';

SELECT first_name, last_name FROM employees
WHERE first_name LIKE '______%';

SELECT first_name, last_name FROM employees
WHERE first_name LIKE '____a%';

SELECT job_id, salary FROM employees
WHERE salary >= 34000
ORDER BY salary DESC;

SELECT first_name, last_name, salary FROM employees
WHERE salary < 60000;

SELECT first_name, last_name, salary FROM employees
WHERE salary <= 55000;

SELECT first_name, last_name, salary FROM employees
WHERE salary > 66000;

SELECT first_name, last_name, salary FROM employees
WHERE salary <> 60000;


SELECT first_name, last_name, salary FROM employees
WHERE last_name = 'Doe';

SELECT first_name, last_name, salary FROM employees
WHERE last_name IN ('Doe', 'Smith', 'Brown');

SELECT first_name, last_name, salary FROM employees
WHERE last_name NOT IN ('Doe', 'Smith', 'Brown', 'White');

SELECT first_name, last_name, salary FROM employees
WHERE salary BETWEEN 40000 AND 70000;

SELECT first_name, last_name, salary FROM employees
WHERE salary BETWEEN 40000 AND 7000
ORDER BY salary DESC;

SELECT first_name, last_name, salary FROM employees
WHERE salary BETWEEN 40000 AND 7000
ORDER BY salary ASC;


SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary NOT BETWEEN 2500 AND 2900
ORDER BY salary;

SELECT first_name, last_name, hire_date
FROM employees
WHERE
  EXTRACT(year from hire_date) = 2000
  OR EXTRACT(year from hire_date) = 2023
ORDER BY
  hire_date;
  
  
  
SELECT first_name, last_name, salary, job_id FROM employees
WHERE salary >= 70000 OR salary <= 45000;  

SELECT first_name, last_name, salary, job_id FROM employees
WHERE salary >= 70000 OR salary <= 45000
ORDER BY salary DESC;

SELECT
  first_name, last_name, phone_number
FROM employees
WHERE phone_number = NULL;

SELECT
  first_name, last_name, phone_number
FROM employees
WHERE phone_number IS NULL;

SELECT
  first_name, last_name, phone_number
FROM employees
WHERE phone_number IS NOT NULL;


SELECT
  first_name, salary
FROM employees
WHERE NOT salary >= 3000;

SELECT
  first_name, salary
FROM employees
WHERE NOT salary = 3000;


SELECT
  first_name, last_name, department_id
FROM employees
WHERE NOT 
    (department_id = 10
    OR department_id = 20);
SELECT AVG(salary) AS avg_salary 
FROM works;

SELECT DISTINCT company_name 
FROM Works;

SELECT department_name, location 
FROM departments 
WHERE location LIKE 'S%';


SELECT COUNT(*) AS fiction_count
FROM Books
WHERE genre = 'Fiction';

SELECT movie_name
FROM Cinema
WHERE rating > 7 AND rating < 9;


SELECT book_id, title, author, published_year 
FROM Library WHERE rating IS NULL;

SELECT employee_name, company, salary 
FROM employees
WHERE category = 'Full-Time'
ORDER BY salary DESC;


SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department;

SELECT author_id, author_name, publication_name
FROM Views
WHERE view_count = 0
ORDER BY author_id ASC;



SELECT DISTINCT p.player_name, p.score
FROM Players p
JOIN Matches m ON p.player_name = m.winner
ORDER BY p.score DESC
LIMIT 3;

SELECT 
    m.match_id,
    m.player_1,
    m.player_2,
    m.winner,
    m.match_date,
    p.score
FROM Matches m
JOIN Players p ON m.winner = p.player_name
ORDER BY m.match_date DESC
LIMIT 5;







--  INNER JOIN (Only matching rows)
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;
SELECT * FROM Employee_Project;

SELECT e.FirstName, e.LastName, e.Position, e.Salary, d.departmentName
FROM Employee AS E
INNER JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

SELECT p.ProjectName, p.Budget, ep.Role
FROM Project AS p
INNER JOIN Employee_Project AS ep
ON p.ProjectID = ep.ProjectID;

SELECT p.ProjectName, e.FirstName, e.LastName, ep.Role
FROM Project p
INNER JOIN Employee_Project ep
ON p.ProjectID = ep.ProjectID
INNER JOIN Employee e ON
ep.EmployeeID = e.EmployeeID;


-- 1. List all employees with their department names. 
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employee E
INNER JOIN Department D
ON  E.EmployeeID=D.DepartmentID;

-- 2. Show all employees and the projects they are working on.
SELECT E.firstName, E.LastName, P.ProjectName
FROM Employee E
INNER JOIN employee_project EP
ON E.EmployeeID = EP.EmployeeID
INNER JOIN project P
ON ep.ProjectID = P.ProjectID;

-- 3. Show each department and its projects.
SELECT d.DepartmentName, p.ProjectName
FROM Department d
INNER JOIN Project p 
ON d.DepartmentID = p.DepartmentID;

-- 4. List employees working on more than one project.
SELECT e.FirstName, e.LastName, COUNT(ep.ProjectID) AS Projects
FROM Employee e
INNER JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID
HAVING COUNT(ep.ProjectID) > 1;

-- 5. Show project names and the employees working on them with their roles.
SELECT p.ProjectName, e.FirstName, e.LastName, ep.Role
FROM Project p
INNER JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
INNER JOIN Employee e ON ep.EmployeeID = e.EmployeeID;

-- 6. List employees who are assigned to projects along with department name.
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employee e
INNER JOIN Department d ON e.DepartmentID = d.DepartmentID
INNER JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID;

-- 7. List all departments and number of projects under them.
SELECT d.DepartmentName, COUNT(p.ProjectID) AS TotalProjects
FROM Department d
INNER JOIN Project p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName;

-- 8. Find total salary spent on employees per department.
SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalary
FROM Department d
INNER JOIN Employee e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- 9. List projects and their budgets with department names.
SELECT p.ProjectName, d.DepartmentName, p.Budget
FROM Project p
INNER JOIN Department d ON p.DepartmentID = d.DepartmentID;

-- 10. Get employees with their assigned projects and salaries.
SELECT e.FirstName, e.LastName, p.ProjectName, e.Salary
FROM Employee e
INNER JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Project p ON ep.ProjectID = p.ProjectID;


SELECT e.FirstName, e.LastName, p.ProjectName, e.Salary
FROM Employee e
INNER JOIN Employee_Project ep 
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Project p 
ON ep.ProjectID = p.ProjectID
ORDER BY e.Salary DESC;

SELECT e.FirstName, e.LastName, p.ProjectName, e.Salary
FROM Employee e
INNER JOIN Employee_Project ep 
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Project p 
ON ep.ProjectID = p.ProjectID
WHERE e.Salary >= 70000
ORDER BY e.Salary DESC;

SELECT e.FirstName, e.LastName, p.ProjectName, e.Salary
FROM Employee e
INNER JOIN Employee_Project ep 
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Project p 
ON ep.ProjectID = p.ProjectID
WHERE e.FirstName LIKE 'A%'
ORDER BY e.Salary DESC;


SELECT e.FirstName, e.LastName, p.ProjectName, e.Salary
FROM Employee e
INNER JOIN Employee_Project ep 
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Project p 
ON ep.ProjectID = p.ProjectID
WHERE e.LastName LIKE '%e'
ORDER BY e.Salary DESC;
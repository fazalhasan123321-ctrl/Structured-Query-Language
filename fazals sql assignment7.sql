Create Database Office;

Use Office;

CREATE TABLE Employees (emp_id INT PRIMARY KEY, emp_name VARCHAR(50), department VARCHAR(50), salary INT, manager_id INT);

INSERT INTO Employees (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Arjun', 'HR', 40000, NULL),
(2, 'Neha', 'IT', 65000, 5),
(3, 'Rohan', 'IT', 55000, 5),
(4, 'Meera', 'Finance', 70000, NULL),
(5, 'Suresh', 'IT', 90000, 4),
(6, 'Alia', 'HR', 45000, 1),
(7, 'Karan', 'Finance', 75000, 4),
(8, 'Rahul', 'Marketing', 30000, NULL),
(9, 'Priya', 'Marketing', 35000, 8),
(10, 'Varun', 'IT', 50000, 5);

Select *From Employees;

/*1 List employees earning more than the average salary*/

SELECT * FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

/*2 Find employees who earn the maximum salary*/

SELECT * FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

/*3	Find employees working in the same department as ‘Neha’*/

SELECT * FROM Employees
WHERE department = (SELECT department FROM Employees WHERE emp_name = 'Neha');

/*4	List employees whose salary is higher than Suresh’s salary*/

SELECT * FROM Employees
WHERE salary > (SELECT salary FROM Employees WHERE emp_name = 'Suresh');

/*5 Show departments where the minimum salary is less than 40,000*/
SELECT department
FROM Employees
GROUP BY department
HAVING MIN(salary) < 40000;

/*6	Find employees who do not have a manager*/

SELECT * FROM Employees
WHERE manager_id IS NULL;

/*7	Find employees who report to the same manager as Rohan*/

SELECT * FROM Employees
WHERE manager_id = (SELECT manager_id FROM Employees WHERE emp_name = 'Rohan')
  AND emp_name <> 'Rohan';

/*8	List employees in IT with salary above the IT average*/

SELECT * FROM Employees
WHERE department = 'IT'
  AND salary > (SELECT AVG(salary) FROM Employees WHERE department = 'IT');

/*9	Show employees whose salary is in the bottom 3*/

SELECT * FROM Employees
ORDER BY salary ASC
LIMIT 3;

/*10 Show employees whose salary is within the top */

SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 3;

/*11 Find employees earning more than HR department average salary*/

SELECT * FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees WHERE department = 'HR');

/*12 List employees having the same salary as Priya*/

SELECT * FROM Employees
WHERE salary = (SELECT salary FROM Employees WHERE emp_name = 'Priya');

/*13 Count employees who earn below overall average*/

SELECT COUNT(*) AS below_avg_count
FROM Employees
WHERE salary < (SELECT AVG(salary) FROM Employees);

/*14 Show employees whose manager earns more than 70,000*/

SELECT e.*
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
WHERE m.salary > 70000;

/*15 Display employees in departments where more than 2 employees work*/

SELECT * FROM Employees
WHERE department IN (SELECT department FROM Employees GROUP BY department HAVING COUNT(*) > 2);

/*16 Show departments where the average salary is above company average*/
SELECT department
FROM Employees
GROUP BY department
HAVING AVG(salary) > (SELECT AVG(salary) FROM Employees);

/*17 Find the 2nd highest salary*/

SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

/*18 Employees with salary greater than the average salary of their manager’s team*/

SELECT e.*
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
WHERE e.salary >
    (SELECT AVG(salary) FROM Employees WHERE manager_id = e.manager_id);

/*19 Show employees who work in a department where Suresh works*/
SELECT * FROM Employees
WHERE department = (SELECT department FROM Employees WHERE emp_name = 'Suresh');

/*20 List employees whose manager earns the maximum salary*/

SELECT e.*
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
WHERE m.salary = (SELECT MAX(salary) FROM Employees);

/*21 Show employees whose salaries appear more than once*/

SELECT * FROM Employees
WHERE salary IN (SELECT salary FROM Employees GROUP BY salary HAVING COUNT(*) > 1);

/*22 List employees earning less than the minimum IT salary*/

SELECT * FROM Employees
WHERE salary < (SELECT MIN(salary) FROM Employees WHERE department = 'IT');

/*23 Show employees with salary higher than Finance average salary*/

SELECT * FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees WHERE department = 'Finance');

/*24 Find employees earning exactly the 3rd highest salary*/

SELECT *
FROM Employees
WHERE salary = (SELECT DISTINCT salary FROM Employees ORDER BY salary DESC LIMIT 1 OFFSET 2);

/*25 List employees having salary in the same salary group as Meera’s department*/

SELECT *
FROM Employees
WHERE salary IN (SELECT salary FROM Employees WHERE department = (SELECT department FROM Employees WHERE emp_name = 'Meera'));



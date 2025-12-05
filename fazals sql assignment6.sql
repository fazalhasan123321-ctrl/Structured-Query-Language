create database joint_questions2;

use joint_questions2;

create table employee(emp_id int, emp_name varchar(10), dept_id int, salary int);

insert into employee(emp_id, emp_name, dept_id, salary) values (1,'John',101,50000) , (2,'Emma',101,65000) , (3,'Raj',102,45000) , (4,'Meera',103,70000) , (5,'Ravi',102,48000) , (6,'Naina',103,52000) , (7,'Alex',101,58000);

select * from employee;

create table department(dept_id int, dept_name varchar(10));

insert into department(dept_id, dept_name) values (101,'Sales') , (102,'Marketing') , (103,'Finance') , (104,'HR');

select * from department;

/*1 display employee name with their department name*/

SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

/*2 List all employees including those with no matching department*/

SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.dept_id;

/*3 List all departments even if no employees*/

SELECT d.dept_name, e.emp_name
FROM department d
LEFT JOIN employee e
ON d.dept_id = e.dept_id;

/*4 Show employees from Sales department*/

SELECT e.emp_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales';

/*5 Find top 3 highest paid employees*/

SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 3;

/*6 find employees earning more than 50,000 from Marketing*/

SELECT e.emp_name, e.salary
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE e.salary > 50000
  AND d.dept_name = 'Marketing';

/*7 Count employees in each department*/

SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM department d
LEFT JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

/*8 Show departments having more than 2 employees*/

SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM department d
JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 2;

/*9 Show highest salary in each department*/

SELECT d.dept_name, MAX(e.salary) AS highest_salary
FROM department d
LEFT JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

/*10 Show employees whose salary is above department average*/

SELECT e.emp_name, e.salary, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE e.salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id);


/*11 Show employees and their departments sorted by department name*/

SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
ORDER BY d.dept_name ASC, e.emp_name ASC;

/*12 List the 2 lowest-paid employees with department names*/

SELECT e.emp_name, e.salary, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
ORDER BY e.salary ASC
LIMIT 2;

/*13 Show total salary expenditure per department*/

SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM department d
LEFT JOIN employee e ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

/*14 Show departments where total salary spent is more than 150,000*/

SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM department d
JOIN employee e ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING SUM(e.salary) > 150000;

/*15 Show employees who belong to departments starting with 'S'*/

SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE d.dept_name LIKE 'S%';

/*16 Find employees whose salary is the highest in their department*/

SELECT e.emp_name, e.salary, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE e.salary = (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id);

/*17 Show employees and department sorted by salary descending*/

SELECT e.emp_name, e.salary, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;

/*18 Count how many employees earn above 50,000 per department*/

SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM department d
JOIN employee e ON e.dept_id = d.dept_id
WHERE e.salary > 50000
GROUP BY d.dept_name;

/*19 Show employee name, department, and salary for employees between 45,000 and 60,000*/

SELECT e.emp_name, d.dept_name, e.salary
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE e.salary BETWEEN 45000 AND 60000;

/*20 Find departments with no employees*/

SELECT d.dept_name
FROM department d
LEFT JOIN employee e ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

























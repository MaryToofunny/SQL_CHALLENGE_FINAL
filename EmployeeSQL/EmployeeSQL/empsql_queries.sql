
select * from employees;
select * from dept;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from title;

--Data Analysis
--1.List the employee number, last name, first name, sex, and salary of each employee.
--(I sorted the query by salary highest to lowest)
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no
ORDER BY s.salary DESC;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
--(I sorted by hire_date)
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date LIKE '1986%'
ORDER BY hire_date;


--3.List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT e.emp_no,e.last_name,e.first_name,t.title,de.dept_no,d.dept_name
FROM employees e
INNER JOIN title t
ON e.emp_title_id =t.title_id
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN dept d
ON de.dept_no=d.dept_no
WHERE title='Manager';

		
--4.List the department number for each employee along with 
--that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no,e.last_name,e.first_name,de.dept_no,d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no=de.emp_no
INNER JOIN dept d
ON de.dept_no=d.dept_no;

--5.List first name, last name, and sex of each employee
--whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name,last_name,sex
FROM employees
WHERE first_name='Hercules' 
AND last_name like 'B%' ;

--6.List each employee in the Sales department, including their employee number, 
--last name, and first name.

SELECT emp_no,last_name,first_name
FROM employees e
WHERE emp_no IN
(
	 SELECT emp_no
	 FROM dept_emp 
	 WHERE dept_no IN
	(
		SELECT dept_no
		FROM dept
		WHERE dept_name = 'Sales'
	)
		 	
);	
		

--7.List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
	
SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name
FROM dept d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';


--8.List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name).
--QUERY JUST FOR DUPLICATE LAST NAMES
SELECT emp_no,last_name
FROM employees
WHERE last_name=last_name
ORDER BY last_name;


SELECT last_name,COUNT(last_name) AS num_dup_LastName
FROM employees
GROUP BY last_name
HAVING COUNT (last_name)>1
ORDER BY num_dup_LastName DESC;




--Module 9 Challenge
--Record Queries for the employee questions here

--Q1 Employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees
ON employees.emp_no=salaries.emp_no;

--Q2 first name, last name, and hire date for the employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date  <'1987-01-01';

--Q3 manager of each department along with their dept#, dept name, exployee#, last name and first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON dept_manager.dept_no=departments.dept_no
INNER JOIN employees
ON employees.emp_no=dept_manager.emp_no
ORDER BY dept_no;

--Q4 department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
ORDER BY emp_no;

--Q5 first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Q6 List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
WHERE dept_no = 'd007';

--Q7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--Q8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)AS "name count"
FROM employees
GROUP BY last_name
ORDER by "name count" DESC;


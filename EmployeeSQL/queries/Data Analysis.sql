-- *** DATA ANALYSIS ***
--====================//===============================================//=================================--
-- 1.List the employee number, last name, first name, sex, and salary of each employee.
--====================//===============================================//=================================--
SELECT  e.emp_no AS "Employee #",
		last_name AS "Last Name",
		first_name AS "First Name",
		sex AS "Sex",
		cast(s.salary as money) AS "Salary"
		
FROM employees e LEFT JOIN salaries s on
e.emp_no = s.emp_no;

--====================//===============================================//=================================--
-- 2.List the first name, last name, and hire date for the employees who were hired in 1986.
--====================//===============================================//=================================--
select  first_name AS "First Name",
		last_name AS "Last Name",
		to_char(hire_date::date, 'yyyy') AS "Hire Date"
FROM employees
Where to_char(hire_date::date, 'yyyy') = '1986'

--====================//===============================================//=================================--
-- 3.List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
--====================//===============================================//=================================--
SELECT m.dept_no AS "Department #",
		d.dept_name AS "Department Name",
		e.emp_no AS "Employee #",
		e.last_name AS "Last Name",
		e.first_name AS "First Name"
		
FROM dept_manager m INNER JOIN departments d on
m.dept_no = d.dept_no INNER JOIN employees e on
m.emp_no = e.emp_no 

ORDER BY m.dept_no, e.emp_no;

--====================//===============================================//=================================--
-- 4.List the department number for each employee along with that employee’s employee number, last name, 
-- first name, and department name.
--====================//===============================================//=================================--
SELECT  dp.dept_no AS "Department #",
		dp.dept_name AS "Department Name",
		e.emp_no AS "Employee #",
		e.last_name AS "Last Name",
		e.first_name AS "First Name"
		
FROM employees e INNER JOIN dept_emp d ON
e.emp_no = d.emp_no INNER JOIN departments dp ON
d.dept_no = dp.dept_no

ORDER BY  dp.dept_no, e.emp_no;

--====================//===============================================//=================================--
-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last 
-- name begins with the letter B.
--====================//===============================================//=================================--
SELECT first_name AS "First Name",
		last_name AS "Last Name",
		sex AS "Sex"
FROM employees

WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

ORDER BY last_name;

--====================//===============================================//=================================--
-- 6.List each employee in the Sales department, including their employee number, last name, and first name.
--====================//===============================================//=================================--
SELECT  e.emp_no AS "Employee #", 
		e.last_name AS "Last Name", 
		e.first_name AS "First Name"
		
FROM employees e INNER JOIN dept_emp d on
e.emp_no = d.emp_no INNER JOIN departments dp on
d.dept_no = dp.dept_no

WHERE dp.dept_name = 'Sales'

ORDER BY e.emp_no

--====================//===============================================//=================================--
-- 7.List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
--====================//===============================================//=================================--
SELECT  e.emp_no AS "Employee #", 
		e.last_name AS "Last Name", 
		e.first_name AS "First Name",
		dp.dept_name AS "Department"
		
FROM employees e INNER JOIN dept_emp d on
e.emp_no = d.emp_no INNER JOIN departments dp on
d.dept_no = dp.dept_no

WHERE dp.dept_name in ('Sales', 'Development')

ORDER BY dp.dept_name,e.emp_no

--====================//===============================================//=================================--
-- 8.List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
--====================//===============================================//=================================--
SELECT  last_name AS "Last Name", 
		COUNT(last_name) AS "Frequency"
		
FROM employees
GROUP BY last_name
ORDER BY last_name DESC


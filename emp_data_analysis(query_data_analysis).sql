--Data Analysis
--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no,e.last_name,e.first_name,e.gender,s.salary from Employees e
join Salaries s on e.emp_no = s.emp_no ;

--List employees who were hired in 1986.
select first_name,last_name,hire_date from Employees
where hire_date BETWEEN '1986-01-01' AND '1987-01-01';


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no as department_number, d.dept_name as department_name,dm.emp_no as managers_employee_number,
e.last_name,e.first_name,dm.from_date as start_date, dm.to_date as end_date
from Departments d 
join Dept_Manager dm on d.dept_no = dm.dept_no
join Employees e on dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no,e.last_name, e.first_name,d.dept_name
from Employees e
join Dept_Emp de on e.emp_no = de.emp_no
join Departments d on de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from Employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no,e.last_name, e.first_name,d.dept_name
from Employees e
join Dept_Emp de on e.emp_no = de.emp_no
join Departments d on de.dept_no = d.dept_no
and d.dept_name= 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no,e.last_name, e.first_name,d.dept_name
from Employees e
join Dept_Emp de on e.emp_no = de.emp_no
join Departments d on de.dept_no = d.dept_no
where (d.dept_name= 'Sales'
    or d.dept_name= 'Development');
	
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.	
select last_name, count(last_name) as Frequency from Employees
group by last_name order by Frequency Desc;
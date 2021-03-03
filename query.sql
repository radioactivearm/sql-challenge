-- Andy McRae 
-- March 2021

-- This is where i will query my database for hw #9



-- I want to list the following details of each employee: employee number, last name, first name, sex, and salary.
-- To do so I am going to do an inner join of employees and salaries tables on emp_no columns.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no;


-- Now I want to List first name, last name, and hire date for employees who were hired in 1986.
-- To do this i am going use a where clause.

select first_name, last_name, hire_date
from employees
where hire_date between '1986/01/01' and '1986/12/31';


-- This time I want to List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name.
-- I am going to need to use a junction table.

select d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
from departments as d
left join dept_manager as dm 
on d.dept_no = dm.dept_no
    left join employees as e 
    on dm.emp_no = e.emp_no;


-- But now I want to look at listing the department of each employee with the following information:
-- employee number, last name, first name, and department name.
-- This is similar to above execpt this time I am starting from the employee side

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e 
left join dept_emp as de 
on e.emp_no = de.emp_no 
    left join departments as d 
    on de.dept_no = d.dept_no;


-- I want to know this, List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- I am going to us a wildcard '%'

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';
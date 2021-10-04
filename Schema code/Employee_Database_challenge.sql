--Deliverable 1
	--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
	select emp_no, first_name, last_name
	from employees

	--Retrieve the title, from_date, and to_date columns from the Titles table.

	select title, from_date, to_date
	from titles

	--Create a new table using the INTO clause.

	Select e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
	--into employees_tittles
	from employees as e
	inner join titles as t
	on e.emp_no = t.emp_no;

	select et.emp_no,
		et.first_name,
		et.last_name,
		et.title,
		et.from_date,
		et.to_date
	into retirement_titles
	from employees_tittles as et
	inner join employees as e
	on et.emp_no = e.emp_no
	WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'

	-- Use Dictinct with Orderby to remove duplicate rows
	SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title

	--INTO recent_employee_titles
	FROM retirement_titles
	order by emp_no , to_date DESC

	-- Use Dictinct with Orderby to remove duplicate rows
	SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title

	INTO unique_titles
	FROM retirement_titles
	order by emp_no , to_date DESC


	select count(ut.title) as "title_count",
	title
	into retiring_titles
	from unique_titles as ut
	group by ut.title
	order by title_count DESC;
--------------------------------------------------
--Deliverable 2-----------------------------------
--------------------------------------------------
	select emp_no, first_name, last_name,birth_date
	from employees

	--Retrieve the from_date and to_date columns from the Department Employee table.
	select from_date, to_date
	from dept_emp

	--Retrieve the title column from the Titles table.
	select title 
	from titles

	select DISTINCT ON(e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
	into mentorship_eligibilty
	from employees as e
	inner join dept_emp as de
	on e.emp_no = de.emp_no
	inner join titles as t
	on e.emp_no = t.emp_no
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
		AND (de.to_date = '9999-01-01')
	order by e.emp_no;



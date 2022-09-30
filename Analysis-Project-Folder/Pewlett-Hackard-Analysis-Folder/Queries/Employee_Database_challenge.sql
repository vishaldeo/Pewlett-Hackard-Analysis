-- Creation of retirement_titles
SELECT e.emp_no, first_name, last_name , title, from_date, to_date
INTO retirement_titles
FROM employees e
inner join titles t on t.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no ,
first_name, last_name , title
FROM retirement_titles
where to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


-- Query retrieve the number of employees by their most recent job title who are about to retire.

select count(*) , title
from retirement_titles
where to_date = '9999-01-01'
group by title
order by count(*) desc;


-- Challenge 2
SELECT  DISTINCT ON (e.emp_no) e.emp_no, first_name, last_name ,birth_date, de.from_date, de.to_date, title
into mentorship_eligibilty
FROM employees e
inner join titles t on t.emp_no = e.emp_no
inner join dept_emp de on de.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and de.to_date = '9999-01-01'
order by e.emp_no ;

--Export Data
select * from mentorship_eligibilty;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';


SELECT count(*)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');;
--90398

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


select count(*) from retirement_info;

drop table retirement_info;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;



-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;



-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;



SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');



-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;


SELECT 	e.emp_no,
		e.first_name,
		e.last_name,
		e.gender,
		s.salary,
		de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);


SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);



select * from title;


drop table titles;

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(32) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no,title,from_date)
);

select * from titles;
COPY titles FROM '/Users/vsingh/Documents/UCSD/GIT/Pewlett-Hackard-Analysis1/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/titles.csv' CSV HEADER;

select count(distinct emp_no)  from titles
where to_date = '9999-01-01';



-- Challenge

SELECT e.emp_no, first_name, last_name , title, from_date, to_date
INTO retirement_titles
FROM employees e
inner join titles t on t.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

SELECT e.emp_no, first_name, last_name , title, from_date, to_date
INTO retirement_titles
FROM employees e
inner join titles t on t.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- drop table retirement_titles;

select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no ,
first_name, last_name , title
FROM retirement_titles
where to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


drop table retiring_titles;

SELECT DISTINCT ON (emp_no) emp_no ,
 title
 into retirement_titles
FROM titles
ORDER BY emp_no, to_date DESC;

-- Create file retiring_titles
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
and t.to_date = '9999-01-01'
order by e.emp_no ;

--Export Data
select count(*) , title from mentorship_eligibilty
group by title
order by title;



select count(*) ,to_char(timestamp, 'YYYY-MM') retirement_titles
;

SELECT count(*) , title,  to_char(birth_date, 'YYYY')
FROM  retirement_titles2
group by title,  to_char(birth_date, 'YYYY')
order by title, to_char(birth_date, 'YYYY');




SELECT e.emp_no, first_name, last_name , title, from_date, to_date , birth_date
INTO retirement_titles1
FROM employees e
inner join titles t on t.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no ,
first_name, last_name , title , birth_date
into retirement_titles2
FROM retirement_titles1
where to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


















select * from titles
where emp_no = 10291;


select * from dept_emp
where emp_no = 10291;

--***Start of Challenge***

SELECT a.emp_no,
    a.first_name,
	a.last_name,
    b.title,
    b.from_date,
    b.to_date
INTO retirement_titles2 
FROM employees as a
JOIN titles as b
	ON (a.emp_no = b.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- #15 to 20 in Deliverable 1
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

--***Start of Deliverable 2 Challenge 7:  Mentorship Eligibility***
SELECT DISTINCT ON (em.emp_no) em.emp_no,
    em.first_name,
	em.last_name,
	em.birth_date,
    de.from_date,
    de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as em
	JOIN dept_emp as de
		ON (em.emp_no = de.emp_no)
	INNER JOIN titles as ti
		ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND de.to_date = ('9999-01-01')
ORDER BY emp_no;
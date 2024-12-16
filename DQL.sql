-- DQL(data query language)

-- Projection
-- retrieve data from columns.

SELECT first_name, last_name, department FROM employee;

-- DISTINCT 
-- Clause used to return distinct values

-- EXPRESSION 
-- combination of operators and operands

-- ALIAS
-- alternative name given to a col/exp

SELECT distinct department as dept FROM employee;

-- Selection
-- Retrieve from both rows and col.

SELECT * FROM employee
WHERE salary > 70000;

-- Operators

-- 1. Arithmetic operators

SELECT salary+10, salary-10, salary/10, salary*2 FROM employee;

-- 2. Relational

SELECT first_name, salary>60000, salary=60000 from employee;

-- 3. Logical

SELECT salary, first_name from employee where salary>60000 and salary<70000;

SELECT salary, first_name from employee where salary>60000 or salary<70000;

-- 4. Assignment

SELECT first_name, last_name from employee where salary=60000;

-- 5. Concatenation

SELECT first_name||last_name from employee where salary=60000;

-- 6. Special operators
--     in
--     It accepts multiple values at rhs and single value at lhs

   	SELECT * from employee where salary in (60000,62000);

--     not in

	SELECT * from employee where salary not in (60000,62000);

--     -  like 
--     Used for pattern matching 

    SELECT * FROM employee WHERE first_name LIKE 'A%';

--     - not like

    SELECT * FROM employee WHERE first_name NOT LIKE 'A%';

--     - between
--     Used with range of values
--     COL/EXP BETWEEN LOW-RANGE AND HIGH-RANGE

    SELECT * FROM employee WHERE salary BETWEEN 60000 and 70000;

--     - not between

    SELECT * FROM employee WHERE salary NOT BETWEEN 60000 and 70000;

--     - is

	SELECT * FROM employee WHERE salary IS NULL;

--     - is not

	SELECT * FROM employee WHERE salary IS NOT NULL;

-- Set
-- used to merge more than one query.

-- union - merge and get unique data

SELECT first_name, last_name, department FROM employee
WHERE department = 'HR';

-- UNION

SELECT first_name, last_name, department FROM employee
WHERE salary > 70000;

-- union all - merge and get all data

SELECT first_name, last_name, department FROM employee
WHERE department = 'HR';

-- UNION ALL

SELECT first_name, last_name, department FROM employee
WHERE salary > 70000;

-- intersect - returns only common

SELECT first_name, last_name, department FROM employee
WHERE department = 'HR';

-- INTERSECT

SELECT first_name, last_name, department FROM employee
WHERE salary > 70000;

-- Subquery

-- any - used instead of in as =any

SELECT first_name, salary FROM employee
WHERE salary > ANY (SELECT salary FROM employee WHERE department = 'HR');

-- all -we cannot use multiple values at rhs while using relational operators so we use >all or<all

SELECT first_name, salary FROM employee
WHERE salary > ANY (SELECT salary FROM employee WHERE department = 'HR');

-- exists 

SELECT * FROM employee a WHERE EXISTS (SELECT 1 FROM employee b WHERE a.emp_id = b.emp_id);

-- not exists

-- Functions
-- Block of code used to perform specific task.

-- Types

-- -Single row function
-- Takes n input provides n output.
 
-- -character SRF

-- UPPER('ARG') - all caps

-- LOWER('ARG') - all small

-- INITCAP('ARG') - only first letter caps.

-- SUBSTR(OS,POS,LENG) - to extract string or letter. 

SELECT first_name, SUBSTR(first_name, 1, 3) AS short_name FROM employee;

-- REPLACE(OS,SUBS,NEWS) - to remove a string or char from original string and replace it with new string or character.

SELECT first_name, REPLACE(first_name, 'a', 'X') AS replaced_name FROM employee;

-- REGEXP_REPLACE(OS,[LETTERS]) remove all letters in the string.

SELECT first_name, REGEXP_REPLACE(first_name, '[aeiou]', '*', 'g') AS masked_name FROM employee;

-- REGEXP_REPLACE(OS,[^LETTERS]) remove string except the letters.

-- TRIM(LEADING/TRAILING/BOTH CHAR FROM OS) - to remove first/last/both letter from a string.

SELECT TRIM('   Alice   ') AS trimmed_name;

-- POSITION(subs IN original string) to find the nth occurance of a char/string in original string.

SELECT first_name, POSITION('o' IN first_name) AS position FROM employee;

-- CONCAT(ARG1,ARG2) - to concat more than 2 arg.

SELECT first_name, POSITION('o' IN first_name) AS position FROM employee;

-- REVERSE('SRT') - to reverse the string or value.

SELECT first_name, REVERSE(first_name) AS reversed_name FROM employee;

-- number SRF

-- MOD(DIVIDEND,DIVISOR) - this gives reminder value.

SELECT salary, MOD(salary, 10000) AS remainder FROM employee;

-- POWER(NUMBER,POWER VALUE) - returns nth power of a number.

SELECT POWER(salary, 2) AS squared_salary FROM employee;

-- SQRT(NUMBER) - returns square root of number.

SELECT SQRT(salary) AS salary_root FROM employee;

-- ROUND(NUMBER,SCALE) - to round of a number.
-- After point - starts with 0
-- Before point - starts with -1 
-- If n is b/w 0-4 then round off to 0
-- If n is b/w 5-9 then round off to 0 with increment of previous number

SELECT ROUND(salary, -3) AS rounded_salary FROM employee;

-- TRUNC(NUMBER,SCALE) - round of a floating point value to it's minimum value. Same as round but 0-9 round off to 0 with no increment

SELECT TRUNC(salary, -3) AS truncated_salary FROM employee;

-- date SRF

-- INTERVAL 'time'

SELECT hire_date, hire_date + INTERVAL '6 months' AS six_months_later FROM employee;

-- EXTREACT(DAYS/MONTHS/YEAR FROM AGE(date))

SELECT first_name, EXTRACT(MONTH FROM AGE(hire_date)) AS months_since_hire FROM employee;

-- general SRF

-- COALESCE(ARG1,ARG2) - replace null values in arg1 with arg2 else print arg1

-- ALTER TABLE employee ADD COLUMN email VARCHAR(100);
SELECT first_name, COALESCE(email, 'No Email') AS email_status FROM employee;

-- multi row function
-- Takes n input provides 1 output

-- MAX(ARG)

SELECT MAX(salary) AS max_salary FROM employee;

-- MIN(ARG)

SELECT MIN(salary) AS min_salary FROM employee;

-- AVG(ARG)

SELECT AVG(salary) AS avg_salary FROM employee;

-- SUM(ARG)

SELECT SUM(salary) AS total_salary FROM employee;

-- COUNT(*/COLN)

SELECT COUNT(*) AS total_employees FROM employee;

-- Group by
-- Used to group the records
-- Can only use MRF or group by coln in select

SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department;

-- Having
-- To give cond to group by
-- Can only use MRF and cond related to group by col

SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 70000;

-- Order by
-- Used to sort record in ascending or descending

SELECT * FROM employee
ORDER BY salary DESC;

-- Joins
-- used to fetch data from multiple tables simultaneously

-- types
-- cross join
-- used to retrive data from multiple tables, it returns data in the form nxn

INSERT INTO department (dept_name)
VALUES
('HR'),
('IT'),
('Finance'),
('Security');

SELECT *
FROM employee
CROSS JOIN department;

-- inner join
-- used to retrive data from multiple table when there is matching values in col common to all the tables

SELECT e.first_name, d.dept_name
FROM employee e
INNER JOIN department d
ON e.department = d.dept_name;
       
-- Natural join

SELECT *
FROM employee
NATURAL JOIN department;

-- Self join
-- Used to join self table self col multiple times
-- when that col has multiple data

SELECT e1.first_name AS employee1, e2.first_name AS employee2
FROM employee e1
JOIN employee e2
ON e1.department = e2.department
AND e1.emp_id != e2.emp_id;

-- Outer join
-- return matched , unmatched records and null values from 2 tables
-- left
-- from left table

SELECT e.first_name, d.dept_name
FROM employee e
LEFT JOIN department d
ON e.department = d.dept_name;

-- right
-- from right table

SELECT e.first_name, d.dept_name
FROM employee e
RIGHT JOIN department d
ON e.department = d.dept_name;

-- full outer

SELECT e.first_name, d.dept_name
FROM employee e
FULL OUTER JOIN department d
ON e.department = d.dept_name;

-- Views
-- views is logical stucture of a table, doesnt require space, used to achieve abstraction.

CREATE VIEW high_salary_employees AS
SELECT first_name, last_name, salary
FROM employee
WHERE salary > 75000;

SELECT * FROM high_salary_employees;

-- Materialized view 
-- this creates a physical view which takes space in database.

CREATE MATERIALIZED VIEW mat_high_salary_employees AS
SELECT first_name, last_name, salary
FROM employee
WHERE salary > 75000;

SELECT * FROM mat_high_salary_employees;

-- Sequence
-- sequence is database object used to generate numbers.

CREATE SEQUENCE emp_seq
START 6
INCREMENT 1;

INSERT INTO employee (emp_id, first_name, last_name, department, salary, hire_date)
VALUES (NEXTVAL('emp_seq'), 'Grace', 'Hopper', 'IT', 90000, '2023-01-15');

-- Triggers
-- it is a database callback function that automatically executes when specific database events (like INSERT, UPDATE, or DELETE) occur on a table.

CREATE OR REPLACE FUNCTION update_hire_date()
RETURNS TRIGGER AS $$
BEGIN
   NEW.hire_date := CURRENT_DATE;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_hire_date
BEFORE INSERT ON employee
FOR EACH ROW
EXECUTE FUNCTION update_hire_date();

INSERT INTO employee (first_name, last_name, department, salary)
VALUES ('Alan', 'Turing', 'Research', 95000);

SELECT * FROM employee WHERE first_name = 'Alan';


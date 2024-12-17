-- Indexing
-- It is a technique used to improve the performance of database queries 
-- by minimizing the data that needs to be scanned. 
-- An index is a database object that provides a faster pathway 
-- to locate specific rows in a table.

-- Types of Indexing

-- B-Tree Index

CREATE INDEX idx_employee_name ON employee (first_name);

-- Hash Index

CREATE INDEX idx_employee_salary ON employee USING hash (salary);

-- GIN (Generalized Inverted Index)

CREATE INDEX idx_employee_tags ON employee USING gin (emp_id);

-- GiST (Generalized Search Tree)

CREATE INDEX idx_location ON locations USING gist (coordinates);


-- Cursors
-- Cursors allow row-by-row processing of query results, often used in procedural programming within PL/pgSQL.

DO $$
DECLARE
    emp_cursor CURSOR FOR SELECT emp_id, first_name, salary FROM employee;
    emp_record RECORD;
BEGIN
    -- Open and Fetch Rows
    FOR emp_record IN emp_cursor LOOP
        RAISE NOTICE 'ID: %, Name: %, Salary: %', emp_record.emp_id, emp_record.first_name, emp_record.salary;
    END LOOP;

    -- Close the Cursor
    CLOSE emp_cursor;
END;
$$ LANGUAGE plpgsql;

-- Stored Procedures
-- Stored procedures are precompiled SQL code stored in the database for reuse. Unlike functions, stored procedures allow transaction control (e.g., COMMIT, ROLLBACK).

CREATE OR REPLACE PROCEDURE update_salaries(dept_name VARCHAR, increment NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Update salaries for a specific department
    UPDATE employee
    SET salary = salary + increment
    WHERE department = dept_name;

    -- Log the operation
    RAISE NOTICE 'Salaries updated for department: %', dept_name;
END;
$$;

CALL update_salaries('IT', 5000);
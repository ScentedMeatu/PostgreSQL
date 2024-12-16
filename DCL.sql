-- DCL(data control language)
-- Used to control flow of data.

-- Grant

CREATE USER admin;
GRANT CONNECT ON DATABASE trail TO admin;

GRANT USAGE ON SCHEMA public TO admin;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;

GRANT ALL PRIVILEGES ON DATABASE trail TO admin;

ALTER USER admin CREATEDB;

ALTER USER admin WITH SUPERUSER;

-- Revoke

REVOKE DELETE ON employee FROM admin;

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
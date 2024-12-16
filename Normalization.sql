-- Normalization
-- Normalization is a systematic process of organizing data in a database to reduce redundancy
--  and improve data integrity. It involves dividing large tables into smaller ones 
--  and defining relationships between them. This ensures efficient data storage 
--  and minimizes anomalies during data operations.

-- Types of Normalization

-- 1. First Normal Form (1NF)
-- A table is in 1NF if:
-- It contains only atomic (indivisible) values.
-- Each column contains values of a single type.
-- Each record is unique (has a primary key).

-- 2. Second Normal Form (2NF)
-- A table is in 2NF if:
-- It is in 1NF.
-- All non-prime attributes are fully functionally dependent on the primary key (no partial dependencies).

-- 3. Third Normal Form (3NF)
-- A table is in 3NF if:
-- It is in 2NF.
-- There are no transitive dependencies (non-prime attributes depend only on the primary key).
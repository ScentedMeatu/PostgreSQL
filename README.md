## PostgreSQL
### what is relational database?

the database which use relational algebra as foundation.

the relational algebra contains these following operations:

1. Selection(σ): selecting rows based on condition.

2. Projection(π): selecting columns based on condition.

3. Union(U): combine the results of 2 queries into single result but the condition is both data should have same data types.

4. Set difference(-): provides row present in one table but not in another. π(col of same data type)table1 - π(col of same data type)table2 = removes same rows and presents only rows of table1 not present in table 2.

5. Set intersection(∩): allows to fetch similar data in columns of two table.

6. Rename(ρ): it allows to temporarily rename a table or col.

7. Cross product(X): combine every row of column of one table with every row of column of another table. (cross join)

rows - tuples

columns - attribute 

cell is intersection space b/w row and column

there is table - table connection

high secure

less data redundancy

normalization is available

### Database schema

Database cluster > Multiple databases > multiple tables > multiple rows > multiple columns > each column is a data type.

data - raw fact which describes attribute of an entity.

database - container used to store the data.

sql - query language used to interact with the database.

DBMS - database management system is software which follows CRUD operation.

CRUD - create/insert, read/display, update/modify, delete/drop.

relational model - data model which specifies that data should be stored in the from of table. / a data model which follows the principles of relational algebra.

### Data types

Data types: keywords which specifies what types of data is allowed in the column.

integer - size 4bytes, fixed memory allocation, allows -2,147,483,648 to 2,147,483,647.

bigint - size 8bytes, fixed memory allocation, allows -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807.

decimal(p,s) - variable memory allocation, allows A numeric type with user-defined precision (p) and scale (s), -10^38 +1 to 10^38 -1 with up to 38 digits of precision.

numeric(p,s) - same as decimal.

real - size 4 bytes, allows floating point number, 1.701411734 × 10^38 (max) to -1.701411734 × 10^38 (min).

double - size 8 bytes, allows floating point number, 1.7976931348623157 × 10^308 (max) to -1.7976931348623157 × 10^308 (min).

serial - size 4 bytes, auto incrementing number usually used as pk 

Char - size n + 1 bytes(1 byte per character plus 1 byte for length), fixed memory allocation, allows numbers, alphabets, symbols, max 8000 bytes.

Varchar - 1 + actual length(1 byte for length), max 8000 bytes.

text - same as varchar but no limit.

boolean - true or false.

Date - dd-mmm-yy or dd-mmm-yyyy.

Timestamp - both time and date, timestamp default systimestamp for giving current time and date.

### Constraints

Constraints: rules used to restrict the data in the column.

Unique - allows only unique values.

Not null - no null values.

Primary key - combo of unique and not null.

Foreign key - establish relationship between 2 tables, foreign key (coln) references ptb(coln);

Default - can use default values instead of null.

Check - used to give condition to the column.

### TCL(transition control language)

```
......
commit    <-|-------|
......      |       |
rollback  --|       |
......              |
save point s1 <--|  |
......           |  |
save point s2    |  |
......           |  |
rollback s1   ---|  |
or                  |
rollback         ---|
```


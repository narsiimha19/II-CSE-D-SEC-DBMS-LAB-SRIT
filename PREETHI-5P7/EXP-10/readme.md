# ---------EXPERIMENT-10---------
# Create an EMPLOYEE table and perform search operations using both non-in- dexing and indexing techniques. Compare the execution plans before and after creating an index.
```
CREATE TABLE employee (
    employee_id   NUMBER(6) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![output](op100.png)

```
INSERT INTO employee VALUES (1001, 'Ravi',   'CSE', 30000);
INSERT INTO employee VALUES (1002, 'Sita',   'ECE', 35000);
INSERT INTO employee VALUES (1003, 'Kiran',  'EEE', 40000);
INSERT INTO employee VALUES (1004, 'Anjali', 'CSE', 45000);
INSERT INTO employee VALUES (1005, 'Rahul',  'ECE', 38000);
INSERT INTO employee VALUES (1006, 'Priya',  'CSE', 50000);
INSERT INTO employee VALUES (1007, 'Arun',   'EEE', 42000);
INSERT INTO employee VALUES (1008, 'Sneha',  'CSE', 48000);
INSERT INTO employee VALUES (1009, 'Vijay',  'ECE', 36000);
INSERT INTO employee VALUES (1010, 'Divya',  'CSE', 52000);

COMMIT;
```
![output](op101.png)
![output](op102.png)

```
SELECT * FROM employee
WHERE employee_name = 'Ravi';
```
![output](op104.png)

```
EXPLAIN PLAN FOR
SELECT * FROM employee
WHERE employee_name = 'Ravi';

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```
![output](op105.png)

```
CREATE INDEX idx_employee_name
ON employee(employee_name);

SELECT * FROM employee
WHERE employee_name = 'Ravi';
```
![output](op106.png)

```
BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(USER, 'EMPLOYEE');
END;
/
```
![output](op103.png)


```
EXPLAIN PLAN FOR
SELECT * FROM employee
WHERE employee_name = 'Ravi';

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

DROP INDEX idx_employee_name;
```
![output](op107.png)


```
SELECT index_name
FROM user_indexes
WHERE index_name = 'IDX_EMPLOYEE_NAME';
```
![output](op108.png)

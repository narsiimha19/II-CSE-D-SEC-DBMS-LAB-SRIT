# creating table emp
```
CREATE TABLE employee (
    employee_id   NUMBER(6) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![output](10-01.png)

# inserting
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
![output](10-02.png)

# verifying
```
SELECT * FROM employee;
```
![output](10-03.png)
# Execute search query without an index
```
SELECT *
FROM employee
WHERE employee_name = 'Ravi';
```
![output](10-04.png)
# display
```
EXPLAIN PLAN FOR
SELECT *
FROM employee
WHERE employee_name = 'Ravi';

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);


```
![output](10-05.png)
# create index search 
```
CREATE INDEX idx_employee_name
ON employee(employee_name);
```
![output](10-06.png)
# execute name
```
SELECT *
FROM employee
WHERE employee_name = 'Ravi';
```
![output](10-07.png)
# display 
```
BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(
        USER,
        'EMPLOYEE'
    );
END;
/
```
![output](10-08.png)
# generate again
```
EXPLAIN PLAN FOR
SELECT *
FROM employee
WHERE employee_name = 'Ravi';

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);
```
![output](10-09.png)
# drop index
```
DROP INDEX idx_employee_name;
```
![output](10-10.png)

# verify index
```
SELECT index_name
FROM user_indexes
WHERE index_name = 'IDX_EMPLOYEE_NAME';
```
![output](10-11.png)

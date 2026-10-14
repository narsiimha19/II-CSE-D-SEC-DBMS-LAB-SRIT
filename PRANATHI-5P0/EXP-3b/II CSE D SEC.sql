CREATE TABLE employees (
    employee_id NUMBER(5),
    first_name VARCHAR2(20),
    last_name VARCHAR2(20),
    gender CHAR(1),
    job_id VARCHAR2(15),
    department VARCHAR2(30),
    salary NUMBER(8,2),
    commission NUMBER(5,2),
    hire_date DATE,
    city VARCHAR2(20)
);

INSERT INTO employees VALUES (101, 'John', 'Smith', 'M', 'IT_PROG', 'IT', 65000, 5,
TO_DATE('15-JAN-2020', 'DD-MON-YYYY'), 'Hyderabad');
INSERT INTO employees VALUES (102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR', 52000, 3,
TO_DATE('10-JUN-2019', 'DD-MON-YYYY'), 'Bengaluru');
INSERT INTO employees VALUES (103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales', 48000, 8,
TO_DATE('25-AUG-2021', 'DD-MON-YYYY'), 'Chennai');
INSERT INTO employees VALUES (104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing', 72000, 10,
TO_DATE('05-MAR-2018', 'DD-MON-YYYY'), 'Hyderabad');
INSERT INTO employees VALUES (105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance', 58000, NULL,
TO_DATE('18-DEC-2017', 'DD-MON-YYYY'), 'Mumbai');
INSERT INTO employees VALUES (106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT', 69000, 6,
TO_DATE('12-NOV-2022', 'DD-MON-YYYY'), 'Pune');
INSERT INTO employees VALUES (107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales', 45000, 4,
TO_DATE('20-JUL-2023', 'DD-MON-YYYY'), 'Delhi');
INSERT INTO employees VALUES (108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR', 50000, NULL,
TO_DATE('09-FEB-2021', 'DD-MON-YYYY'), 'Hyderabad');
INSERT INTO employees VALUES (109, 'Lakshmi', 'Nair', 'F', 'IT_PROG', 'IT', 76000, 7,
TO_DATE('14-SEP-2016', 'DD-MON-YYYY'), 'Kochi');
INSERT INTO employees VALUES (110, 'Arjun', 'Singh', 'M', 'MK_MAN', 'Marketing', 68000, 5,
TO_DATE('30-APR-2019', 'DD-MON-YYYY'), 'Jaipur');

COMMIT;

CREATE VIEW emp_view AS
SELECT * FROM employees;

CREATE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary
FROM employees;

SELECT * FROM emp_view;

CREATE VIEW it_employees AS
SELECT * FROM employees
WHERE department = 'IT';

CREATE VIEW high_salary AS
SELECT * FROM employees
WHERE salary > 60000;

CREATE VIEW hyderabad_emp AS
SELECT * FROM employees
WHERE city = 'Hyderabad';

CREATE VIEW female_emp AS
SELECT * FROM employees
WHERE gender = 'F';

CREATE VIEW recent_employees AS
SELECT * FROM employees
WHERE hire_date >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

SELECT employee_id, first_name, salary
FROM high_salary;

CREATE OR REPLACE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary, city
FROM employees;

CREATE VIEW emp_salary_view AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WITH READ ONLY;

CREATE VIEW sales_emp AS
SELECT * FROM employees
WHERE department = 'Sales'
WITH CHECK OPTION;

UPDATE emp_basic
SET salary = 70000
WHERE employee_id = 101;

DELETE FROM emp_view
WHERE employee_id = 107;

INSERT INTO emp_basic 
VALUES (111, 'Ravi', 'Kumar', 'IT', 55000, 'Hyderabad');

DESC emp_basic;

SELECT * FROM it_employees;

SELECT * FROM high_salary
WHERE salary > 70000;

SELECT * FROM female_emp;

SELECT first_name, salary
FROM hyderabad_emp;

DROP VIEW emp_view;

DROP VIEW high_salary;

DROP VIEW emp_basic;

CREATE VIEW hr_employees AS
SELECT * FROM employees
WHERE department = 'HR';

CREATE VIEW marketing_emp AS
SELECT employee_id, first_name, department, salary
FROM employees
WHERE department = 'Marketing';

CREATE VIEW top_earners AS
SELECT * FROM employees
WHERE salary > 70000;

CREATE VIEW emp_city AS
SELECT employee_id, first_name, last_name, city
FROM employees;
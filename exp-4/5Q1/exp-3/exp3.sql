
--Exp-3a
CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID NUMBER(5),
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(20),
    GENDER CHAR(1),
    JOB_ID VARCHAR2(15),
    DEPARTMENT VARCHAR2(30),
    SALARY NUMBER(8,2),
    COMMISSION NUMBER(5,2),
    HIRE_DATE DATE,
    CITY VARCHAR2(20)
);
INSERT INTO EMPLOYEE VALUES
(101, 'John', 'Smith', 'M', 'IT_PROG', 'IT', 65000, 5, '15-JAN-2020', 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR', 52000, 3, '10-JUN-2019', 'Bengaluru');

INSERT INTO EMPLOYEE VALUES
(103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales', 48000, 8, '25-AUG-2021', 'Chennai');

INSERT INTO EMPLOYEE VALUES
(104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing', 72000, 10, '05-MAR-2018', 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance', 58000, NULL, '18-DEC-2017', 'Mumbai');

INSERT INTO EMPLOYEE VALUES
(106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT', 69000, 6, '12-NOV-2022', 'Pune');

INSERT INTO EMPLOYEE VALUES
(107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales', 45000, 4, '20-JUL-2023', 'Delhi');

INSERT INTO EMPLOYEE VALUES
(108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR', 50000, NULL, '09-FEB-2021', 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(109, 'Lakshmi', 'Nair', 'F', 'IT_PROG', 'IT', 76000, 7, '14-SEP-2016', 'Kochi');

INSERT INTO EMPLOYEE VALUES
(110, 'Arjun', 'Singh', 'M', 'MK_MAN', 'Marketing', 68000, 5, '30-APR-2019', 'Jaipur');
 
SELECT employee_id, first_name,
       TO_CHAR(hire_date, 'DD-MON-YYYY') AS hire_date
FROM EMPLOYEE;

SELECT employee_id, first_name,
       TO_CHAR(salary, 'L99999.99') AS salary
FROM EMPLOYEE;

SELECT employee_id, first_name,
       TO_NUMBER(salary) + 5000 AS new_salary
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
WHERE hire_date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

SELECT first_name || ' ' || last_name AS full_name
FROM EMPLOYEE;

SELECT CONCAT(first_name, last_name) AS full_name
FROM EMPLOYEE;

SELECT LPAD(first_name, 10, '*') AS first_name
FROM EMPLOYEE;

SELECT RPAD(first_name, 10, '*') AS first_name
FROM EMPLOYEE;

SELECT LTRIM(first_name) AS first_name
FROM EMPLOYEE;

SELECT RTRIM(first_name) AS first_name
FROM EMPLOYEE;

SELECT LOWER(first_name) AS first_name
FROM EMPLOYEE;

SELECT UPPER(first_name) AS first_name
FROM EMPLOYEE;

SELECT INITCAP(first_name) AS first_name
FROM EMPLOYEE;

SELECT first_name, LENGTH(first_name) AS name_length
FROM EMPLOYEE;

SELECT first_name,
       SUBSTR(first_name, 1, 3) AS first_three_chars
FROM EMPLOYEE;

SELECT first_name,
       INSTR(LOWER(first_name), 'a') AS position_of_a
FROM EMPLOYEE;

SELECT employee_id, first_name, last_name, gender,
       job_id, department, salary, commission,
       hire_date, city, SYSDATE AS current_date
FROM EMPLOYEE;

SELECT employee_id, first_name, hire_date,
       NEXT_DAY(hire_date, 'MONDAY') AS next_monday
FROM EMPLOYEE;

SELECT employee_id, first_name, hire_date,
       ADD_MONTHS(hire_date, 6) AS date_after_6_months
FROM EMPLOYEE;

SELECT employee_id, first_name, hire_date,
       LAST_DAY(hire_date) AS last_day_of_month
FROM EMPLOYEE;

SELECT employee_id, first_name, hire_date,
       MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked
FROM EMPLOYEE;

SELECT employee_id, first_name, salary,
       LEAST(salary, 60000) AS smaller_value
FROM EMPLOYEE;

SELECT employee_id, first_name, salary,
       GREATEST(salary, 60000) AS greater_value
FROM EMPLOYEE;

SELECT employee_id, first_name, hire_date,
       TRUNC(hire_date, 'MONTH') AS first_day_of_month
FROM EMPLOYEE;

SELECT employee_id, first_name, hire_date,
       ROUND(hire_date, 'MONTH') AS rounded_month
FROM EMPLOYEE;

SELECT employee_id, first_name, hire_date,
       TO_CHAR(hire_date, 'DAY, DD-MON-YYYY') AS formatted_hire_date
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
WHERE hire_date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');

COMMIT;


--Exp-3b

CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID NUMBER(5),
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(20),
    GENDER CHAR(1),
    JOB_ID VARCHAR2(15),
    DEPARTMENT VARCHAR2(30),
    SALARY NUMBER(8,2),
    COMMISSION NUMBER(5,2),
    HIRE_DATE DATE,
    CITY VARCHAR2(20)
);
INSERT INTO EMPLOYEE VALUES
(101, 'John', 'Smith', 'M', 'IT_PROG', 'IT', 65000, 5, '15-JAN-2020', 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR', 52000, 3, '10-JUN-2019', 'Bengaluru');

INSERT INTO EMPLOYEE VALUES
(103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales', 48000, 8, '25-AUG-2021', 'Chennai');

INSERT INTO EMPLOYEE VALUES
(104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing', 72000, 10, '05-MAR-2018', 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance', 58000, NULL, '18-DEC-2017', 'Mumbai');

INSERT INTO EMPLOYEE VALUES
(106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT', 69000, 6, '12-NOV-2022', 'Pune');

INSERT INTO EMPLOYEE VALUES
(107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales', 45000, 4, '20-JUL-2023', 'Delhi');

INSERT INTO EMPLOYEE VALUES
(108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR', 50000, NULL, '09-FEB-2021', 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(109, 'Lakshmi', 'Nair', 'F', 'IT_PROG', 'IT', 76000, 7, '14-SEP-2016', 'Kochi');

INSERT INTO EMPLOYEE VALUES
(110, 'Arjun', 'Singh', 'M', 'MK_MAN', 'Marketing', 68000, 5, '30-APR-2019', 'Jaipur');
 

CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEE;

CREATE VIEW EMP_BASIC AS
SELECT employee_id, first_name, last_name, department, salary
FROM EMPLOYEE;

SELECT *
FROM EMP_VIEW;

CREATE VIEW IT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE department = 'IT';

CREATE VIEW HIGH_SALARY AS
SELECT *
FROM EMPLOYEE
WHERE salary > 60000;

CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEE
WHERE city = 'Hyderabad';

CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEE
WHERE gender = 'F';

CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE hire_date >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

SELECT employee_id, first_name, salary
FROM HIGH_SALARY;

CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT employee_id, first_name, last_name, department, salary, city
FROM EMPLOYEE;

CREATE VIEW EMP_SALARY_VIEW AS
SELECT employee_id, first_name, last_name, salary
FROM EMPLOYEE
WITH READ ONLY;

CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEE
WHERE department = 'Sales'
WITH CHECK OPTION;

UPDATE EMP_BASIC
SET salary = 75000
WHERE employee_id = 101;

DELETE FROM EMP_VIEW
WHERE employee_id = 107;


Using a sample salary of 50000:
INSERT INTO EMP_BASIC
(employee_id, first_name, last_name, department, salary)
VALUES
(111, 'Ravi', 'Kumar', 'IT', 50000);

DESC EMP_BASIC;

SELECT *
FROM IT_EMPLOYEES;

SELECT *
FROM HIGH_SALARY
WHERE salary > 70000;

SELECT *
FROM FEMALE_EMP;

SELECT first_name, salary
FROM HYDERABAD_EMP;

DROP VIEW EMP_VIEW;

DROP VIEW HIGH_SALARY;

DROP VIEW EMP_BASIC;

CREATE VIEW HR_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE department = 'HR';

CREATE VIEW MARKETING_EMP AS
SELECT employee_id, first_name, department, salary
FROM EMPLOYEE
WHERE department = 'Marketing';

CREATE VIEW TOP_EARNERS AS
SELECT *
FROM EMPLOYEE
WHERE salary > 70000;

CREATE VIEW EMP_CITY AS
SELECT employee_id, first_name, last_name, city
FROM EMPLOYEE;

COMMIT;

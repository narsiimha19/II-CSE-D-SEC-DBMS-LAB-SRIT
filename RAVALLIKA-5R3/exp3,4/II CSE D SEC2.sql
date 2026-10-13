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

INSERT INTO employees VALUES
(101, 'John', 'Smith', 'M', 'IT_PROG', 'IT', 65000, 5,
TO_DATE('15-JAN-2020', 'DD-MON-YYYY'), 'Hyderabad');

INSERT INTO employees VALUES
(102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR', 52000, 3,
TO_DATE('10-JUN-2019', 'DD-MON-YYYY'), 'Bengaluru');

INSERT INTO employees VALUES
(103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales', 48000, 8,
TO_DATE('25-AUG-2021', 'DD-MON-YYYY'), 'Chennai');

INSERT INTO employees VALUES
(104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing', 72000, 10,
TO_DATE('05-MAR-2018', 'DD-MON-YYYY'), 'Hyderabad');

INSERT INTO employees VALUES
(105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance', 58000, NULL,
TO_DATE('18-DEC-2017', 'DD-MON-YYYY'), 'Mumbai');

INSERT INTO employees VALUES
(106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT', 69000, 6,
TO_DATE('12-NOV-2022', 'DD-MON-YYYY'), 'Pune');

INSERT INTO employees VALUES
(107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales', 45000, 4,
TO_DATE('20-JUL-2023', 'DD-MON-YYYY'), 'Delhi');

INSERT INTO employees VALUES
(108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR', 50000, NULL,
TO_DATE('09-FEB-2021', 'DD-MON-YYYY'), 'Hyderabad');

INSERT INTO employees VALUES
(109, 'Lakshmi', 'Nair', 'F', 'IT_PROG', 'IT', 76000, 7,
TO_DATE('14-SEP-2016', 'DD-MON-YYYY'), 'Kochi');


INSERT INTO employees VALUES
(110, 'Arjun', 'Singh', 'M', 'MK_MAN', 'Marketing', 68000, 5,
TO_DATE('30-APR-2019', 'DD-MON-YYYY'), 'Jaipur');

COMMIT;

SELECT employee_id, first_name,
TO_CHAR(hire_date, 'DD-MON-YYYY')
FROM employees;

SELECT employee_id, first_name,
TO_CHAR(salary, '$99,999.99')
FROM employees;

SELECT employee_id, first_name,
TO_NUMBER(TO_CHAR(salary)) + 5000
FROM employees;

SELECT *
FROM employees
WHERE hire_date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

SELECT first_name || ' ' || last_name
FROM employees;

SELECT CONCAT(first_name, last_name)
FROM employees;

SELECT LPAD(first_name, 20, '*')
FROM employees;

SELECT RPAD(first_name, 20, '*')
FROM employees;

SELECT LTRIM(first_name)
FROM employees;

SELECT RTRIM(first_name)
FROM employees;

SELECT LOWER(first_name)
FROM employees;

SELECT UPPER(first_name)
FROM employees;

SELECT INITCAP(first_name)
FROM employees;

SELECT first_name, LENGTH(first_name)
FROM employees;

SELECT first_name, SUBSTR(first_name, 1, 3)
FROM employees;

SELECT first_name, INSTR(first_name, 'a')
FROM employees;

SELECT employee_id, first_name, last_name, SYSDATE
FROM employees;

SELECT first_name, hire_date,
NEXT_DAY(hire_date, 'MONDAY')
FROM employees;

SELECT first_name, hire_date,
ADD_MONTHS(hire_date, 6)
FROM employees;

SELECT first_name, hire_date,
LAST_DAY(hire_date)
FROM employees;

SELECT first_name,
MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees;

SELECT first_name, salary,
LEAST(salary, 60000)
FROM employees;

SELECT first_name, salary,
GREATEST(salary, 60000)
FROM employees;

SELECT first_name, hire_date,
TRUNC(hire_date, 'MONTH')
FROM employees;

SELECT first_name, hire_date,
ROUND(hire_date, 'MONTH')
FROM employees;

SELECT first_name,
TO_CHAR(hire_date, 'DAY, DD-MON-YYYY')
FROM employees;

SELECT *
FROM employees
WHERE hire_date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');
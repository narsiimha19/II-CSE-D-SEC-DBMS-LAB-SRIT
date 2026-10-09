CREATE TABLE employee (
    employee_id NUMBER(5) PRIMARY KEY,
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

INSERT INTO employee VALUES
(101, 'John', 'Smith', 'M', 'IT_PROG', 'IT', 6500, 5,
TO_DATE('15-JAN-2020','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO employee VALUES
(102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR', 5200, 3,
TO_DATE('10-JUN-2019','DD-MON-YYYY'), 'Bengaluru');

INSERT INTO employee VALUES
(103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales', 4800, 8,
TO_DATE('25-AUG-2021','DD-MON-YYYY'), 'Chennai');

INSERT INTO employee VALUES
(104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing', 7200, 10,
TO_DATE('05-MAR-2018','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO employee VALUES
(105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance', 5800, NULL,
TO_DATE('18-DEC-2017','DD-MON-YYYY'), 'Mumbai');

INSERT INTO employee VALUES
(106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT', 6900, 6,
TO_DATE('12-NOV-2022','DD-MON-YYYY'), 'Pune');

INSERT INTO employee VALUES
(107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales', 4500, 4,
TO_DATE('20-JUL-2023','DD-MON-YYYY'), 'Delhi');

INSERT INTO employee VALUES
(108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR', 5000, NULL,
TO_DATE('09-FEB-2021','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO employee VALUES
(109, 'Lakshmi', 'Nair', 'F', 'IT_PROG', 'IT', 7600, 7,
TO_DATE('14-SEP-2016','DD-MON-YYYY'), 'Kochi');

INSERT INTO employee VALUES
(110, 'Arjun', 'Singh', 'M', 'MK_MAN', 'Marketing', 6800, 5,
TO_DATE('30-APR-2019','DD-MON-YYYY'), 'Jaipur');

COMMIT;

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
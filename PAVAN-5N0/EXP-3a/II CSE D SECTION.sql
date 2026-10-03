1.SELECT employee_id, first_name, TO_CHAR(hire_date, 'DD-MON-YYYY')
FROM employee;
2.SELECT employee_id, first_name, TO_CHAR(salary, 'L999,999.00')
FROM employee;
3.SELECT employee_id, first_name, TO_NUMBER(TO_CHAR(salary)) + 5000 AS new_salary
FROM employee;
4.SELECT *
FROM employee
WHERE hire_date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
5.SELECT first_name || ' ' || last_name AS full_name
FROM employee;
6.SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS full_name
FROM employee;
7.SELECT LPAD(first_name, 10, '*')
FROM employee;
8.SELECT RPAD(first_name, 10, '*')
FROM employee;
9.SELECT LTRIM(first_name)
FROM employee;
10.SELECT RTRIM(first_name)
FROM employee;
11.SELECT LOWER(first_name)
FROM employee;
12.SELECT UPPER(first_name)
FROM employee;
13.SELECT INITCAP(first_name)
FROM employee;
14.SELECT first_name, LENGTH(first_name) AS name_length
FROM employee;
15.SELECT first_name, SUBSTR(first_name, 1, 3) AS first_three
FROM employee;
16.SELECT first_name, INSTR(LOWER(first_name), 'a') AS position
FROM employee;
17.SELECT employee_id, first_name, last_name, SYSDATE
FROM employee;
18.SELECT first_name, hire_date,
       NEXT_DAY(hire_date, 'MONDAY') AS next_monday
FROM employee;
19.SELECT first_name, hire_date,
       ADD_MONTHS(hire_date, 6) AS new_date
FROM employee;
20.SELECT first_name, hire_date,
       LAST_DAY(hire_date) AS last_day
FROM employee;
21.SELECT first_name,
       MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked
FROM employee;
22.SELECT first_name, LEAST(salary, 60000) AS smaller_value
FROM employee;
23.SELECT first_name, GREATEST(salary, 60000) AS greater_value
FROM employee;
24.SELECT first_name, hire_date,
       TRUNC(hire_date, 'MM') AS first_day
FROM employee;
25.SELECT first_name, hire_date,
       ROUND(hire_date, 'MM') AS rounded_date
FROM employee;
26.SELECT first_name,
       TO_CHAR(hire_date, 'DAY, DD-MON-YYYY') AS hire_date
FROM employee;
 27.SELECT *
FROM employee
WHERE hire_date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');
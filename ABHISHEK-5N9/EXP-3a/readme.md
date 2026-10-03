# 3a Q1. Display Employee ID, First Name and Hire Date in DD-MON-YYYY format
```
```
```
SELECT employee_id, first_name, TO_CHAR(hire_date, 'DD-MON-YYYY')
FROM employee;
```
![OUTPUT](1.jpeg)
```
# Q2. Display Employee ID, First Name and Salary with currency symbol
```
```
SELECT employee_id, first_name, TO_CHAR(salary, 'L999,999.00')
FROM employee;
```
![OUTPUT](2.jpeg)
```
# Q3. Add 5000 to each employee's salary using TO_NUMBER
```
```
SELECT employee_id, first_name, TO_NUMBER(TO_CHAR(salary)) + 5000 AS new_salary
FROM employee;
```
![OUTPUT](3.jpeg)
```
# Q4. Display employees hired after 01-JAN-2020
```
```
SELECT *
FROM employee
WHERE hire_date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```
![OUTPUT](4.jpeg)
```
# Q5. Concatenate first name and last name using ||
```
```
SELECT first_name || ' ' || last_name AS full_name
FROM employee;
```
![OUTPUT](5.jpeg)
```
# Q6. Concatenate first name and last name using CONCAT
```
```
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS full_name
FROM employee;
```
![OUTPUT](6.jpeg)
```
# Q7. Left-pad first name with *
```
```
SELECT LPAD(first_name, 10, '*')
FROM employee;
```
![OUTPUT](7.jpeg)
```
# Q8. Right-pad first name with *
```
```
SELECT RPAD(first_name, 10, '*')
FROM employee;
```
![OUTPUT](8.jpeg)
```
# Q9. Remove leading spaces using LTRIM
```
```
SELECT LTRIM(first_name)
FROM employee;
```
![OUTPUT](9.jpeg)
```
# Q10. Remove trailing spaces using RTRIM
```
```
SELECT RTRIM(first_name)
FROM employee;
```
![OUTPUT](10.jpeg)
```
# Q11. Display first names in lowercase
```
```
SELECT LOWER(first_name)
FROM employee;
```
![OUTPUT](11.jpeg)
```
# Q12. Display first names in uppercase
```
```
SELECT UPPER(first_name)
FROM employee;
```
![OUTPUT](12.jpeg)
```
# Q13. Display first names in proper case
```
```
SELECT INITCAP(first_name)
FROM employee;
```
![OUTPUT](13.jpeg)
```
# Q14. Display length of each first name
```
```
SELECT first_name, LENGTH(first_name) AS name_length
FROM employee;
```
![OUTPUT](14.jpeg)
```
# Q15. Display first three characters of each first name
```
```
SELECT first_name, SUBSTR(first_name, 1, 3) AS first_three
FROM employee;
```
![OUTPUT](15.jpeg)
```
# Q16. Find position of character a in each first name
```
```
SELECT first_name, INSTR(LOWER(first_name), 'a') AS position
FROM employee;
```
![OUTPUT](16.jpeg)
```
# Q17. Display current system date with employee details
```
```
SELECT employee_id, first_name, last_name, SYSDATE
FROM employee;
```
![OUTPUT](17.jpeg)
```
# Q18. Display next Monday after each employee's hire date
```
```
SELECT first_name, hire_date,
       NEXT_DAY(hire_date, 'MONDAY') AS next_monday
FROM employee;
```
![OUTPUT](18.jpeg)
```
# Q19. Add six months to each employee's hire date
```
```
SELECT first_name, hire_date,
       ADD_MONTHS(hire_date, 6) AS new_date
FROM employee;
```
![OUTPUT](19.jpeg)
```
# Q20. Display last day of the month of each employee's hire date
```
```
SELECT first_name, hire_date,
       LAST_DAY(hire_date) AS last_day
FROM employee;
```
![OUTPUT](20.jpeg)
```
# Q21. Calculate total number of months each employee has worked
```
```
SELECT first_name,
       MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked
FROM employee;
```
![OUTPUT](21.jpeg)
```
# Q22. Display smaller value between salary and 60000
```
```
SELECT first_name, LEAST(salary, 60000) AS smaller_value
FROM employee;
```
![OUTPUT](22.jpeg)
```
# Q23. Display greater value between salary and 60000
```
```
SELECT first_name, GREATEST(salary, 60000) AS greater_value
FROM employee;
```
![OUTPUT](23.jpeg)
```
# Q24. Display first day of the month of hire date
```
```
SELECT first_name, hire_date,
       TRUNC(hire_date, 'MM') AS first_day
FROM employee;
```
![OUTPUT](24.jpeg)
```
# Q25. Round each employee's hire date to nearest month
```
```
SELECT first_name, hire_date,
       ROUND(hire_date, 'MM') AS rounded_date
FROM employee;
```
![OUTPUT](25.jpeg)
```
# Q26. Display hire date as DAY, DD-MON-YYYY
```
```
SELECT first_name,
       TO_CHAR(hire_date, 'DAY, DD-MON-YYYY') AS hire_date
FROM employee;
```
![OUTPUT](26.jpeg)
```
# Q27. Display employees hired before 01-JAN-2019
```
```
SELECT *
FROM employee
WHERE hire_date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');
```
![OUTPUT](27.jpeg)
```














# (3a) Creation and insertion of employee database
```
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

```
![output](op01.png)
![output](op02.png)
![output](op02.png)

# (3a) 1. Write an SQL query to display the employee ID, first name, and hire date in the format DD-MON-YYYY using the TO_CHAR function.
```
SELECT Employee_ID, First_Name,
TO_CHAR(Hire_Date, 'DD-MON-YYYY') AS Hire_Date
FROM Employee;
```
![output](op03.png)

# (3a) 2. Write an SQL query to display the employee ID, first name, and salary formatted with a currency symbol using the TO_CHAR function.
```
SELECT Employee_ID, First_Name,
TO_CHAR(Salary, 'L99,999.00') AS Salary
FROM Employee;
```
![output](op04.png)

# (3a) 3. Write an SQL query to add 5000 to each employee's salary using the TO_NUMBER function.
```
SELECT TO_NUMBER(Salary) + 5000 AS New_Salary
FROM Employee;
```
![output](op05.png)

# (3a) 4. Write an SQL query to display the details of employees who were hired after 01-JAN-2020 using the TO_DATE function.
```
SELECT * FROM Employee
WHERE Hire_Date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```
![output](op06.png)

# (3a) 5. Write an SQL query to display the full name of each employee by concatenating the first name and last name using the concatenation (||) operator.
```
SELECT First_Name || ' ' || Last_Name AS Full_Name
FROM Employee;
```
![output](op07.png)

# (3a) 6. Write an SQL query to concatenate the first name and last name of each employee using the CONCAT function.
```
SELECT CONCAT(First_Name, CONCAT(' ', Last_Name)) AS Full_Name
FROM Employee;
```
![output](op08.png)


# (3a) 7. Write an SQL query to display each employee's first name left-padded with * characters using the LPAD function.
```
SELECT LPAD(First_Name, 10, '*') AS Padded_Name
FROM Employee;
```
![output](op09.png)

# (3a) 8. Write an SQL query to display each employee's first name right-padded with * characters using the RPAD function.
```
SELECT RPAD(First_Name, 10, '*') AS Padded_Name
FROM Employee;
```
![output](op10.png)

# (3a) 9. Write an SQL query to remove leading spaces from employee names using the LTRIM function.
```
SELECT LTRIM(First_Name)
FROM Employee;
```
![output](op11.png)

# (3a) 10. Write an SQL query to remove trailing spaces from employee names using the RTRIM function.
```
SELECT RTRIM(First_Name)
FROM Employee;
```
![output](op12.png)

# (3a) 11. Write an SQL query to display all employee first names in lowercase using the LOWER function.
```
SELECT LOWER(First_Name)
FROM Employee;
```
![output](op13.png)

# (3a) 12. Write an SQL query to display all employee first names in uppercase using the UPPER function.
```
SELECT UPPER(First_Name)
FROM Employee;
```
![output](op14.png)

# (3a) 13. Write an SQL query to display employee first names in proper case using the INITCAP function.
```
SELECT INITCAP(First_Name)
FROM Employee;
```
![output](op15.png)


# (3a) 14. Write an SQL query to display the length of each employee's first name using the LENGTH function.
```
SELECT LENGTH(First_Name)
FROM Employee;
```
![output](op16.png)


# (3a) 15. Write an SQL query to display the first three characters of each employee's first name using the SUBSTR function.
```
SELECT SUBSTR(First_Name, 1, 3)
FROM Employee;
```
![output](op17.png)

# (3a) 16. Write an SQL query to find the position of the character 'a' in each employee's first name using the INSTR function.
```
SELECT INSTR(First_Name, 'a')
FROM Employee;
```
![output](op18.png)

# (3a) 17. Write an SQL query to display the current date using SYSDATE.
```
SELECT SYSDATE AS Current_Date
FROM Employee;
```
![output](op19.png)

# (3a) 18. Write an SQL query to display the date of the next Monday after each employee's hire date using NEXT_DAY.
```
SELECT NEXT_DAY(Hire_Date, 'MONDAY') AS Next_Monday
FROM Employee;
```
![output](op20.png)

# (3a) 19. Write an SQL query to add 6 months to each employee's hire date using ADD_MONTHS.
```
SELECT ADD_MONTHS(Hire_Date, 6) AS New_Date
FROM Employee;
```
![output](op21.png)

# (3a) 20. Write an SQL query to display the last day of the month for each employee's hire date using the LAST_DAY function.
```
SELECT LAST_DAY(Hire_Date) AS Last_Day
FROM Employee;
```
![output](op22.png)

# (3a) 21. Write an SQL query to calculate the total number of months each employee has worked using the MONTHS_BETWEEN function.
```
SELECT MONTHS_BETWEEN(SYSDATE, Hire_Date) AS Months_Worked
FROM Employee;
```
![output](op23.png)

# (3a) 22. Write an SQL query to display the smaller value between each employee's salary and 60000 using the LEAST function.
```
SELECT LEAST(Salary, 60000) AS Smaller_Value
FROM Employee;
```
![output](op24.png)

# (3a) 23. Write an SQL query to display the greater value between each employee's salary and 60000 using the GREATEST function.
```
SELECT GREATEST(Salary, 60000) AS Greatest_Value
FROM Employee;
```
![output](op25.png)

# (3a) 24. Write an SQL query to display the first day of the month of each employee's hire date using the TRUNC function.
```
SELECT TRUNC(Hire_Date, 'MONTH') AS First_Day
FROM Employee;
```
![output](op26.png)

# (3a) 25. Write an SQL query to round the hire date to the nearest month using ROUND.
```
SELECT ROUND(Hire_Date, 'MONTH') AS Rounded_Date
FROM Employee;
```
![output](op27.png)

# (3a) 26. Write an SQL query to display hire date in format DAY, DD-MON-YYYY using TO_CHAR.
```
SELECT TO_CHAR(Hire_Date, 'DAY, DD-MON-YYYY') AS Hire_Date
FROM Employee;
```
![output](op28.png)

# (3a) 27. Write an SQL query to display details of employees hired before 01-JAN-2019 using TO_DATE.
```
SELECT * FROM Employee
WHERE Hire_Date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');
```
![output](op29.png)


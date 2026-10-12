------------------EXPERIMENT - 3a----------------

--Creating Employee table
CREATE TABLE Employee
(
    Employee_ID NUMBER(5) PRIMARY KEY,
    First_Name VARCHAR2(20),
    Last_Name VARCHAR2(20),
    Gender CHAR(1),
    Job_ID VARCHAR2(15),
    Department VARCHAR2(30),
    Salary NUMBER(8,2),
    Commission NUMBER(5,2),
    Hire_Date DATE,
    City VARCHAR2(20)
);


--Inserting values into EMployee table
INSERT INTO Employee
VALUES (101, 'John', 'Smith', 'M', 'IT_PROG', 'IT', 65000, 5, TO_DATE('15-JAN-2020','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO Employee
VALUES (102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR', 52000, 3, TO_DATE('10-JUN-2019','DD-MON-YYYY'), 'Bengaluru');

INSERT INTO Employee
VALUES (103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales', 48000, 8, TO_DATE('25-AUG-2021','DD-MON-YYYY'), 'Chennai');

INSERT INTO Employee
VALUES (104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing', 72000, 10, TO_DATE('05-MAR-2018','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO Employee
VALUES (105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance', 58000, NULL, TO_DATE('18-DEC-2017','DD-MON-YYYY'), 'Mumbai');

INSERT INTO Employee
VALUES (106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT', 69000, 6, TO_DATE('12-NOV-2022','DD-MON-YYYY'), 'Pune');

INSERT INTO Employee
VALUES (107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales', 45000, 4, TO_DATE('20-JUL-2023','DD-MON-YYYY'), 'Delhi');

INSERT INTO Employee
VALUES (108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR', 50000, NULL, TO_DATE('09-FEB-2021','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO Employee
VALUES (109, 'Lakshmi', 'Nair', 'F', 'IT_PROG', 'IT', 76000, 7, TO_DATE('14-SEP-2016','DD-MON-YYYY'), 'Kochi');

INSERT INTO Employee
VALUES (110, 'Arjun', 'Singh', 'M', 'MK_MAN', 'Marketing', 68000, 5, TO_DATE('30-APR-2019','DD-MON-YYYY'), 'Jaipur');



--3.1)Write an SQL query to display the employee ID, first name, and hire date in the format DD-MON-YYYY using the TO_CHAR function.
SELECT Employee_ID, First_Name,
       TO_CHAR(Hire_Date, 'DD-MON-YYYY') AS Hire_Date
FROM Employee;


--3.2)Write an SQL query to display the employee ID, first name, and salary formatted with a currency symbol using the TO_CHAR function.
SELECT Employee_ID,
       First_Name,
       TO_CHAR(Salary, 'L99,999.00') AS Salary
FROM Employee;




--3.3)Write an SQL query to add 5000 to each employee's salary using the TO_NUMBER function.
SELECT TO_NUMBER(Salary) + 5000 AS New_Salary
FROM Employee;



--3.4)Write an SQL query to display the details of employees who were hired after 01-JAN-2020 using the TO_DATE function.
SELECT *
FROM Employee
WHERE Hire_Date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');




--3.5)Write an SQL query to display the full name of each employee by concatenating the first name and last name using the concatenation (||) operator.
SELECT First_Name || ' ' || Last_Name AS Full_Name
FROM Employee;



--3.6) Write an SQL query to concatenate the first name and last name of each employee using the CONCAT function.
SELECT CONCAT(First_Name, CONCAT(' ', Last_Name)) AS Full_Name
FROM Employee;



--3.7) Write an SQL query to display each employee's first name left-padded with * characters using the LPAD function.
SELECT LPAD(First_Name, 10, '*') AS Padded_Name
FROM Employee;



--3.8) Write an SQL query to display each employee's first name right-padded with * characters using the RPAD function.
SELECT RPAD(First_Name, 10, '*') AS Padded_Name
FROM Employee;




--3.9) Write an SQL query to remove leading spaces from employee names using the LTRIM function.
SELECT LTRIM(First_Name)
FROM Employee;




--3.10) Write an SQL query to remove trailing spaces from employee names using the RTRIM function.
SELECT RTRIM(First_Name)
FROM Employee;




--3.11) Display all employee first names in lowercase using LOWER
SELECT LOWER(First_Name)
FROM Employee;



--3.12) Write an SQL query to display all employee first names in uppercase using the UPPER function.
SELECT UPPER(First_Name)
FROM Employee;




--3.13) Write an SQL query to display employee first names in proper case using the INITCAP function.
SELECT INITCAP(First_Name)
FROM Employee;




--3.14) Write an SQL query to display the length of each employee's first name using the LENGTH function.
SELECT LENGTH(First_Name)
FROM Employee;




--3.15) Write an SQL query to display the first three characters of each employee's first name using the SUBSTR function.
SELECT SUBSTR(First_Name, 1, 3)
FROM Employee;




--3.16) Write an SQL query to find the position of the character 'a' in each employee's first name using the INSTR function.
SELECT INSTR(First_Name, 'a')
FROM Employee;





--3.17) Write an SQL query to display the current system date along with each employee's details using the SYSDATE function.
SELECT Employee.*, SYSDATE AS Current_Date
FROM Employee;




--3.18) Write an SQL query to display the next Monday after each employee's hire date using the NEXT_DAY function.
SELECT NEXT_DAY(Hire_Date, 'MONDAY') AS Next_Monday
FROM Employee;



--3.19) Write an SQL query to display the date obtained by adding six months to each employee's hire date using the ADD_MONTHS function.
SELECT ADD_MONTHS(Hire_Date, 6) AS New_Date
FROM Employee;



--3.20) Write an SQL query to display the last day of the month for each employee's hire date using the LAST_DAY function.
SELECT LAST_DAY(Hire_Date) AS Last_Day
FROM Employee;




--3.21) Write an SQL query to calculate the total number of months each employee has worked using the MONTHS_BETWEEN function.
SELECT MONTHS_BETWEEN(SYSDATE,Hire_Date) AS Months_Worked
FROM Employee;




--3.22) Write an SQL query to display the smaller value between each employee's salary and 60000 using the LEAST function.
SELECT LEAST(Salary, 60000) AS Smaller_Value
FROM Employee;




--3.23) Write an SQL query to display the greater value between each employee's salary and 60000 using the GREATEST function.
SELECT GREATEST(Salary, 60000) AS Greater_Value
FROM Employee;





--3.24) Write an SQL query to display the first day of the month of each employee's hire date using the TRUNC function.
SELECT TRUNC(Hire_Date, 'MONTH') AS First_Day
FROM Employee;




--3.25) Write an SQL query to round each employee's hire date to the nearest month using the ROUND function.
SELECT ROUND(Hire_Date, 'MONTH') AS Rounded_Date
FROM Employee;




--3.26) Write an SQL query to display each employee's hire date in the format DAY, DD-MON-YYYY using the TO_CHAR function.
SELECT TO_CHAR(Hire_Date, 'DAY, DD-MON-YYYY') AS Hire_Date
FROM Employee;




--3.27) Write an SQL query to display the details of employees who were hired before 01-JAN-2019 using the TO_DATE function.
SELECT *
FROM Employee
WHERE Hire_Date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');


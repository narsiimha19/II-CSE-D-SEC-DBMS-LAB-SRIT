#experiment 3 and 4
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
![op](b1.png)
![op](o2.png)

# 3a1 Q1. Write an SQL query to display the employee ID, first name, and hire date in the format DD-MON-YYYY using the TO_CHAR function.  
```

SELECT employee_id, first_name,
TO_CHAR(hire_date, 'DD-MON-YYYY')
FROM employees;
```
![op](o3.png)
#3a2Q2. Write an SQL query to display the employee ID, first name, and salary formatted with a currency symbol using the TO_CHAR function.

```
SELECT employee_id, first_name,
TO_CHAR(salary, '$99,999.99')
FROM employees;
```

![op](o4.png)
#3a3 Write an SQL query to add 5000 to each employee's salary using the TO_NUMBER function.
```

SELECT employee_id, first_name,
TO_NUMBER(TO_CHAR(salary)) + 5000
FROM employees;
```
![op](o5.png)
#3a4 Write an SQL query to display the details of employees who were hired after 01-JAN-2020 using the TO_DATE function.
```
SELECT *
FROM employees
WHERE hire_date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```
![op](o6.png)
#3A5 Write an SQL query to display the full name of each employee by concatenating the first name and last name using the concatenation (||) operator.
```
SELECT first_name || ' ' || last_name
FROM employees;
```
![op](o7.png)
#3A6 Write an SQL query to concatenate the first name and last name of each employeeusing the CONCAT function.
```
SELECT CONCAT(first_name, last_name)
FROM employees;
```
![op](o8.png)
#3A7 Q7. Write an SQL query to display each employee's first name left-padded with * characters using the LPAD function.
```

SELECT LPAD(first_name, 20, '*')
FROM employees;
```
![op](o9.png)
#3A8 Write an SQL query to display each employee's first name right-padded with * characters using the RPAD function.
```


SELECT RPAD(first_name, 20, '*')
FROM employees;
```
![op](o10.png)
#3A9 Q9. Write an SQL query to remove leading spaces from employee names using the LTRIM function.
```
SELECT LTRIM(first_name)
FROM employees;
```
![op](o11.png)
#3A10 Q10. Write an SQL query to remove trailing spaces from employee names using the RTRIM function.
```
SELECT RTRIM(first_name)
FROM employees;
```
![op](o12.png)


#3A11 Q11. Write an SQL query to display all employee first names in lowercase using the LOWER function.
```
SELECT LOWER(first_name)
FROM employees;
```
![op](o13.png)
#3A12 Write an SQL query to display all employee first names in uppercase using the UPPER function.
```

SELECT UPPER(first_name)
FROM employees;
```
![op](o14.png)
#3A13 Write an SQL query to display employee first names in proper case using the INITCAP function.
```

SELECT INITCAP(first_name)
FROM employees;
```
![op](o15.png)
#3A14 Write an SQL query to display the length of each employee's first name using the LENGTH function.
```

SELECT first_name, LENGTH(first_name)
FROM employees;
```
![op](o16.png)
#3A15 Write an SQL query to display the first three characters of each employee's first name using the SUBSTR function.
```
SELECT first_name, SUBSTR(first_name, 1, 3)
FROM employees;
```
![op](o26.png)
#3A16 Write an SQL query to find the position of the character 'a' in each employee's first name using the INSTR function.
```
SELECT first_name, INSTR(first_name, 'a')
FROM employees;
```
![op](o17.png)
#3A17 Write an SQL query to display the current system date along with each employee's details using the SYSDATE function.
```

SELECT employee_id, first_name, last_name, SYSDATE
FROM employees;
```
![op](o18.png)
#3A18 Write an SQL query to display the next Monday after each employee's hire date using the NEXT_DAY function.
```
SELECT first_name, hire_date,
NEXT_DAY(hire_date, 'MONDAY')
FROM employees;
```
![op](o19.png)
#3A19 Write an SQL query to display the date obtained by adding six months to each employee's hire date using the ADD_MONTHS function.
```
SELECT first_name, hire_date,
ADD_MONTHS(hire_date, 6)
FROM employees;
```
![op](o20.png)
#3A20 Write an SQL query to display the last day of the month for each employee's hire date using the LAST_DAY function.
```
SELECT first_name, hire_date,
LAST_DAY(hire_date)
FROM employees;
```
![op](o21.png)
#3A21 Write an SQL query to calculate the total number of months each employee has worked using the MONTHS_BETWEEN function.
```


SELECT first_name,
MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees;
```
![op](o22.png)
#3A22 Write an SQL query to display the smaller value between each employee's salary and 60000 using the LEAST function.
```
SELECT first_name, salary,
LEAST(salary, 60000)
FROM employees;
```
![op](o23.png)
#3A23 Write an SQL query to display the greater value between each employee's salary and 60000 using the GREATEST function.
```

SELECT first_name, salary,
GREATEST(salary, 60000)
FROM employees;
```
![op](o24.png)
#3A24 Write an SQL query to display the first day of the month of each employee's hiredate using the TRUNC function.
```
SELECT first_name, hire_date,
TRUNC(hire_date, 'MONTH')
FROM employees;
```
![op](o25.png)
#3A25 Write an SQL query to round each employee's hire date to the nearest month using the ROUND function.
```
SELECT first_name, hire_date,
ROUND(hire_date, 'MONTH')
FROM employees;
```
![op](o27.png)
#3A26 Write an SQL query to display each employee's hire date in the format DAY, DD-MON-YYYY using the TO_CHAR function.
```
SELECT first_name,
TO_CHAR(hire_date, 'DAY, DD-MON-YYYY')
FROM employees;
```
![op](o28.png)
#3A27 Write an SQL query to display the details of employees who were hired before 01-JAN-2019 using the TO_DATE function.
```
SELECT *
FROM employees
WHERE hire_date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');
```
![op](o29.png)


#EXPERIMENT 3B
#3B1 Q1.Write an SQL query to create a view named EMP_VIEW that displays all columns from the EMPLOYEES table.
```
select *from employees;
CREATE VIEW emp_view AS
SELECT *
FROM employees;
```
![op](p1.png)
#3B2 Q2. Write an SQL query to create a view named EMP_BASIC that displays the Employee ID, First Name, Last Name, Department, and Salary.
```
CREATE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary
FROM employees;
```
![op](p2.png)
#3B3 write an sql query to display all records from the EMP_VIEW
```
SELECT *
FROM emp_view;
```
![op](p3.png)
#3B4 Q4.Write an SQL query to create a view named IT_EMPLOYEES that displays tghe details of employees working in the IT department
```
CREATE VIEW it_employees AS
SELECT *
FROM employees
WHERE department = 'IT';
```
![op](p4.png)
#3B5 Write an SQL query to create a view named HIGH_SALARY that displays employees whose salary is greater than ₹60,000.
```
CREATE VIEW high_salary AS
SELECT *
FROM employees
WHERE salary > 60000;
```
![op](p5.png)
#3B6 Q6.Write an SQL query to create a view named HYDERABAD_EMP that displays employees whose city is Hyderabad.
```
CREATE VIEW hyderabad_emp AS
SELECT *
FROM employees
WHERE city = 'Hyderabad';
```
![op](p6.png)
#3B7 Q7.Write an SQL query to create a view named FEMALE_EMP that displays the details of all female employees.
```
CREATE VIEW female_emp AS
SELECT *
FROM employees
WHERE gender = 'F';
```
![op](p7.png)
#3B8 Q8.Write an SQL query to create a view named RECENT_EMPLOYEES that displays employees hired on or after 01-JAN-2020.
```
CREATE VIEW recent_employees AS
SELECT *
FROM employees
WHERE hire_date >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```
![op](p8.png)
#3B9 Q9.Write an SQL query to display the Employee ID, First Name, and Salary from the HIGH_SALARY view.
```
SELECT employee_id, first_name, salary
FROM high_salary;
```
![op](p9.png)
#3B10 Q10.Write an SQL query to replace the EMP_BASIC view by adding the CITY columnusing the CREATE OR REPLACE VIEW statement.
```
CREATE OR REPLACE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary, city
FROM employees;
```
![op](p10.png)

#3B11 Q11.Write an SQL query to create a read-only view named EMP_SALARY_VIEW thatdisplays the Employee ID, First Name, Last Name, and Salary.
```
CREATE VIEW emp_salary_view AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WITH READ ONLY;
```
![op](p11.png)
#3B12 Q12.Write an SQL query to create a view named SALES_EMP that displays employees belonging to the Sales department using the WITH CHECK OPTION clause.
```
CREATE VIEW sales_emp AS
SELECT *
FROM employees
WHERE department = 'Sales'
WITH CHECK OPTION;
```
![op](p12.png)
#3B13 Q13.Write an SQL query to update the salary of employee 101 through theEMP_BASIC view.
```
UPDATE emp_basic
SET salary = 70000
WHERE employee_id = 101;
```
![op](p13.png)

#3B14 Q14.Write an SQL query to delete the details of employee 107 through theEMP_VIEW.
```
DELETE FROM emp_view
WHERE employee_id = 107;
```
![op](p14.png)
#3B15 Write an sql query to insert  a new wmployee into the EMP_BASIC view
```
INSERT INTO emp_basic
(employee_id, first_name, last_name, department, salary, city)
VALUES
(111, 'Ravi', 'Kumar', 'IT', 55000, 'Hyderabad');
```
![op](p15.png)
#3B16 Q16.Write an SQL query to display the structure of the EMP_BASIC view.
```
DESC emp_basic;
```
![op](p16.png)
#3B17 Q17.Write an SQL query to display all records from the IT_EMPLOYEES view.
```
SELECT *
FROM it_employees;
```
![op](p17.png)
#3B18 Q18.Write an SQL query to display employees from the HIGH_SALARY view whosesalary is greater than ₹70,000.
```

SELECT *
FROM high_salary
WHERE salary > 70000;
```
![op](p18.png)
#3B19 Q19.Write an SQL query to display all female employees from the FEMALE_EMPview.
```
SELECT *
FROM female_emp;
```
![op](p19.png)

#3B20 Q20.Write an SQL query to display the names and salaries of employees from theHYDERABAD_EMP view.
```
SELECT first_name, salary
FROM hyderabad_emp;
```
![op](p20.png)
#3B21 Q21.Write an SQL query to drop the EMP_VIEW.
```
DROP VIEW emp_view;
```
![op](p21.png)
#3B22 Q22.Write an SQL query to drop the HIGH_SALARY view.
```
DROP VIEW high_salary;
```
![op](p22.png)
#3B23 Q23.Write an SQL query to drop the EMP_BASIC view.
```

DROP VIEW emp_basic;
```
![op](p23.png)
#3B24 Q24.Write an SQL query to create a view named HR_EMPLOYEES that displays employees working in the HR department.
```
CREATE VIEW hr_employees AS
SELECT *
FROM employees
WHERE department = 'HR';
```
![op](p24.png)
#3B25 Q25.Write an SQL query to create a view named MARKETING_EMP that displaysthe Employee ID, First Name, Department, and Salary of employees working in theMarketing department.
```
CREATE VIEW marketing_emp AS
SELECT employee_id, first_name, department, salary
FROM employees
WHERE department = 'Marketing';
```
![op](p25.png)
#3B26 Q26.Write an SQL query to create a view named TOP_EARNERS that displays employees earning more than ₹70,000.
```
CREATE VIEW top_earners AS
SELECT *
FROM employees
WHERE salary > 70000;
```
![op](p26.png)
#3B27 Q27.Write an SQL query to create a view named EMP_CITY that displays the Employee ID, First Name, Last Name, and City of all employees.
```

CREATE VIEW emp_city AS
SELECT employee_id, first_name, last_name, city
FROM employees;
```
![op](p27.png)

#experiment 4
#4.1 Create a dept table having dno, dname as columns.
```
CREATE TABLE dept (
    dno NUMBER(5),
    dname VARCHAR2(20)
);
```
![op](1.png)
#4.2 Apply 'Primary Key Constraint' for dno and NOT NULL Constraint for dname todept table
```
ALTER TABLE dept
ADD CONSTRAINT dept_pk PRIMARY KEY (dno);

ALTER TABLE dept
MODIFY dname CONSTRAINT dept_dname_nn NOT NULL;
```
![op](2.png)
#4.3 Create a student table having sid, sname, and did as columns.
```
CREATE TABLE student (
    sid NUMBER(5),
    sname VARCHAR2(30),
    did NUMBER(5)
);
```

![op](3.png)
#4.4 Apply Primary Key Constraint to sid, NOT NULL Constraint to Sname and Foreign Key Constraint to did refers to dept table
```
ALTER TABLE student
ADD CONSTRAINT student_pk PRIMARY KEY (sid);

ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;

ALTER TABLE student
ADD CONSTRAINT student_dept_fk
FOREIGN KEY (did)
REFERENCES dept(dno);
```
![op](4.png)
#4.5 Insert all department details like cse, me, ce, eee, ece, csm, csd in the depttable.
```
INSERT INTO dept VALUES (1, 'CSE');
INSERT INTO dept VALUES (2, 'ME');
INSERT INTO dept VALUES (3, 'CE');
INSERT INTO dept VALUES (4, 'EEE');
INSERT INTO dept VALUES (5, 'ECE');
INSERT INTO dept VALUES (6, 'CSM');
INSERT INTO dept VALUES (7, 'CSD');
```
![op](5.png)
#4.6 Insert at least 10 rows in the student table, take values of your own
```
INSERT INTO student VALUES (101, 'Ravi', 1);
INSERT INTO student VALUES (102, 'Sita', 1);
INSERT INTO student VALUES (103, 'Rahul', 2);
INSERT INTO student VALUES (104, 'Priya', 3);
INSERT INTO student VALUES (105, 'Arjun', 4);
INSERT INTO student VALUES (106, 'Sneha', 5);
INSERT INTO student VALUES (107, 'Kiran', 6);
INSERT INTO student VALUES (108, 'Anita', 7);
INSERT INTO student VALUES (109, 'Ramesh', 1);
INSERT INTO student VALUES (110, 'Lakshmi', 5);
```
![op](5.png)
![op](6.png)
#4.7 7. Write a SQL Query to implement NATURAL JOIN between Student and Dept.
```
SELECT *
FROM student
NATURAL JOIN
(SELECT dno AS did, dname FROM dept);
```
![op](i1.png)
#4.8 Write a SQL Query to implement EQUI JOIN between Student and Dept.
```

SELECT *
FROM student s, dept d
WHERE s.did = d.dno;
```
![op](i2.png)
#4.9 Write a SQL Query to implement CONDITIONAL JOIN between Student andDept.
```
SELECT *
FROM student s
JOIN dept d
ON s.did = d.dno;
```
![op](i3.png)
#4.10  Write a SQL Query to implement LEFT OUTER NATURAL JOIN between Stu-dent and Dept.
```
SELECT *
FROM student
NATURAL LEFT OUTER JOIN
(SELECT dno AS did, dname FROM dept);
```
![op](i4.png)
#4.11 Write a SQL Query to implement RIGHT OUTER NATURAL JOIN between Stu-dent and Dept.

```
SELECT *
FROM student
NATURAL RIGHT OUTER JOIN
(SELECT dno AS did, dname FROM dept);
```
![op](i5.png)
#4.12 Write a SQL Query to implement FULL OUTER NATURAL JOIN between Stu-dent and Dept.
```
SELECT *
FROM student
NATURAL FULL OUTER JOIN
(SELECT dno AS did, dname FROM dept);
```
![op](i6.png)
#4.13 Write a SQL Query to implement LEFT OUTER EQUI JOIN between Studentand Dept.
```
SELECT *
FROM student s
LEFT OUTER JOIN dept d
ON s.did = d.dno;
```
![op](i7.png)
#4.14 14. Write a SQL Query to implement RIGHT OUTER EQUI JOIN between Studentand Dept.
```
SELECT *
FROM student s
RIGHT OUTER JOIN dept d
ON s.did = d.dno;
```
![op](i8.png)
#4.15 Write a SQL Query to implement FULL OUTER EQUI JOIN between Studentand Dept.
```
SELECT *
FROM student s
FULL OUTER JOIN dept d
ON s.did = d.dno;
```
![op](i9.png)
#4.16 Write a SQL Query to implement LEFT OUTER CONDITIONAL JOIN betweenStudent and Dept.
```
SELECT *
FROM student s
LEFT OUTER JOIN dept d
ON s.did = d.dno;
```
![op](i10.png)
#4.17 Write a SQL Query to implement RIGHT OUTER CONDITIONAL JOIN betweenStudent and Dept.
```
SELECT *
FROM student s
RIGHT OUTER JOIN dept d
ON s.did = d.dno;
```
![op](i11.png)
#4.18 Write a SQL Query to implement FULL OUTER CONDITIONAL JOIN betweenStudent and Dept.
```
SELECT *
FROM student s
FULL OUTER JOIN dept d
ON s.did = d.dno;
```
![op](i12.png)
#4.19 Write a SQL Query to Implement CROSS JOIN between Student and Dept.
```
SELECT *
FROM student
CROSS JOIN dept;
```
![op](7.png)
![op](8.png)
![op](9.png)



#virtual lab experiments 
#VIRTUAL LAB 1ST EXPERIMENT
```
 #ist experiments
  PRETEST AND POST TEST 
```
![op](o2-1.png)
![op](o1.png)
![op](o3-2.png)
![op](o4-3.png)

```
#VIRTUAL LAB 2nd experiment

```2nd experiment
   PRETEST AND POSTTEST
```
![op](a1.png)
![op](a2.png)





#(3b) 1.created table employee

```
CREATE TABLE employees
(
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

```
![output](op-1.png)

#(3b) 2.inserted employees values

```
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

```
![output](op-2.png)

#(3b) 3.Write an SQL query to create a view named EMP_VIEW that displays all columns from the EMPLOYEES table.

```
CREATE VIEW emp_view AS
SELECT * FROM employees;

```
![output](op-3.png)

#(3b) 4.Write an SQL query to create a view named EMP_BASIC that displays the Employee ID, First Name, Last Name, Department, and Salary.

```
CREATE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary
FROM employees;

```
![output](op-4.png)

#(3b) 5.Write an SQL query to display all records from the EMP_VIEW.

```
SELECT * FROM emp_view;

```
![output](op-5.png)

#(3b) 6.Write an SQL query to create a view named IT_EMPLOYEES that displays the details of employees working in the IT department.

```
CREATE VIEW it_employees AS
SELECT * FROM employees
WHERE department = 'IT';

```
![output](op-6.png)

#(3b) 7.Write an SQL query to create a view named HIGH_SALARY that displays employees whose salary is greater than ₹60,000.

```
CREATE VIEW high_salary AS
SELECT * FROM employees
WHERE salary > 60000;

```
![output](op-7.png)

#(3b) 8.Write an SQL query to create a view named HYDERABAD_EMP that displays employees whose city is Hyderabad.

```
CREATE VIEW hyderabad_emp AS
SELECT * FROM employees
WHERE city = 'Hyderabad';

```
![output](op-8.png)

#(3b) 9.Write an SQL query to create a view named FEMALE_EMP that displays the details of all female employees.

```
CREATE VIEW female_emp AS
SELECT * FROM employees
WHERE gender = 'F';

```
![output](op-9.png)

#(3b) 10.Write an SQL query to create a view named RECENT_EMPLOYEES that displays employees hired on or after 01-JAN-2020.

```
CREATE VIEW recent_employees AS
SELECT * FROM employees
WHERE hire_date >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

```
![output](op-10.png)

#(3b) 11.Write an SQL query to display the Employee ID, First Name, and Salary from the HIGH_SALARY view.

```
SELECT employee_id, first_name, salary
FROM high_salary;

```
![output](op-11.png)

#(3b) 12. Write an SQL query to replace the EMP_BASIC view by adding the CITY column using the CREATE OR REPLACE VIEW statement.

```
CREATE OR REPLACE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary, city
FROM employees;

```
![output](op-12.png)

#(3b) 13. Write an SQL query to create a read-only view named EMP_SALARY_VIEW that displays the Employee ID, First Name, Last Name, and Salary.

```
CREATE VIEW emp_salary_view AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WITH READ ONLY;

```
![output](op-13.png)

#(3b) 14.Write an SQL query to create a view named SALES_EMP that displays employees belonging to the Sales department using the WITH CHECK OPTION clause.

```
CREATE VIEW sales_emp AS
SELECT * FROM employees
WHERE department = 'Sales'
WITH CHECK OPTION;

```
![output](op-14.png)

#(3b) 15. Write an SQL query to update the salary of employee 101 through the EMP_BASIC view.

```
UPDATE emp_basic
SET salary = 70000
WHERE employee_id = 101;

```
![output](op-15.png)

#(3b) 16. Write an SQL query to delete the details of employee 107 through the EMP_VIEW.

```
DELETE FROM emp_view
WHERE employee_id = 107;

```
![output](op-16.png)

#(3b) 17. Write an SQL query to insert a new employee into the EMP_BASIC view.

```
INSERT INTO emp_basic 
VALUES (111, 'Ravi', 'Kumar', 'IT', 55000, 'Hyderabad');

```
![output](op-17.png)

#(3b) 18. Write an SQL query to display the structure of the EMP_BASIC view.

```
DESC emp_basic;

```
![output](op-18.png)

#(3b) 19. Write an SQL query to display all records from the IT_EMPLOYEES view.

```
SELECT * FROM it_employees;

```
![output](op-19.png)

#(3b) 20.Write an SQL query to display employees from the HIGH_SALARY view whose salary is greater than ₹70,000.

```
SELECT * FROM high_salary
WHERE salary > 70000;

```
![output](op-20.png)

#(3b) 21.Write an SQL query to display all female employees from the FEMALE_EMP view.

```
SELECT * FROM female_emp;

```
![output](op-21.png)

#(3b) 22.Write an SQL query to display the names and salaries of employees from the HYDERABAD_EMP view.

```
SELECT first_name, salary
FROM hyderabad_emp;

```
![output](op-22.png)

#(3b) 23.Write an SQL query to drop the EMP_VIEW.

```
DROP VIEW emp_view;

```
![output](op-23.png)

#(3b) 24.Write an SQL query to drop the HIGH_SALARY view.

```
DROP VIEW high_salary;

```
![output](op-24.png)

#(3b) 25.Write an SQL query to drop the EMP_BASIC view.

```
DROP VIEW emp_basic;

```
![output](op-25.png)

#(3b) 26.Write an SQL query to create a view named HR_EMPLOYEES that displays employees working in the HR department.

```
CREATE VIEW hr_employees AS
SELECT * FROM employees
WHERE department = 'HR';

```
![output](op-26.png)

#(3b) 27.Write an SQL query to create a view named MARKETING_EMP that displays the Employee ID, First Name, Department, and Salary of employees working in the Marketing department.

```
CREATE VIEW marketing_emp AS
SELECT employee_id, first_name, department, salary
FROM employees
WHERE department = 'Marketing';

```
![output](op-27.png)

#(3b) 28.Write an SQL query to create a view named TOP_EARNERS that displays employees earning more than ₹70,000.

```
CREATE VIEW top_earners AS
SELECT * FROM employees
WHERE salary > 70000;

```
![output](op-28.png)

#(3b) 29.Write an SQL query to create a view named EMP_CITY that displays the Employee ID, First Name, Last Name, and City of all employees.

```
CREATE VIEW emp_city AS
SELECT employee_id, first_name, last_name, city
FROM employees;

```
![output](op-29.png)

# EXPERIMENT - 3b


# Q1)Write an SQL query to create a view named EMP_VIEW that displays all columns from the EMPLOYEES table.
```
CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEE;
```
![output](op3b1.png)





# Q2) Write an SQL query to create a view named EMP_BASIC that displays the Employee ID, First Name, Last Name, Department, and Salary.
```
CREATE VIEW EMP_BASIC AS
SELECT Employee_ID,First_Name,Last_Name,
Department,Salary
FROM EMPLOYEE;
```
![output](op3b2.png)





# Q3)Write an SQL query to display all records from the EMP_VIEW.
```
SELECT *
FROM EMP_VIEW;
```
![output](op3b3.png)







# Q4)Write an SQL query to create a view named IT_EMPLOYEES that displays the details of employees working in the IT department.
```
CREATE VIEW IT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE Department = 'IT';
```
![output](op3b4.png)






# Q5) Write an SQL query to create a view named HIGH_SALARY that displays employees whose salary is greater than ₹60,000.
```
CREATE VIEW HIGH_SALARY AS
SELECT *
FROM EMPLOYEE
WHERE Salary > 60000;
```
[output](op3b5.png)





# Q6)Write an SQL query to create a view named HYDERABAD_EMP that displays employees whose city is Hyderabad.
```
CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEE
WHERE City = 'Hyderabad';
```
![output](op3b6.png)






# Q7)Write an SQL query to create a view named FEMALE_EMP that displays the details of all female employees.
```
CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEE
WHERE Gender = 'F';
```
![output](op3b7.png)




# Q8.Write an SQL query to create a view named RECENT_EMPLOYEES that displays employees hired on or after 01-JAN-2020.
```
CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE Hire_Date >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```
![output](op3b8.png)





# Q9)Write an SQL query to display the Employee ID, First Name, and Salary from the HIGH_SALARY view.
```
SELECT Employee_ID,First_Name, Salary
FROM HIGH_SALARY;
```
![output](op3b9.png)





# Q10)Write an SQL query to replace the EMP_BASIC view by adding the CITY column using the CREATE OR REPLACE VIEW statement.
```
CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT Employee_ID,First_Name,Last_Name,
Department,Salary,City
FROM EMPLOYEE;
```
![output](op3b10.png)





# Q11)Write an SQL query to create a read-only view named EMP_SALARY_VIEW that displays the Employee ID, First Name, Last Name, and Salary.
```
CREATE VIEW EMP_SALARY_VIEW AS
SELECT Employee_ID,
First_Name,Last_Name,Salary
FROM EMPLOYEE
WITH READ ONLY;
```
![output](op3b11.png)






# Q12)Write an SQL query to create a view named SALES_EMP that displays employees belonging to the Sales department using the WITH CHECK OPTION clause.
```
CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEE
WHERE Department = 'Sales'
WITH CHECK OPTION;
```
![output](op3b12.png)





# Q13)Write an SQL query to update the salary of employee 101 through the EMP_BASIC view.
```
UPDATE EMP_BASIC
SET Salary = 70000
WHERE Employee_ID = 101;
```
![output](op3b13.png)





# Q14)Write an SQL query to delete the details of employee 107 through the EMP_VIEW.
```
DELETE FROM EMP_VIEW
WHERE Employee_ID = 107;
```
![output](op3b14.png)





# Q15)Write an SQL query to insert a new employee into the EMP_BASIC view.
```
INSERT INTO EMP_BASIC
VALUES (111, 'Ravi', 'Kumar', 'IT', 65000, 'Hyderabad');
```
![output](op3b15.png)





# Q16)Write an SQL query to display the structure of the EMP_BASIC view.
```
DESC EMP_BASIC;
```
![output](op3b16.png)





# Q17)Write an SQL query to display all records from the IT_EMPLOYEES view.
```
SELECT *
FROM IT_EMPLOYEES;
```
![output](op3b17.png)






# Q18)Write an SQL query to display employees from the HIGH_SALARY view whose salary is greater than ₹70,000.
```
SELECT *
FROM HIGH_SALARY
WHERE Salary > 70000;
```
![output](op3b18.png)




# Q19)Write an SQL query to display all female employees from the FEMALE_EMP view.
```
SELECT *
FROM FEMALE_EMP;
```
![output](op3b19.png)






# Q20)Write an SQL query to display the names and salaries of employees from the HYDERABAD_EMP view.
```
SELECT First_Name,Last_Name,Salary
FROM HYDERABAD_EMP;
```
![output](op3b20.png)






# Q21)Write an SQL query to drop the EMP_VIEW.
```
DROP VIEW EMP_VIEW;
```
![output](op3b21.png)






# Q22)Write an SQL query to drop the HIGH_SALARY view.
```
DROP VIEW HIGH_SALARY;
```
![output](op3b22.png)





# Q23)Write an SQL query to drop the EMP_BASIC view.
```
DROP VIEW EMP_BASIC;
```
![output](op3b23.png)






# Q24)Write an SQL query to create a view named HR_EMPLOYEES that displays employees working in the HR department.
```
CREATE VIEW HR_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE Department = 'HR';
```
![output](op3b24.png)







# Q25)Write an SQL query to create a view named MARKETING_EMP that displays the Employee ID, First Name, Department, and Salary of employees working in the Marketing department.
```
CREATE VIEW MARKETING_EMP AS
SELECT Employee_ID,
First_Name,Department,Salary
FROM EMPLOYEE
WHERE Department = 'Marketing';
```
![output](op3b25.png)






# Q26)Write an SQL query to create a view named TOP_EARNERS that displays employees earning more than ₹70,000.
```
CREATE VIEW TOP_EARNERS AS
SELECT *
FROM EMPLOYEE
WHERE Salary > 70000;
```
![output](op3b26.png)






# Q27)Write an SQL query to create a view named EMP_CITY that displays the Employee ID, First Name, Last Name, and City of all employees.
```
CREATE VIEW EMP_CITY AS
SELECT Employee_ID,
First_Name,Last_Name,City
FROM EMPLOYEE;
```
![output](op3b27.png)



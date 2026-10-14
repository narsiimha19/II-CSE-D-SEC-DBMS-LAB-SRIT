# (3b) 1. Write an SQL query to create a view named EMP_VIEW that displays all columns from the EMPLOYEES table.
```
CREATE VIEW EMP_VIEW AS SELECT * FROM EMPLOYEES;
```
![output](op01.png)


# (3b) 2. Write an SQL query to create a view named EMP_BASIC that displays the Employee ID, First Name, Last Name, Department, and Salary.
```
CREATE VIEW EMP_BASIC AS SELECT Employee_ID, First_Name, Last_Name, Department, Salary FROM EMPLOYEES;
```
![output](op02.png)


# (3b) 3. Write an SQL query to display all records from the EMP_VIEW.
```
SELECT * FROM EMP_VIEW;
```
![output](op03.png)


# (3b) 4. Write an SQL query to create a view named IT_EMPLOYEES that displays the details of employees working in the IT department.
```
CREATE VIEW IT_EMPLOYEES AS SELECT * FROM EMPLOYEES WHERE Department = 'IT';
```
![output](op04.png)

# (3b) 5. Write an SQL query to create a view named HIGH_SALARY that displays employees whose salary is greater than Rs.60,000.
```
CREATE VIEW HIGH_SALARY AS SELECT * FROM EMPLOYEES WHERE Salary > 60000;
```
![output](op05.png)

# (3b) 6. Write an SQL query to create a view named HYDERABAD_EMP that displays employees whose city is Hyderabad.
```
CREATE VIEW HYDERABAD_EMP AS SELECT * FROM EMPLOYEES WHERE City = 'Hyderabad';
```
![output](op06.png)

# (3b) 7. Write an SQL query to create a view named FEMALE_EMP that displays the details of all female employees.
```
CREATE VIEW FEMALE_EMP AS SELECT * FROM EMPLOYEES WHERE Gender = 'F';
```
![output](op07.png)

# (3b) 8. Write an SQL query to create a view named RECENT_EMPLOYEES that displays employees hired on or after 01-JAN-2020.
```
CREATE VIEW RECENT_EMPLOYEES AS SELECT * FROM EMPLOYEES WHERE Hire_Date >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```
![output](op08.png)

# (3b) 9. Write an SQL query to display the Employee ID, First Name, and Salary from the HIGH_SALARY view.
```
SELECT Employee_ID, First_Name, Salary FROM HIGH_SALARY;
```
![output](op09.png)

# (3b) 10. Write an SQL query to replace the EMP_BASIC view by adding the CITY column using the CREATE OR REPLACE VIEW statement.
```
CREATE OR REPLACE VIEW EMP_BASIC AS SELECT Employee_ID, First_Name, Last_Name, Department, Salary, City FROM EMPLOYEES;
```
![output](op10.png)

# (3b) 11. Write an SQL query to create a read-only view named EMP_SALARY_VIEW that displays the Employee ID, First Name, Last Name, and Salary.
```
CREATE VIEW EMP_SALARY_VIEW AS SELECT Employee_ID, First_Name, Last_Name, Salary FROM EMPLOYEES WITH READ ONLY;
```
![output](op11.png)

# (3b) 12. Write an SQL query to create a view named SALES_EMP that displays employees belonging to the Sales department using the WITH CHECK OPTION clause.
```
CREATE VIEW SALES_EMP AS SELECT * FROM EMPLOYEES WHERE Department = 'Sales' WITH CHECK OPTION;
```
![output](op12.png)

# (3b) 13. Write an SQL query to update the salary of employee 101 through the EMP_BASIC view.
```
UPDATE EMP_BASIC SET Salary = 70000 WHERE Employee_ID = 101;
```
![output](op13.png)

# (3b) 14. Write an SQL query to delete the details of employee 107 through the EMP_VIEW.
```
DELETE FROM EMP_VIEW WHERE Employee_ID = 107;
```
![output](op14.png)

# (3b) 15. Write an SQL query to insert a new employee into the EMP_BASIC view.
```
INSERT INTO EMP_BASIC (Employee_ID, First_Name, Last_Name, Department, Salary, City) VALUES (111, 'Ravi', 'Kumar', 'IT', 65000, 'Hyderabad');
```
![output](op15.png)

# (3b) 16. Write an SQL query to display the structure of the EMP_BASIC view.
```
DESC EMP_BASIC;
```
![output](op16.png)


# (3b) 17. Write an SQL query to display all records from the IT_EMPLOYEES view.
```
SELECT * FROM IT_EMPLOYEES;
```
![output](op17.png)

# (3b) 18. Write an SQL query to display employees from the HIGH_SALARY view whose salary is greater than Rs.70,000.
```
SELECT * FROM HIGH_SALARY WHERE Salary > 70000;
```
![output](op18.png)

# (3b) 19. Write an SQL query to display all female employees from the FEMALE_EMP view.
```
SELECT * FROM FEMALE_EMP;
```
![output](op19.png)

# (3b) 20. Write an SQL query to display the names and salaries of employees from the HYDERABAD_EMP view.
```
SELECT First_Name, Last_Name, Salary FROM HYDERABAD_EMP;
```
![output](op20.png)

# (3b) 21. Write an SQL query to drop the EMP_VIEW.
```
DROP VIEW EMP_VIEW;
```
![output](op21.png)

# (3b) 22. Write an SQL query to drop the HIGH_SALARY view.
```
DROP VIEW HIGH_SALARY;
```
![output](op22.png)

# (3b) 23. Write an SQL query to drop the EMP_BASIC view.
```
DROP VIEW EMP_BASIC;
```
![output](op23.png)

# (3b) 24. Write an SQL query to create a view named HR_EMPLOYEES that displays employees working in the HR department.
```
CREATE VIEW HR_EMPLOYEES AS SELECT * FROM EMPLOYEES WHERE Department = 'HR';
```
![output](op24.png)

# (3b) 25. Write an SQL query to create a view named MARKETING_EMP that displays the Employee ID, First Name, Department, and Salary of employees working in the Marketing department.
```
CREATE VIEW MARKETING_EMP AS SELECT Employee_ID, First_Name, Department, Salary FROM EMPLOYEES WHERE Department = 'Marketing';
```
![output](op25.png)

# (3b) 26. Write an SQL query to create a view named TOP_EARNERS that displays employees earning more than Rs.70,000.
```
CREATE VIEW TOP_EARNERS AS SELECT * FROM EMPLOYEES WHERE Salary > 70000;
```
![output](op26.png)

# (3b) 27. Write an SQL query to create a view named EMP_CITY that displays the Employee ID, First Name, Last Name, and City of all employees.
```
CREATE VIEW EMP_CITY AS SELECT Employee_ID, First_Name, Last_Name, City FROM EMPLOYEES;
```
![output](op27.png)


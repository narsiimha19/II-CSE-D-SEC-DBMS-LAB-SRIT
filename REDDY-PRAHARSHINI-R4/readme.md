#create a table
```
CREATE TABLE student(
Name VARCHAR2(40),
Student_number NUMBER,
Class NUMBER,
Major VARCHAR2(5)
);
CREATE TABLE course(
Course_name VARCHAR2(10),
Course_number VARCHAR2(20),
Credit_hour NUMBER,
Department VARCHAR2(10)
);
CREATE TABLE section(
Section_identifier NUMBER,
Section_number VARCHAR2(10),
Semester VARCHAR2(10),
Year NUMBER,
Instructor VARCHAR2(10)
);
CREATE TABLE grade_report(
Student_number NUMBER,
Section_identifier NUMBER,
Grade VARCHAR2(5)
);
```
![output](op-2.png)

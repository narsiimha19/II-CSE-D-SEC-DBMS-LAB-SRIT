# experiment - 7a


## 1.create Table and Inserting values
```
SET SERVEROUTPUT ON;

CREATE TABLE student (
    st
udent_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);

INSERT INTO student VALUES (101, 'Ravi', 'CSE', 85);
INSERT INTO student VALUES (102, 'Sita', 'CSE', 92);
INSERT INTO student VALUES (103, 'Kiran', 'ECE', 78);
INSERT INTO student VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student VALUES (105, 'Rahul', 'CSE', 74);

COMMIT;

```
![output](7a-01.png)
###insertion 
![output](7a-02.png)
### displaying student table
![output](7a-03.png)

## verifying student tables

## 2. create the stored PROCEDURE
```
CREATE OR REPLACE PROCEDURE GET_STUDENT_DETAILS (
    p_student_id   IN  student.student_id%TYPE,
    p_student_name OUT student.student_name%TYPE,
    p_marks        OUT student.marks%TYPE
)
IS
BEGIN
    -- Retrieve student details
    SELECT student_name, marks
    INTO p_student_name, p_marks
    FROM student
    WHERE student_id = p_student_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_student_name := NULL;
        p_marks := NULL;

        DBMS_OUTPUT.PUT_LINE(
            'No student found with ID: ' || p_student_id
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
/
```
![output](7a-04.png)

##  Execution of procedure by creating anonymous PL/SQL
```
DECLARE
    -- Variables to receive OUT parameter values
    v_student_name student.student_name%TYPE;
    v_marks        student.marks%TYPE;

BEGIN
    -- Call the procedure
    GET_STUDENT_DETAILS(
        101,
        v_student_name,
        v_marks
    );

    -- Display returned values
    IF v_student_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE(
            'Student Name : ' || v_student_name
        );

        DBMS_OUTPUT.PUT_LINE(
            'Marks        : ' || v_marks
        );
    END IF;

END;
/
```
![output](7a-05.png)
## output calling by wrong student
![output](7a-06.png)

 
## 1. Enable server DBMS_OUTPUT
```
 SET SERVEROUTPUT ON;
```
![output](7a-07.png)

## 2.CREATE TWO BIND Variables
 
```
VARIABLE v_name VARCHAR2(50);
VARIABLE v_marks NUMBER;
```
![output](7a-08.png)

## 3.CALL THE PROCEDURE
```
EXEC GET_STUDENT_DETAILS(101, :v_name, :v_marks);
```
![output](7a-09.png)

## 4.PRINT THE TWO BINDED VARIABLES;
```
PRINT v_name;
PRINT v_marks;
```
![output](7a-10.png)

## 4.CALL THE PROCEDURE WITH WRONG INPUT
```
EXEC GET_STUDENT_DETAILS(-102, :v_name, :v_marks);

```
![output](7a-11.png)

#--exp-7b
# Program 1: Calculate Annual Salary Using a Stored Function

## creating table employee
```
CREATE TABLE employee (
    employee_id NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    monthly_salary NUMBER(10,2)
);
```
![output](7b-01.png)
## 2. Inserting values
```
INSERT INTO employee VALUES (101, 'Ravi', 25000);
INSERT INTO employee VALUES (102, 'Sita', 30000);
INSERT INTO employee VALUES (103, 'Kiran', 35000);
INSERT INTO employee VALUES (104, 'Anjali', 40000);
INSERT INTO employee VALUES (105, 'Rahul', 45000);


COMMIT;
```
![output](7b-02.png)
##  3.Create the stored Function
```
CREATE OR REPLACE FUNCTION CALCULATE_ANNUAL_SALARY (
    p_monthly_salary IN NUMBER
)
RETURN NUMBER
IS
    v_annual_salary NUMBER;
BEGIN
    -- Calculate annual salary
    v_annual_salary := p_monthly_salary * 12;

    -- Return annual salary
    RETURN v_annual_salary;
END;
```
![output](7b-03.png)
## 4.Executing the function Using Select
```
SELECT
    employee_id,
    employee_name,
    monthly_salary,
    CALCULATE_ANNUAL_SALARY(monthly_salary) AS annual_salary
FROM employee;
```
![output](7b-04.png)
# Program 2: Find the Total Number of Students in a Course

## 1.Create the student table
```
CREATE TABLE student (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    marks NUMBER(5,2)
);
```
![output](7b-05.png)
## 2.Insert values in table student 
```
INSERT INTO student VALUES (101, 'Ravi',   85);
INSERT INTO student VALUES (102, 'Sita',   72);
INSERT INTO student VALUES (103, 'Kiran',  55);
INSERT INTO student VALUES (104, 'Anjali', 45);
INSERT INTO student VALUES (105, 'Rahul',  30);
INSERT INTO student VALUES (106, 'Priya',  91);
INSERT INTO student VALUES (107, 'Arun',   68);
INSERT INTO student VALUES (108, 'Sneha',  58);

COMMIT;
```
![output](7b-06.png)
### Dispaying student table 
```
SELECT * FROM student;
```
![output](7b-07.png)
## 3.CREATE THE STORED FUNCTION
```
CREATE OR REPLACE FUNCTION COUNT_STUDENTS (
    p_course IN VARCHAR2
)
RETURN NUMBER
IS
    v_total_students NUMBER;
BEGIN
    -- Count students belonging to the given course
    SELECT COUNT(*)
    INTO v_total_students
    FROM student
```
![output](7b-08.png)

## INVOKE THE FUNCTION USING SELECT 
```
SELECT 
     'CSE' AS course,
      COUNT_STUDENTS('CSE') AS total_students
   FROM dual;
```
![output](7b-09.png)


## TEST OTHER COURSES
```
SELECT
    'ECE' AS course,

FROM dual;
```
![output](7b-10.png)
```
SELECT
FROM (
    SELECT DISTINCT course
    FROM student
);
![output](7b-11.png)

# Program 3: Determine Student Grade Using a Complex Stored Function

## 1.CREATE THE STUDENT TABLE

```
CREATE TABLE student (
    student_name VARCHAR2(50),
    marks NUMBER(5,2)
);
```
![output](7b-12.png)
## 2.INSERTING VALUES
```
INSERT INTO student VALUES (101, 'Ravi',   85);
INSERT INTO student VALUES (102, 'Sita',   72);
INSERT INTO student VALUES (104, 'Anjali', 45);
INSERT INTO student VALUES (105, 'Rahul',  30);
INSERT INTO student VALUES (106, 'Priya',  91);
INSERT INTO student VALUES (107, 'Arun',   68);
INSERT INTO student VALUES (108, 'Sneha',  58);

COMMIT;
```
![output](7b-13.png)

###  DISPLAYING STUDENT TABLE
```
SELECT * FROM student;
```
![output](7b-14.png)

## 3.CREATE THE STORED FUNCTION GET_GRADE

```
CREATE OR REPLACE FUNCTION GET_GRADE (
    p_marks IN NUMBER
)
RETURN VARCHAR2
IS
    v_grade VARCHAR2(20);
BEGIN

    -- Determine grade based on marks
    IF p_marks >= 75 THEN
        v_grade := 'Distinction';

    ELSIF p_marks >= 60 THEN
        v_grade := 'First Class';

    ELSIF p_marks >= 50 THEN
        v_grade := 'Second Class';

    ELSIF p_marks >= 35 THEN
        v_grade := 'Pass';

    ELSE
        v_grade := 'Fail';
    END IF;

    -- Return the calculated grade
    RETURN v_grade;

END;
/
```
![output](7b-15.png)
## 4.INVOKE THE FUNCTION USING SELECT
```
SELECT
    student_name,
    marks,
    GET_GRADE(marks) AS grade
FROM student;
```
![output](7b-16.png)



INSERT INTO student VALUES (103, 'Kiran',  55);
    student_id NUMBER(5) PRIMARY KEY,
```
    COUNT_STUDENTS(course) AS total_students
    course,
## DISPLAY COUNT FOR ALL COURSES
    COUNT_STUDENTS('ECE') AS total_students
```
![output](7b-9.png)
FROM dual;
    COUNT_STUDENTS('CSE') AS total_students
    'CSE' AS course,
SELECT

```
## INVOKE THE FUNCTION USING SQL SELECT
![output](7b-8.png)
```
    RETURN v_total_students;
END;
    -- Return the count


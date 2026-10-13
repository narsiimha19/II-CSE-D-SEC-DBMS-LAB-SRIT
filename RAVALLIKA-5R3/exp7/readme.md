#1. Create Table and Insert Sample Records
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
![op](1.png)
![op](2.png)
#2. Create the Stored Procedure
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
```
![op](3.png)
#Execution of procedure by creating Anonymous PL/SQL block
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
```
![op](4.png)
# EXPERIMENT 7B
#programe 1
#1. Create the Employee table
```
CREATE TABLE employee (
    employee_id NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    monthly_salary NUMBER(10,2)
);

```
![OP](5.png)
#2. Insert Sample Employee Records
```
INSERT INTO employee VALUES (101, 'Ravi', 25000);
INSERT INTO employee VALUES (102, 'Sita', 30000);
INSERT INTO employee VALUES (103, 'Kiran', 35000);
INSERT INTO employee VALUES (104, 'Anjali', 40000);
INSERT INTO employee VALUES (105, 'Rahul', 45000);

COMMIT;
```
![op](6.png)
#3. Create the Stored Function
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
![op](7.png)
#Execute the Function Using SELECT
```
SELECT
    employee_id,
    employee_name,
    monthly_salary,
    CALCULATE_ANNUAL_SALARY(monthly_salary) AS annual_salary
FROM employee;
```
![op](8.png)

#PROGRAME 2
#Program 2: Find the Total Number of Students in a Course

#1. Create the STUDENT Table
```
CREATE TABLE student (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);
```
![op](1.png)
#2. Insert Sample Student Records
```
INSERT INTO student VALUES (101, 'Ravi',   'CSE', 85);
INSERT INTO student VALUES (102, 'Sita',   'CSE', 92);
INSERT INTO student VALUES (103, 'Kiran',  'ECE', 78);
INSERT INTO student VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student VALUES (105, 'Rahul',  'CSE', 74);
INSERT INTO student VALUES (106, 'Priya',  'ECE', 95);
INSERT INTO student VALUES (107, 'Arun',   'IT',  81);
INSERT INTO student VALUES (108, 'Sneha',  'CSE', 89);
INSERT INTO student VALUES (109, 'Vijay',  'EEE', 68);
INSERT INTO student VALUES (110, 'Divya',  'IT',  91);
INSERT INTO student VALUES (111, 'Manoj',  'ECE', 76);
INSERT INTO student VALUES (112, 'Kavya',  'CSE', 84);
INSERT INTO student VALUES (113, 'Ramesh', 'IT',  72);
INSERT INTO student VALUES (114, 'Swathi', 'EEE', 87);
INSERT INTO student VALUES (115, 'Ajay',   'ECE', 93);

COMMIT;

```
![op](2.png)
#3. Create the Stored Function
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
    WHERE course = p_course;

    -- Return the count
    RETURN v_total_students;
END;
```
![op](9.png)
#Invoke the Function Using SQL SELECT
```
SELECT
    'CSE' AS course,
    COUNT_STUDENTS('CSE') AS total_students
FROM dual;
```
![op](10.png)
#Display Count for All Courses
```

SELECT
    course,
    COUNT_STUDENTS(course) AS total_students
FROM (
    SELECT DISTINCT course
    FROM student
);
```
![op](11.png)
#Program 3: Determine Student Grade Using a Complex Stored Function
#1. Create the STUDENT Table
```
CREATE TABLE student (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    marks NUMBER(5,2)
);
```
![op](1.png)
#2. Insert Sample Student Records
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

![op](2.png)
#3. Create the Stored Function GET_GRADE
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
![op](12.png)
#4. Invoke the Function Using SELECT
```
SELECT
    student_name,
    marks,
    GET_GRADE(marks) AS grade
FROM student;
```
![op](13.png)


# (7b).Create the Employee table
```
CREATE TABLE employee (
    employee_id NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    monthly_salary NUMBER(10,2)
);
```
![output](7b1.png)

# (7b).2.Insert sample Employee Record
```
INSERT INTO employee VALUES (101, 'Ravi', 25000);
INSERT INTO employee VALUES (102, 'Sita', 30000);
INSERT INTO employee VALUES (103, 'Kiran', 35000);
INSERT INTO employee VALUES (104, 'Anjali', 40000);
INSERT INTO employee VALUES (105, 'Rahul', 45000);

COMMIT;
```
![output](7b2.png)

# (7b).3.Create the Stored Function
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
![output](7b3.png)

# (7b).Execute the Function using SELECT
```
SELECT
    employee_id,
    employee_name,
    monthly_salary,
    CALCULATE_ANNUAL_SALARY(monthly_salary) AS annual_salary
FROM employee;
```
![output](7b4.png)

# (7b).Create the STUDENT Table
```
CREATE TABLE student (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);
```
![output](7b5.png)

# (7b).Insert sample student Records
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
![output](7b6.png)

# (7b).Displaying of student Information
```
SELECT * FROM student;
```
![output](7b7.png)

# (7b).Create the stored Function
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
![output](7b8.png)

# (7b).Invoke the Function using SQL SELECT
```
SELECT
    'ECE' AS course,
    COUNT_STUDENTS('ECE') AS total_students
FROM dual;
```
![output](7b9.png)

# (7b).Test Other Course
```
SELECT
    'ECE' AS course,
    COUNT_STUDENTS('ECE') AS total_students
FROM dual;
```
![output](7b10.png)

# (7b).Displaying count of all values
```
SELECT
    course,
    COUNT_STUDENTS(course) AS total_students
FROM (
    SELECT DISTINCT course
    FROM student
);
```
![output](7b11.png)

# (7d).Creating the student table
```
CREATE TABLE student (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    marks NUMBER(5,2)
);
```
![output](7b12.png)

# (7b).Insert sample student records
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
![output](7b13.png)

# (7b).Display student table
```
SELECT * FROM student;
```
![output](7b14.png)

# (7b).Creating the stored function GET_GRADE
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
![output](7b15.png)

# (7b).Invoke the function using SELECT
```
SELECT
    student_name,
    marks,
    GET_GRADE(marks) AS grade
FROM student;
```
![output](7b16.png)



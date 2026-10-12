# (1a) 1.create tables of the above database with out constraints.
```
CREATE TABLE STUDENT (
    Name VARCHAR2(20),
    Student_number NUMBER,
    Class NUMBER,
    Major VARCHAR2(10)
);
CREATE TABLE COURSE (
    Course_name VARCHAR2(30),
    Course_number VARCHAR2(10),
    Credit_hours NUMBER,
    Department VARCHAR2(10)
);
CREATE TABLE SECTION (
    Section_identifier NUMBER,
    Course_number VARCHAR2(10),
    Semester VARCHAR2(10),
    Year NUMBER,
    Instructor VARCHAR2(20)
);
CREATE TABLE GRADE_REPORT (
    Student_number NUMBER,
    Section_identifier NUMBER,
    Grade VARCHAR2(2)
);

```
![output](op1)

# (1a) 2.insert all values inside the table
```
INSERT INTO STUDENT VALUES ('Smith', 17, 1, 'CS');
INSERT INTO STUDENT VALUES ('Brown', 8, 2, 'CS');

INSERT INTO COURSE VALUES ('Intro to Computer Science', 'CS1310', 4, 'CS');
INSERT INTO COURSE VALUES ('Data Structures', 'CS3320', 4, 'CS');
INSERT INTO COURSE VALUES ('Discrete Mathematics', 'MATH2410', 3, 'MATH');
INSERT INTO COURSE VALUES ('Database', 'CS3380', 3, 'CS');

INSERT INTO SECTION VALUES (85, 'MATH2410', 'Fall', 07, 'King');
INSERT INTO SECTION VALUES (92, 'CS1310', 'Fall', 07, 'Anderson');
INSERT INTO SECTION VALUES (102, 'CS3320', 'Spring', 08, 'Knuth');
INSERT INTO SECTION VALUES (112, 'MATH2410', 'Fall', 08, 'Chang');
INSERT INTO SECTION VALUES (119, 'CS1310', 'Fall', 08, 'Anderson');
INSERT INTO SECTION VALUES (135, 'CS3380', 'Fall', 08, 'Stone');

INSERT INTO GRADE_REPORT VALUES (17, 112, 'B');
INSERT INTO GRADE_REPORT VALUES (17, 119, 'C');
INSERT INTO GRADE_REPORT VALUES (8, 85, 'A');
INSERT INTO GRADE_REPORT VALUES (8, 92, 'A');
INSERT INTO GRADE_REPORT VALUES (8, 102, 'B');
INSERT INTO GRADE_REPORT VALUES (8, 135, 'A');
```
![output](op2)

# (1a) 3.Describe all tables
```
DESC STUDENT;
DESC COURSE;
DESC SECTION;
DESC GRADE_REPORT;
```
![output](op3)

# (1a) 4.list the created tables
```
SELECT * FROM tab;
```
![output](op4)

# (1a) 5.Display the values of each table
```
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM section;
SELECT * FROM grade_report;
```
![output](op5)

# (1a) 6.Delete all tables
```
DROP TABLE student;
DROP TABLE course;
DROP TABLE section;
DROP TABLE grade_report;
```
![output](op6)


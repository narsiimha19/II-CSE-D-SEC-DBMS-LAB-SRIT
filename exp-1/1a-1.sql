CREATE TABLE STUDENT (
    Name VARCHAR2(30),
    Student_number NUMBER,
    Class NUMBER,
    Major VARCHAR2(20)
);

CREATE TABLE COURSE (
    Course_name VARCHAR2(50),
    Course_number VARCHAR2(10),
    Credit_hours NUMBER,
    Department VARCHAR2(20)
);

CREATE TABLE SECTION (
    Section_identifier NUMBER,
    Course_number VARCHAR2(10),
    Semester VARCHAR2(20),
    Year NUMBER,
    Instructor VARCHAR2(30)
);

CREATE TABLE GRADE_REPORT (
    Student_number NUMBER,
    Section_identifier NUMBER,
    Grade CHAR(1)
);

CREATE TABLE PREREQUISITE (
    Course_number VARCHAR2(10),
    Prerequisite_number VARCHAR2(10)
);
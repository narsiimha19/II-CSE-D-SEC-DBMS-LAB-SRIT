CREATE TABLE STUDENT (
    Name VARCHAR2(30),
    Student_number NUMBER PRIMARY KEY,
    Class NUMBER,
    Major VARCHAR2(20)
);

CREATE TABLE COURSE (
    Course_name VARCHAR2(50),
    Course_number VARCHAR2(10) PRIMARY KEY,
    Credit_hours NUMBER NOT NULL,
    Department VARCHAR2(20)
);

CREATE TABLE SECTION (
    Section_identifier NUMBER PRIMARY KEY,
    Course_number VARCHAR2(10),
    Semester VARCHAR2(20) NOT NULL,
    Year NUMBER,
    Instructor VARCHAR2(30)
);

CREATE TABLE GRADE_REPORT (
    Student_number NUMBER,
    Section_identifier NUMBER,
    Grade CHAR(1) NOT NULL,
    PRIMARY KEY (Student_number, Section_identifier),
    FOREIGN KEY (Student_number) REFERENCES STUDENT(Student_number),
    FOREIGN KEY (Section_identifier) REFERENCES SECTION(Section_identifier)
);

CREATE TABLE PREREQUISITE (
    Course_number VARCHAR2(10),
    Prerequisite_number VARCHAR2(10),
    PRIMARY KEY (Course_number, Prerequisite_number),
    FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number)
);

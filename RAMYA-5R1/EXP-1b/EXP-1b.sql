--EXPERIMENT (1b)
--1.Implement the tables using the above constraints
CREATE TABLE Student
(
    Name VARCHAR2(20),
    Student_number NUMBER PRIMARY KEY,
    Class NUMBER,
    Major VARCHAR2(20) NOT NULL
);

CREATE TABLE Course
(
    Course_name VARCHAR2(40),
    Course_number VARCHAR2(10) PRIMARY KEY,
    Credit_hrs NUMBER NOT NULL,
    Department VARCHAR2(20)
);

CREATE TABLE Section
(
    Section_identifier NUMBER PRIMARY KEY,
    Course_number VARCHAR2(10),
    Semester VARCHAR2(10) NOT NULL,
    Year NUMBER,
    Instructor VARCHAR2(20),
    FOREIGN KEY(Course_number)
    REFERENCES Course(Course_number)
);

CREATE TABLE Grade_Report
(
    Student_number NUMBER,
    Section_identifier NUMBER,
    Grade CHAR(1) NOT NULL,
    PRIMARY KEY(Student_number,Section_identifier),
    FOREIGN KEY(Student_number)
    REFERENCES Student(Student_number),
    FOREIGN KEY(Section_identifier)
    REFERENCES Section(Section_identifier)
);

CREATE TABLE Prerequisite
(
    Course_number VARCHAR2(10),
    Prerequisite_number VARCHAR2(10),
    PRIMARY KEY(Course_number,Prerequisite_number),
    FOREIGN KEY(Course_number)
    REFERENCES Course(Course_number)
);



--2. Display the description of each table
DESC Student;
DESC Course;
DESC Section;
DESC Grade_Report;
DESC Prerequisite;


--3. Insert the values specified by the above database
--Student
INSERT INTO Student
VALUES('Smith',17,1,'CS');

INSERT INTO Student
VALUES('Brown',8,2,'CS');

--Course
INSERT INTO Course
VALUES('Intro to Computer Science','CS1310',4,'CS');

INSERT INTO Course
VALUES('Data Structures','CS3320',4,'CS');

INSERT INTO Course
VALUES('Discrete Mathematics','MATH2410',3,'MATH');

INSERT INTO Course
VALUES('Database','CS3380',3,'CS');

--Section
INSERT INTO Section
VALUES(85,'MATH2410','Fall',7,'King');

INSERT INTO Section
VALUES(92,'CS1310','Fall',7,'Anderson');

INSERT INTO Section
VALUES(102,'CS3320','Spring',8,'Knuth');

INSERT INTO Section
VALUES(112,'MATH2410','Fall',8,'Chang');

INSERT INTO Section
VALUES(119,'CS1310','Fall',8,'Anderson');

INSERT INTO Section
VALUES(135,'CS3380','Fall',8,'Stone');

--Grade_report
INSERT INTO Grade_Report
VALUES(17,112,'B');

INSERT INTO Grade_Report
VALUES(17,119,'C');

INSERT INTO Grade_Report
VALUES(8,85,'A');

INSERT INTO Grade_Report
VALUES(8,92,'A');

INSERT INTO Grade_Report
VALUES(8,102,'B');

INSERT INTO Grade_Report
VALUES(8,135,'A');

--Prerequisites
INSERT INTO Prerequisite
VALUES('CS3380','CS3320');

INSERT INTO Prerequisite
VALUES('CS3380','MATH2410');

INSERT INTO Prerequisite
VALUES('CS3320','CS1310');




--4. Display the instances of each table
SELECT * FROM Student;

SELECT * FROM Course;

SELECT * FROM Section;

SELECT * FROM Grade_Report;

SELECT * FROM Prerequisite;




--5. Add Branch attribute in Student table and describe it
ALTER TABLE Student
ADD Branch VARCHAR2(20);

DESC Student;



--6. Copy Major values into Branch and display
UPDATE Student
SET Branch = Major;

SELECT * FROM Student;



--7. Remove Major attribute
ALTER TABLE Student
DROP COLUMN Major;



--8. Change the name of Course_number to cid and describe
ALTER TABLE Course
RENAME COLUMN Course_number TO cid;

DESC Course;



--9. Change the Credit_hrs of Database course to 4
UPDATE Course
SET Credit_hrs = 4
WHERE Course_name = 'Database';




--10. Put NOT NULL constraint on Branch
ALTER TABLE Student
MODIFY Branch VARCHAR2(20) NOT NULL;



--11. Rename Student table to Pupil
RENAME Student TO Pupil;



--14. Remove the row of 'Data Structures' in Course
DELETE FROM Prerequisite
WHERE Course_number='CS3320';

DELETE FROM Section
WHERE Course_number='CS3320';

DELETE FROM Course
WHERE Course_name='Data Structures';





--13. Remove the rows of 'Fall' Semester in Section
DELETE FROM Grade_Report
WHERE Section_identifier IN
(
SELECT Section_identifier
FROM Section
WHERE Semester='Fall'
);

DELETE FROM Section
WHERE Semester='Fall';





--15. Remove all rows in all tables using TRUNCATE
TRUNCATE TABLE Grade_Report;

TRUNCATE TABLE Prerequisite;

TRUNCATE TABLE Section;

TRUNCATE TABLE Course;

TRUNCATE TABLE Pupil;





--17.Remove Grade_Report & Prerequisite permanently
DROP TABLE Grade_Report PURGE;

DROP TABLE Prerequisite PURGE;




--16.Remove Pupil, Course and Section so that they exist in Recycle Bin
DROP TABLE Section;

DROP TABLE Course;

DROP TABLE Pupil;



















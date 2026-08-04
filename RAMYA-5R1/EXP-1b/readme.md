# (1.b)  1.Impliment the tables with using constraints
```
CREATE TABLE Student
(
    Name VARCHAR2(20),
    Student_number NUMBER,
    Class NUMBER,
    Major VARCHAR2(20) NOT NULL,
    PRIMARY KEY(Student_number)
);


CREATE TABLE Course
(
    Course_name VARCHAR2(40),
    Course_number VARCHAR2(10),
    Credit_hrs NUMBER NOT NULL,
    Department VARCHAR2(20),
    PRIMARY KEY(Course_number)
);


CREATE TABLE Section
(
    Section_identifier NUMBER,
    Course_number VARCHAR2(10),
    Semester VARCHAR2(10) NOT NULL,
    Year NUMBER,
    Instructor VARCHAR2(20),
    PRIMARY KEY(Section_identifier),
    FOREIGN KEY(Course_number) REFERENCES Course(Course_number)
);


CREATE TABLE Grade_Report
(
    Student_number NUMBER,
    Section_identifier NUMBER,
    Grade CHAR(1) NOT NULL,
    PRIMARY KEY(Student_number,Section_identifier),
    FOREIGN KEY(Student_number) REFERENCES Student(Student_number),
    FOREIGN KEY(Section_identifier) REFERENCES Section(Section_identifier)
);


CREATE TABLE Prerequisite
(
    Course_number VARCHAR2(10),
    Prerequisite_number VARCHAR2(10),
    PRIMARY KEY(Course_number,Prerequisite_number),
    FOREIGN KEY(Course_number) REFERENCES Course(Course_number)
);

```
![output](op13.png)





# (1.b) 2.Display the description of each table.
```
DESC Student;
DESC Course;
DESC Section;
DESC Grade_Report;
DESC Prerequisite;
```
![output](op14.png)
![output](op15.png)




# (1.b) 3.Insert the values specified by the above database
```
INSERT INTO Student
VALUES('Smith',17,1,'CS');

INSERT INTO Student
VALUES('Brown',8,2,'CS');




INSERT INTO Course
VALUES('Intro to Computer Science','CS1310',4,'CS');

INSERT INTO Course
VALUES('Data Structures','CS3320',4,'CS');

INSERT INTO Course
VALUES('Discrete Mathematics','MATH2410',3,'MATH');

INSERT INTO Course
VALUES('Database','CS3380',3,'CS');

```
![output](op2.png)



```
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
```
![output](op4.png)


```
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
```
![output](op4.png)


```
INSERT INTO Prerequisite
VALUES('CS3380','CS3320');

INSERT INTO Prerequisite
VALUES('CS3380','MATH2410');

INSERT INTO Prerequisite
VALUES('CS3320','CS1310');
```
![output](op16.png)






# (1.b) 4.Display the instances of each table in the database.
 
```
SELECT * FROM Student;
```
![output](op8.png)


```
SELECT * FROM Course;
```
![output](op9.png)


```
SELECT * FROM Section;
```
![output](op10.png)


```
SELECT * FROM Grade_Report;
```
![output](op11.png)


```
SELECT * FROM Prerequisite;
```
![output](op17.png)







# (1.b) 5.Add branch attribute in student table and describe the table.
```
ALTER TABLE Student
ADD Branch VARCHAR2(20);

DESC Student;
```
![output](op18.png)







# (1.b) 6.Copy Major attribute values into branch attribute and display it.
```
UPDATE Student
SET Branch = Major;
```
![output](op19.png)


```
SELECT * FROM Student;
```
![output](op20.png)








# (1.b) 7.Remove Major attribute in students
```
ALTER TABLE Student
DROP COLUMN Major;

DESC Student;
```
![output](op21.png)








# (1.b) 8.Change the name of Course_number to cid in Course and describe it.
```
ALTER TABLE Course
RENAME COLUMN Course_number TO cid;

DESC Course;
```
![output](op22.png)







# (1.b) 9.Change the value of Credit_hours of Database to 4 in Course.
```
UPDATE Course
SET Credit_hrs = 4
WHERE Course_name = 'Database';
```
![output](op23.png)








# (1.b) 10.Put NOT NULL Constraint to column Branch in Student.
```
ALTER TABLE Student
MODIFY Branch VARCHAR2(20) NOT NULL;
```
![output](op24.png)








# (1.b) 11.Replace the Student table name to Pupil.
```
RENAME Student TO Pupil;
```
![output](op25.png)










#(1.b) 14.Remove the ros of Data_structure in Course.
```
DELETE FROM Grade_Report
WHERE Section_identifier=102;

DELETE FROM Prerequisite
WHERE Course_number='CS3320';

DELETE FROM Section
WHERE Course_number='CS3320';

DELETE FROM Course
WHERE Course_name='Data Structures';
```
![output](op26.png)








# (1.b) 13.Remove the rows of 'Fall' semester in Section.
```
DELETE FROM Grade_Report
WHERE Section_identifier IN
(
SELECT Section_identifier
FROM Section
WHERE Semester='Fall'
);


DELETE FROM Section
WHERE Semester = 'Fall';
```
![output](op26.png)









#(1.b) 15.Remove all rows in all tables using truncate.
```
TRUNCATE TABLE Grade_Report;

TRUNCATE TABLE Prerequisite;

TRUNCATE TABLE Section;

TRUNCATE TABLE Course;

TRUNCATE TABLE Pupil;
```
![output](op27.png)









# (1.b) 17.Remove Grade_report and Prerequisites table permanently.
```
DROP TABLE Grade_Report PURGE;

DROP TABLE Prerequisite PURGE;
```
![output](op28.png)








# (1.b) 16.Remove Pupil, Course and Section table so that it exists in recycle bin.
```
DROP TABLE Section;

DROP TABLE Course;

DROP TABLE Pupil;
```
![output](op29.png)

































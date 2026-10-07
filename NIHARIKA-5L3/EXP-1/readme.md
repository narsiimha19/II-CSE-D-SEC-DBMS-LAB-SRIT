#1. Implement the tables using constraints
```
CREATE TABLE student7(
Name VARCHAR2(20),
student_number NUMBER PRIMARY KEY,
class NUMBER,
Major VARCHAR2(20) not null )

CREATE TABLE COURSE7(
course_name VARCHAR2(40),
course_number VARCHAR2(10) PRIMARY KEY,
credit_hours NUMBER NOT NULL,
Department VARCHAR2(20) );

CREATE TABLE section7(
section_identifier NUMBER PRIMARY KEY,
course_number VARCHAR2(10),
semester VARCHAR2(20) not null,
year NUMBER,
Instructor VARCHAR2(20),
FOREIGN KEY (course_number) REFERENCES course (course_number));

CREATE TABLE Grade_report7(
student_number NUMBER,
Grade VARCHAR2(1) NOT NULL,
PRIMARY KEY (student_number,section_identifier),
FOREIGN KEY(student_number)REFERENCES student(student_number),
FOREIGN KEY(section_identifier)REFERENCES section7(section_identifier));
CREATE TABLE prerequisite(
course_number VARCHAR2(10),
prerequisite_number VARCHAR2(10),
PRIMARY KEY (course_number,prerequisite_number),
FOREIGN KEY (course_number) REFERENCES course(course_number));

```
![output](n3.png)/
![output](n4.png)

# 2.Display description of each table
```
DESC student;
DESC COURSE;
DESC section;
DESC Grade_report;
DESC prerequisite;
```
![output](n5.png)
![output](n6.png)
#3.INSERT VALUES
```
INSERT INTO student VALUES
('smith',26,2,'cs');
INSERT INTO student VALUES
('brown',6,4,'cs');
INSERT INTO student VALUES
('taylor',24,5,'math');
INSERT INTO course VALUES
('Intro_to_cs',132,8,'cs');
INSERT INTO course VALUES
('Data_structure',131,1,'cs');
INSERT INTO course VALUES
('Data_base',3324,6,'cs');
INSERT INTO section VALUES
(85,1301,'Fall',2001,'king');
INSERT INTO SECTION VALUES
(92,1310,'Fall',2005,'anderson');
INSERT INTO SECTION VALUES
(102,3320,'spring',2008,'Knuth');
INSERT INTO Grade_report VALUES
(17,112,'A');
INSERT INTO Grade_report VALUES
(17,119,'c');
INSERT INTO Grade_report VALUES
(8,85,'A');
INSERT INTO Grade_report VALUES
(8,92,'A');
INSERT INTO Grade_report VALUES
(8,102,'A');
INSERT INTO Grade_report VALUES
(8,135,'A');
INSERT INTO prerequisite VALUES
('130','130');
INSERT INTO prerequisite VALUES
('3320','130');
INSERT INTO prerequisite VALUES
('3320','132');
INSERT INTO prerequisite VALUES
('131','131');

```
![output](n7.png)
![output](n8.png)
![output](n9.png)
#4.Display instances of each table
```

SELECT*FROM student;
SELECT*FROM course;
SELECT*FROM section;
SELECT*FROM Grade_report;
SELECT*FROM prerequisite;
```
![output](b1.png)
![output](b2.png)
![output](b3.png)
![output](b4.png)
![output](b5.png)

#5.Add branch attribute to student and describe
```
ALTER TABLE student
ADD branch VARCHAR2(20);
DESC STUDENT;
```
![output](b6.png)
#6.copy major values into branch
```
UPDATE student
SET branch = major;
SELECT*FROM student;
```
![output](b7.png)
![output](b8.png)
#7.REmove major attribute
```
ALTER TABLE student
DROP COLUMN branch;
```
![output](b9.png)

#8. change course_number to CID and describe
```
ALTER TABLE course
 RENAME COLUMN course_number to CID;
 DESC course;
```
![output](c1.png)
![output](c2.png)
                      
#9.change credit_hours of database to 4 in course
```
UPDATE course
SET credit_HOUR =4;
SELECT *FROM course;
```
![out put](c3.png)
![output](c4.png)
#10.put not null constraints on branch
```
ALTER TABLE student
MODIFY branch VARCHAR2(20) NOT NULL;
```
![output](c5.png)
#11.rename student table to pupil
```
RENAME student to pupil;
```
![output](c6.png)
#12.Remove student table
```
DROP TABLE pupil CASCADE constraints;
```
![output](c7.png)
#13.remove rows of fall semester
```
DELETE FROM section
WHERE semester = 'Fall';
COMMIT;
```
![output](c8.png)
#14.remove data_structure row
```
DELETE FROM course
WHERE course_name ='data_structure';
COMMIT;
```
![output](c9.png)
#15.REmove all rows using TRUNCATE
```
TRUNCATE TABLE Grade_report;
TRUNCATE TABLE prerequisite;
TRUNCATE TABLE section;
TRUNCATE TABLE course;
TRUNCATE TABLE PUPIL;
```

![output](d2.png)
![output](d3.png)
#16.Remove pupil ,course and section tables (recyle bin)
```

DROP TABLE pupil;
DROP TABLE course;
DROP TABLE section;
```
![output](d4.png)
![output](d5.png)
![output](d6.png)
#17.remove grade_report and prerequisite permanently
```
DROP TABLE Grade_report PURGE;
DROP TABLE prerequisite PURGE;
```
![output](d7.png)



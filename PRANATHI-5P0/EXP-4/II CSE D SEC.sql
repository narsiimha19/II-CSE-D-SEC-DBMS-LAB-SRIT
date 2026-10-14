CREATE TABLE dept 
(
    dno NUMBER,
    dname VARCHAR2(20)
);

ALTER TABLE dept
ADD CONSTRAINT dept_pk PRIMARY KEY (dno);

ALTER TABLE dept
MODIFY dname VARCHAR2(20) NOT NULL;

CREATE TABLE student (
    sid NUMBER,
    sname VARCHAR2(20),
    did NUMBER
);

ALTER TABLE student
ADD CONSTRAINT student_pk PRIMARY KEY (sid);

ALTER TABLE student
MODIFY sname VARCHAR2(20) NOT NULL;

ALTER TABLE student
ADD CONSTRAINT student_dept_fk
FOREIGN KEY (did) REFERENCES dept(dno);

INSERT INTO dept VALUES (1, 'CSE');
INSERT INTO dept VALUES (2, 'ME');
INSERT INTO dept VALUES (3, 'CE');
INSERT INTO dept VALUES (4, 'EEE');
INSERT INTO dept VALUES (5, 'ECE');
INSERT INTO dept VALUES (6, 'CSM');
INSERT INTO dept VALUES (7, 'CSD');

INSERT INTO student VALUES (101, 'Ravi', 1);
INSERT INTO student VALUES (102, 'Anita', 2);
INSERT INTO student VALUES (103, 'Kiran', 3);
INSERT INTO student VALUES (104, 'Priya', 4);
INSERT INTO student VALUES (105, 'Arjun', 5);
INSERT INTO student VALUES (106, 'Sneha', 6);
INSERT INTO student VALUES (107, 'Rahul', 7);
INSERT INTO student VALUES (108, 'Divya', 1);
INSERT INTO student VALUES (109, 'Vijay', 2);
INSERT INTO student VALUES (110, 'Meena', 3);

SELECT * FROM student
JOIN dept
ON student.did = dept.dno;

SELECT *
FROM student, dept
WHERE student.did = dept.dno;

SELECT *
FROM student, dept
WHERE student.did > dept.dno;

SELECT *
FROM student
LEFT OUTER JOIN dept
ON student.did = dept.dno;

SELECT *
FROM student
RIGHT OUTER JOIN dept
ON student.did = dept.dno;

SELECT *
FROM student
FULL OUTER JOIN dept
ON student.did = dept.dno;

SELECT *
FROM student
LEFT OUTER JOIN dept
ON student.did = dept.dno;

SELECT *
FROM student
RIGHT OUTER JOIN dept
ON student.did = dept.dno;

SELECT *
FROM student
FULL OUTER JOIN dept
ON student.did = dept.dno;

SELECT *
FROM student
LEFT OUTER JOIN dept
ON student.did > dept.dno;

SELECT *
FROM student
RIGHT OUTER JOIN dept
ON student.did > dept.dno;

SELECT *
FROM student
FULL OUTER JOIN dept
ON student.did > dept.dno;

SELECT *
FROM student
CROSS JOIN dept;

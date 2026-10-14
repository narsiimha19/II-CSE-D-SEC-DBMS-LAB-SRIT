# 1. Create a dept table having dno, dname as columns.
```
CREATE TABLE dept (
    dno NUMBER,
    dname VARCHAR2(20)
);
```
![output](op01.png)

# 2. Apply appropriate constraints on dept table.
```
ALTER TABLE dept
ADD CONSTRAINT dept_pk PRIMARY KEY (dno);
ALTER TABLE dept
MODIFY dname VARCHAR2(20) NOT NULL;
```
![output](op02.png)

# 3. Create a student table having sid, sname, did as columns.
```
CREATE TABLE student (
    sid NUMBER,
    sname VARCHAR2(20),
    did NUMBER
);
```
![output](op03.png)

# 4. Apply appropriate constraints on student table.
```
ALTER TABLE student
ADD CONSTRAINT student_pk PRIMARY KEY (sid);
ALTER TABLE student
MODIFY sname VARCHAR2(20) NOT NULL;
ALTER TABLE student
ADD CONSTRAINT student_dept_fk
FOREIGN KEY (did) REFERENCES dept(dno);
```
![output](op04.png)

# 5. Insert 7 records into dept table.
```
INSERT INTO dept VALUES (1, 'CSE');
INSERT INTO dept VALUES (2, 'ME');
INSERT INTO dept VALUES (3, 'CE');
INSERT INTO dept VALUES (4, 'EEE');
INSERT INTO dept VALUES (5, 'ECE');
INSERT INTO dept VALUES (6, 'CSM');
INSERT INTO dept VALUES (7, 'CSD');
```
![ouput](op05.png)

# 6. Insert at least 10 records into student table.
```
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
```
![output](op06.png)
![output](op06.png)

# 7. Write a SQL Query to Implement NATURAL JOIN between Student and Dept.
```
SELECT * FROM student
JOIN dept
ON student.did = dept.dno;
```
![output](op07.png)

# 8. Write a SQL Query to Implement EQUI JOIN between Student and Dept.
```
SELECT * FROM student, dept
WHERE student.did = dept.dno;
```
![output](op08.png)

# 9. Write a SQL Query to Implement CONDITIONAL JOIN between Student and Dept.
```
SELECT * FROM student, dept
WHERE student.did > dept.dno;
```
![output](op09.png)

# 10. Write a SQL Query to Implement LEFT OUTER NATURAL JOIN between Student and Dept.
```
SELECT * FROM student
LEFT OUTER JOIN dept
ON student.did = dept.dno;
```
![output](op10.png)

# 11. Write a SQL Query to Implement RIGHT OUTER NATURAL JOIN between Student and Dept.
```
SELECT * FROM student
RIGHT OUTER JOIN dept
ON student.did = dept.dno;
```
![output](op11.png)

# 12. Write a SQL Query to Implement FULL OUTER NATURAL JOIN between Student and Dept.
```
SELECT * FROM student
FULL OUTER JOIN dept
ON student.did = dept.dno;
```
![output](op12.png)

# 13. Write a SQL Query to Implement LEFT OUTER EQUI JOIN between Student and Dept.
```
SELECT * FROM student
LEFT OUTER JOIN dept
ON student.did = dept.dno;
```
![output](op13.png)

# 14. Write a SQL Query to Implement RIGHT OUTER EQUI JOIN between Student and Dept.
```
SELECT * FROM student
RIGHT OUTER JOIN dept
ON student.did = dept.dno;
```
![output](op14.png)

# 15. Write a SQL Query to Implement FULL OUTER EQUI JOIN between Student and Dept.
```
SELECT * FROM student
FULL OUTER JOIN dept
ON student.did = dept.dno;
```
![output](op15.png)

# 16. Write a SQL Query to Implement LEFT OUTER CONDITIONAL JOIN between Student and Dept.
```
SELECT * FROM student
LEFT OUTER JOIN dept
ON student.did > dept.dno;
```
![output](op16.png)

# 17. Write a SQL Query to Implement RIGHT OUTER CONDITIONAL JOIN between Student and Dept.
```
SELECT * FROM student
RIGHT OUTER JOIN dept
ON student.did > dept.dno;
```
![output](op17.png)

# 18. Write a SQL Query to Implement FULL OUTER CONDITIONAL JOIN between Student and Dept.
```
SELECT * FROM student 
FULL OUTER JOIN dept 
ON student.did > dept.dno;
```
![output](op18.png)

# 19. Write a SQL Query to Implement CROSS JOIN between Student and Dept.
```
SELECT * FROM student 
CROSS JOIN dept;
```
![output](op19.png)
![output](op20.png)
![output](op21.png)

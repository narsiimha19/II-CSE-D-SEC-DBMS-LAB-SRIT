select *from employees;
CREATE VIEW emp_view AS
SELECT *
FROM employees;

CREATE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary
FROM employees;

SELECT *
FROM emp_view;

CREATE VIEW it_employees AS
SELECT *
FROM employees
WHERE department = 'IT';

CREATE VIEW high_salary AS
SELECT *
FROM employees
WHERE salary > 60000;

CREATE VIEW hyderabad_emp AS
SELECT *
FROM employees
WHERE city = 'Hyderabad';

CREATE VIEW female_emp AS
SELECT *
FROM employees
WHERE gender = 'F';

CREATE VIEW recent_employees AS
SELECT *
FROM employees
WHERE hire_date >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

SELECT employee_id, first_name, salary
FROM high_salary;

CREATE OR REPLACE VIEW emp_basic AS
SELECT employee_id, first_name, last_name, department, salary, city
FROM employees;

CREATE VIEW emp_salary_view AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WITH READ ONLY;

CREATE VIEW sales_emp AS
SELECT *
FROM employees
WHERE department = 'Sales'
WITH CHECK OPTION;

UPDATE emp_basic
SET salary = 70000
WHERE employee_id = 101;

DELETE FROM emp_view
WHERE employee_id = 107;

INSERT INTO emp_basic
(employee_id, first_name, last_name, department, salary, city)
VALUES
(111, 'Ravi', 'Kumar', 'IT', 55000, 'Hyderabad');

DESC emp_basic;

SELECT *
FROM it_employees;

SELECT *
FROM high_salary
WHERE salary > 70000;

SELECT *
FROM female_emp;

SELECT first_name, salary
FROM hyderabad_emp;

DROP VIEW emp_view;

DROP VIEW high_salary;

DROP VIEW emp_basic;

CREATE VIEW hr_employees AS
SELECT *
FROM employees
WHERE department = 'HR';

CREATE VIEW marketing_emp AS
SELECT employee_id, first_name, department, salary
FROM employees
WHERE department = 'Marketing';

CREATE VIEW top_earners AS
SELECT *
FROM employees
WHERE salary > 70000;

CREATE VIEW emp_city AS
SELECT employee_id, first_name, last_name, city
FROM employees;


















select *from tab;
drop table student;

CREATE TABLE dept (
    dno NUMBER(5),
    dname VARCHAR2(20)
);

ALTER TABLE dept
ADD CONSTRAINT dept_pk PRIMARY KEY (dno);

ALTER TABLE dept
MODIFY dname CONSTRAINT dept_dname_nn NOT NULL;

CREATE TABLE student (
    sid NUMBER(5),
    sname VARCHAR2(30),
    did NUMBER(5)
);

ALTER TABLE student
ADD CONSTRAINT student_pk PRIMARY KEY (sid);

ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;

ALTER TABLE student
ADD CONSTRAINT student_dept_fk
FOREIGN KEY (did)
REFERENCES dept(dno);

INSERT INTO dept VALUES (1, 'CSE');
INSERT INTO dept VALUES (2, 'ME');
INSERT INTO dept VALUES (3, 'CE');
INSERT INTO dept VALUES (4, 'EEE');
INSERT INTO dept VALUES (5, 'ECE');
INSERT INTO dept VALUES (6, 'CSM');
INSERT INTO dept VALUES (7, 'CSD');

INSERT INTO student VALUES (101, 'Ravi', 1);
INSERT INTO student VALUES (102, 'Sita', 1);
INSERT INTO student VALUES (103, 'Rahul', 2);
INSERT INTO student VALUES (104, 'Priya', 3);
INSERT INTO student VALUES (105, 'Arjun', 4);
INSERT INTO student VALUES (106, 'Sneha', 5);
INSERT INTO student VALUES (107, 'Kiran', 6);
INSERT INTO student VALUES (108, 'Anita', 7);
INSERT INTO student VALUES (109, 'Ramesh', 1);
INSERT INTO student VALUES (110, 'Lakshmi', 5);

COMMIT;

SELECT *
FROM student
NATURAL JOIN
(SELECT dno AS did, dname FROM dept);

SELECT *
FROM student s, dept d
WHERE s.did = d.dno;

SELECT *
FROM student s
JOIN dept d
ON s.did = d.dno;

SELECT *
FROM student
NATURAL LEFT OUTER JOIN
(SELECT dno AS did, dname FROM dept);

SELECT *
FROM student
NATURAL RIGHT OUTER JOIN
(SELECT dno AS did, dname FROM dept);

SELECT *
FROM student
NATURAL FULL OUTER JOIN
(SELECT dno AS did, dname FROM dept);

SELECT *
FROM student s
LEFT OUTER JOIN dept d
ON s.did = d.dno;

SELECT *
FROM student s
RIGHT OUTER JOIN dept d
ON s.did = d.dno;

SELECT *
FROM student s
FULL OUTER JOIN dept d
ON s.did = d.dno;

SELECT *
FROM student s
LEFT OUTER JOIN dept d
ON s.did = d.dno;

SELECT *
FROM student s
RIGHT OUTER JOIN dept d
ON s.did = d.dno;

SELECT *
FROM student s
FULL OUTER JOIN dept d
ON s.did = d.dno;


SELECT *
FROM student
CROSS JOIN dept;

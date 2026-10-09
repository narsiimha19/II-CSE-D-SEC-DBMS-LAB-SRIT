## CREATE STUDENT TABLE
```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
## CREATE BEFORE INSERT TRIGGER
```
CREATE OR REPLACE TRIGGER trg_student_before_insert
BEFORE INSERT ON student
FOR EACH ROW
BEGIN

    -- Validate Student ID
    IF :NEW.student_id <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Student ID must be greater than 0.'
        );
    END IF;

    -- Validate Student Name
    IF :NEW.student_name IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Student Name cannot be NULL.'
        );
    END IF;

    -- Validate Marks
    IF :NEW.marks < 0 OR :NEW.marks > 100 THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Marks must be between 0 and 100.'
        );
    END IF;

END;
/
```
## INSERT VALID RECORD
```
INSERT INTO student
VALUES (101, 'Ravi', 'CSE', 85);

COMMIT;
```
## INSERT AN INVALID RECORD
```
INSERT INTO student
VALUES (102, 'Sita', 'ECE', 120);
```
## TEST ANOTHER INVALID
```
INSERT INTO student
VALUES (-103, 'Kiran', 'EEE', 75);
```
## DISPLAY
```
SELECT * FROM student;
```
# PROGRAM-2 AFTER TRIGGER

## CREATING TABLE
```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
## CREATE AUDIT TABLE
```
CREATE TABLE student_audit (
    audit_id      NUMBER(5),
    student_id    NUMBER(5),
    student_name  VARCHAR2(50),
    course        VARCHAR2(30),
    marks         NUMBER(5,2),
    action        VARCHAR2(20),
    action_date   DATE
);
```
## Create a Sequence for the Audit ID

```
CREATE SEQUENCE student_audit_seq
START WITH 1
INCREMENT BY 1;
```
## CREATE AFTER INSERT TRIGGER
```
CREATE OR REPLACE TRIGGER trg_student_after_insert
AFTER INSERT ON student
FOR EACH ROW
BEGIN

    INSERT INTO student_audit (
        audit_id,
        student_id,
        student_name,
        course,
        marks,
        action,
        action_date
    )
    VALUES (
        student_audit_seq.NEXTVAL,
        :NEW.student_id,
        :NEW.student_name,
        :NEW.course,
        :NEW.marks,
        'INSERT',
        SYSDATE
    );

END;
/
```
## INSERT ING
```
INSERT INTO student
VALUES (101, 'Ravi', 'CSE', 85);

COMMIT;
```
## VERIFY TABLE
```
SELECT * FROM student;
```
## DTISPLAY AUDIT TABLE
```
SELECT * FROM student_audit;
```


# PROGRAM -3
## CREATING
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);

```
## INSERT
```

INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);

COMMIT;
```
## replace trigger
```
CREATE OR REPLACE TRIGGER trg_employee_before_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN

    -- Compare old and new salary
    IF :NEW.salary < :OLD.salary THEN

        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary cannot be decreased.'
        );

    END IF;

END;
/
```
## update a valid record
```
UPDATE employee
SET salary = 33000

WHERE employee_id = 101;

COMMIT;
```
# verify
```
SELECT * FROM employee
WHERE employee_id = 101;
```
# invalid record
```
UPDATE employee
SET salary = 28000
WHERE employee_id = 101;
```

# DISPLAY
```
SELECT * FROM EMPLOYEE;
```

# PROGRAM-4
##CREAETU
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
# INSERT
```
INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);
INSERT INTO employee VALUES (105, 'Rahul', 'ECE', 38000);

COMMIT;
```
## CREATE LOG TABLE
```
CREATE TABLE employee_delete_log (
    log_id        NUMBER(5),
    message       VARCHAR2(200),
    delete_date   DATE
);
```
# CREATE SEQUENCE
```
CREATE SEQUENCE employee_delete_log_seq
START WITH 1
INCREMENT BY 1;
```
# CREATE AFTER DELETION
```
CREATE OR REPLACE TRIGGER trg_employee_after_delete
AFTER DELETE ON employee
BEGIN

    INSERT INTO employee_delete_log (
        log_id,
        message,
        delete_date
    )
    VALUES (
        employee_delete_log_seq.NEXTVAL,
        'DELETE statement executed on EMPLOYEE table.',
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE(
        'DELETE statement executed successfully.'
    );

END;
/
```
# VERIFY TRIGGER
```

SELECT trigger_name, status
FROM user_triggers
WHERE trigger_name = 'TRG_EMPLOYEE_AFTER_DELETE';


```
# 
```
SET SERVEROUTPUT ON;

DELETE FROM employee
WHERE employee_id = 101;

COMMIT;

```

# VERIGY
```
SELECT * FROM employee;
```
# TEST
```
DELETE FROM employee
WHERE department = 'ECE';

COMMIT;
```
# DUSPLAY
```
SELECT * FROM employee_delete_log;
```

# Program 5: INSTEAD OF Trigger

# CREATE
```
CREATE TABLE course (
    course_id   NUMBER(5) PRIMARY KEY,
    course_name VARCHAR2(50)
);
```
# CREATE STUDENT
```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course_id    NUMBER(5),
    marks        NUMBER(5,2),
    CONSTRAINT fk_student_course
        FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);
```
# INSERT
```
INSERT INTO course VALUES (1, 'Computer Science');
INSERT INTO course VALUES (2, 'Electronics');
INSERT INTO course VALUES (3, 'Electrical');

COMMIT;
```
# CREATE VIEW
```
CREATE OR REPLACE VIEW student_course_view AS
SELECT
    s.student_id,
    s.student_name,
    s.course_id,
    c.course_name,
    s.marks
FROM student s
JOIN course c
    ON s.course_id = c.course_id;
```
# DISPLAY
```
SELECT * FROM student_course_view;
```
# CREATE INSTEAD OF TRIGGER
```
CREATE OR REPLACE TRIGGER trg_student_view_update
INSTEAD OF UPDATE ON student_course_view
FOR EACH ROW
BEGIN

    UPDATE student
    SET
        student_name = :NEW.student_name,
        marks = :NEW.marks
    WHERE student_id = :OLD.student_id;

END;
/
```
# UPDATE VIEW
```
UPDATE student_course_view
SET marks = 95
WHERE student_id = 101;

COMMIT;
```
# VERIFY
```
SELECT * FROM student;
```
# VERIFY VIEW
```
SELECT * FROM student_course_view;
```
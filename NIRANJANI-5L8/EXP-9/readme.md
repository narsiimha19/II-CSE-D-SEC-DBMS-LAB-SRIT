# EXPERIMENT - 9

# Program 1: BEFORE Trigger

# 1. Create the STUDENT Table
```

CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
![output](p11.png)
```
```
# 2. Create the BEFORE INSERT Trigger
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
    END IF;

END;
/
```
![output](p12.png)
```
```
# 3. Insert a Valid Record
```
VALUES (101, 'Ravi', 'CSE', 85);

COMMIT;
```
![output](p13.png)
```
```
# 4. Insert an Invalid Record
```
INSERT INTO student
VALUES (102, 'Sita', 'ECE', 120);
INSERT INTO student
VALUES (-103, 'Kiran', 'EEE', 75);
```
![output](p14.png)
```
```
# 6. Display the Final Table
```
SELECT * FROM student;
```
![output](p16.png)
```
```
# Program 2: AFTER Trigger
# 1. Create the Main Table
```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
```
![output](p21.png)
```
```
# 2. Create the Audit Table
```
CREATE TABLE student_audit (
    audit_id      NUMBER(5),
    student_id    NUMBER(5),
    student_name  VARCHAR2(50),
    course        VARCHAR2(30),
    action        VARCHAR2(20),
    action_date   DATE
);
```
![output](p22.png)
```
```
# 3. Create a Sequence for the Audit ID
```
START WITH 1
INCREMENT BY 1;
```
![output](p23.png)
```
```
# 4. Create the AFTER INSERT Trigger
```
CREATE OR REPLACE TRIGGER trg_student_after_insert
AFTER INSERT ON student
FOR EACH ROW
BEGIN
    INSERT INTO student_audit (
        audit_id,
        student_name,
        course,
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
    );

/
```
![output](p24.png)
```
```
# 5. Insert a New Record into the Main Table
```
INSERT INTO student
VALUES (101, 'Ravi', 'CSE', 85);

COMMIT;
```
![output](p25.png)
```
```
# 6. Verify the Main Table
```
SELECT * FROM student;
```
![output](p26.png)
```
```
# 7. Display the Audit Table
```
SELECT * FROM student_audit;
```
![output](p27.png)
```
```
# Program 3: Row-Level Trigger
# 1. Create the EMPLOYEE Table
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![output](p31.png)
```
```
# 2. Insert Sample Employee Records
```
INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);

COMMIT;
```
![output](p32.png)
```
```
# 3. Create the BEFORE UPDATE Trigger
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
![output](p33.png)
```
```
# 4. Update a Valid Record
```
UPDATE employee
SET salary = 33000

WHERE employee_id = 101;

COMMIT;
```
![output](p34.png)
```
```
# 5. Update an Invalid Record
```
UPDATE employee
SET salary = 28000

WHERE employee_id = 101;
```
![output](p35.png)
```
```
# 6. Display the Table Contents
```
SELECT * FROM employee;
```
![output](p36.png)
```
```
# Program 4: Statement-Level Trigger
# 1. Create the Main Table
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
```
![output](p41.png)
```
```
# 2. Insert Sample Records
```
INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);
INSERT INTO employee VALUES (105, 'Rahul', 'ECE', 38000);
```
![output](p42.png)
```
```

# 3. Create the Log Table
```
CREATE TABLE employee_delete_log (
    delete_date   DATE
START WITH 1
```
![output](p43.png)
```
```
# 4. Create a Sequence for the Log ID
```

CREATE SEQUENCE employee_delete_log_seq
);
    message       VARCHAR2(200),
    log_id        NUMBER(5),
COMMIT;
);

END;
        SYSDATE
        marks,
        student_id,


END;

SELECT trigger_name, status
WHERE trigger_name = 'TRG_EMPLOYEE_AFTER_DELETE';
```
![output](p44.png)
```
```
# 5. Create the AFTER DELETE Statement-Level Trigger
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
```
![output](p45.png)
```
```
# 6. Verify the Trigger
```
SELECT trigger_name, status
FROM user_triggers
WHERE trigger_name = 'TRG_EMPLOYEE_AFTER_DELETE';
```
![output](p46.png)
```
```
# 7. Delete One Record
```
SET SERVEROUTPUT ON;
DELETE FROM employee
WHERE employee_id = 101;

COMMIT;
```
![output](p47.png)
```
```
# 8. Verify the DELETE Operation
```
SELECT * FROM employee;
```
![output](p48.png)
```
```
# 9. Test Statement-Level Behavior
```
DELETE FROM employee
WHERE department = 'ECE';

COMMIT;
```
![output](p49.png)
```
```
# 10. Display the Log Table
```
SELECT * FROM employee_delete_log;

```
![output](p410.png)
```
```
# Program 5: INSTEAD OF Trigger
```
Create COURSE Table

CREATE TABLE course (
    course_id   NUMBER(5) PRIMARY KEY,
    course_name VARCHAR2(50)
);
```
![output](p51.png)
```
```
#Create STUDENT Table
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
![output](p52.png)
```
```
# 2. Insert Sample Records
```
Insert Course Records
INSERT INTO course VALUES (1, 'Computer Science');
INSERT INTO course VALUES (2, 'Electronics');
INSERT INTO course VALUES (3, 'Electrical');

COMMIT;
```
![output](p53.png)
```
```
#
```
Insert Student Records
INSERT INTO student VALUES (101, 'Ravi', 1, 85);
INSERT INTO student VALUES (102, 'Sita', 2, 90);
INSERT INTO student VALUES (103, 'Kiran', 3, 78);
INSERT INTO student VALUES (104, 'Anjali', 1, 88);
```
![output](p54.png)
```
```
# 7. Verify the View
```
SELECT * FROM student_course_view;
```
![output](p55.png)
```
```


# 3. Create a View
```
SELECT * FROM student;
CREATE OR REPLACE VIEW student_course_view AS
SELECT

COMMIT;
```
![oputput](p56.png)
```
```
# 6. Verify the Base Table
 ```
   s.student_id,
    s.student_name,
    s.course_id,
SET marks = 95
WHERE student_id = 101;
    c.course_name,
END;
```
![output](p57.png)
```
```
# 5. Update the View
```
UPDATE student_course_view
    s.marks
    WHERE student_id = :OLD.student_id;

FROM student s
JOIN course c
    ON s.course_id = c.course_id;
        marks = :NEW.marks


        student_name = :NEW.student_name,
Display the View
SELECT * FROM student_course_view;
    SET
BEGIN

    UPDATE student
```
![output](p58.png)
```
```
# 4. Create the INSTEAD OF UPDATE Trigger
```
CREATE OR REPLACE TRIGGER trg_student_view_update
INSTEAD OF UPDATE ON student_course_view
FOR EACH ROW


FROM user_triggers
```
![output](p59.png)
```
```
# 6. Verify the Trigger
```
    DBMS_OUTPUT.PUT_LINE(
        'DELETE statement executed successfully.'
    );
    VALUES (
        employee_delete_log_seq.NEXTVAL,
        'DELETE statement executed on EMPLOYEE table.',
        SYSDATE
    );

CREATE SEQUENCE student_audit_seq
BEGIN
    INSERT INTO employee_delete_log (
        log_id,
        message,
        delete_date
    )

    marks         NUMBER(5,2),
);

AFTER DELETE ON employee
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_employee_after_delete

5. Create the AFTER DELETE Statement-Level Trigger
5. Test Another Invalid Record
INSERT INTO student
```
![output](p510.png)
```
```

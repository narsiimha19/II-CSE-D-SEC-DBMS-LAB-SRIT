# (9).1.Create the STUDENT Table
```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
![output](9.1a.png)

# (9).2.Create the BEFORE INSERT Trigger
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
![output](9.1b.png)

# (9).3.Insert a valid record
```

INSERT INTO student
VALUES (101, 'Ravi', 'CSE', 85);

COMMIT;
```
![output](9.1c.png)

# (9).4.Insert an valid record
```
INSERT INTO student
VALUES (102, 'Sita', 'ECE', 120);
```
![output](9.1d.png)

# (9).5.Test Another invalid record
```
INSERT INTO student
VALUES (-103, 'Kiran', 'EEE', 75);
```
![output](9.1e.png)

# (9).6.Display the final table
```
SELECT * FROM student;
```
![output](9.1f.png)

# (9).Program 2.1.Create the main table
```

CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
![output](9.2a.png)

# (9).2.Create the audit table
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
![output](9.2b.png)

# (9).3.Create a sequence for the audit ID
```
CREATE SEQUENCE student_audit_seq
START WITH 1
INCREMENT BY 1;
```
![output](9.2c.png)

# (9).Create the after insert trigger
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
![output](9.2d.png)

# (9).5.Insert a new record into the main table
```
INSERT INTO student
VALUES (101, 'Ravi', 'CSE', 85);

COMMIT;
```
![output](9.2e.png)

# (9).6.Verify the main table
```
SELECT * FROM student;
```
![output](9.2f.png)

# (9).7.Display the audit table
```
SELECT * FROM student_audit;
```
![output](9.2g.png)

# (9).program 3.1.Create the employee table
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![output](9.3a.png)

# (9).2.Insert sample employee records
```
INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);

COMMIT;
```
![output](9.3b.png)

# (9).3.Create the BEFORE UPDATE Trigger
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
![output](9.3c.png)

# (9).4.update a valid record
```
UPDATE employee
SET salary = 33000

WHERE employee_id = 101;

COMMIT;
SELECT * FROM employee
WHERE employee_id = 101;
```
![output](9.3d.png)
![output](9.3e.png)

# (9).5.update an invalid record
```

UPDATE employee
SET salary = 28000
WHERE employee_id = 101;
```
![output](9.3f.png)

# (9).6.Display the table contents
```
SELECT * FROM employee;
```
![output](9.3g.png)

# (9).program 4.1.Create the main table
```

CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![output](9.4a.png)

# (9).2.Insert sample records
```

INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);
INSERT INTO employee VALUES (105, 'Rahul', 'ECE', 38000);

COMMIT;
```
![output](9.4b.png)

# (9).3.Create the log table
```
CREATE TABLE employee_delete_log (
    log_id        NUMBER(5),
    message       VARCHAR2(200),
    delete_date   DATE
);
```
![output](9.4c.png)

# (9).4.Create a sequence for thr log ID
```
CREATE SEQUENCE employee_delete_log_seq
START WITH 1
INCREMENT BY 1;
```
![output](9.4d.png)

# (9).5.Create the AFTER DELETE statement level trigger
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
![output](9.4e.png)

# (9).6.Verify the trigger
```

SELECT trigger_name, status
FROM user_triggers
WHERE trigger_name = 'TRG_EMPLOYEE_AFTER_DELETE';
```
![output](9.4f.png)

# (9).7.Delete one record
```
SET SERVEROUTPUT ON;

DELETE FROM employee
WHERE employee_id = 101;

COMMIT;
```
![output](9.4g.png)

# (9).8.Verify the Delete operation
```
SELECT * FROM empoyee;
```
![output](9.4h.png)

# (9).9.Test statement level Behavior
```
DELETE FROM employee
WHERE department = 'ECE';

COMMIT;
```
![output](9.4i.png)

# (9).10.Display the log table
```
SELECT * FROM employee_delete_log;
```
![output](9.4j.png)

# (9).Program 5.1.Create the base tables
```

CREATE TABLE course (
    course_id   NUMBER(5) PRIMARY KEY,
    course_name VARCHAR2(50)
);



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
![output](9.5a.png)
![output](9.5b.png)

# (9).2.Insert sample records
```
INSERT INTO course VALUES (1, 'Computer Science');
INSERT INTO course VALUES (2, 'Electronics');
INSERT INTO course VALUES (3, 'Electrical');

COMMIT;

INSERT INTO student VALUES (101, 'Ravi', 1, 85);
INSERT INTO student VALUES (102, 'Sita', 2, 90);
INSERT INTO student VALUES (103, 'Kiran', 3, 78);
INSERT INTO student VALUES (104, 'Anjali', 1, 88);

COMMIT;
```
![output](9.5c.png)
![output](9.5d.png)

# (9).3.Create a view
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

SELECT * FROM student_course_view;
```
![output](9.5e.png)
![output](9.5f.png)

# (9).Create the instead of update trigger
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
```
![output](9.5g.png)

# (9).5.Update the view
```
UPDATE student_course_view
SET marks = 95
WHERE student_id = 101;

COMMIT;
```
![output](9.5h.png)

# (9).6.Verify the base table
```
SELECT * FROM student;
```
![output](9.5i.png)

# (9).7.Verify the view
```
SELECT 8 FROM student_course_view;
```
![output](9.5j.png)


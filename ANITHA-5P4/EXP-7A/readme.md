# (7a). Create table and insert sample records
```
SET SERVEROUTPUT ON;

CREATE TABLE student (
    st
udent_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);

INSERT INTO student VALUES (101, 'Ravi', 'CSE', 85);
INSERT INTO student VALUES (102, 'Sita', 'CSE', 92);
INSERT INTO student VALUES (103, 'Kiran', 'ECE', 78);
INSERT INTO student VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student VALUES (105, 'Rahul', 'CSE', 74);

COMMIT;
```
![output](7a1.png)
![output](7a2.png)
![output](7a3.png)

# (7a). Create the stored procedure
```
CREATE OR REPLACE PROCEDURE GET_STUDENT_DETAILS (
    p_student_id   IN  student.student_id%TYPE,
    p_student_name OUT student.student_name%TYPE,
    p_marks        OUT student.marks%TYPE
)
IS
BEGIN
    -- Retrieve student details
    SELECT student_name, marks
    INTO p_student_name, p_marks
    FROM student
    WHERE student_id = p_student_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_student_name := NULL;
        p_marks := NULL;

        DBMS_OUTPUT.PUT_LINE(
            'No student found with ID: ' || p_student_id
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
```
![output](7a4.png)

# (7a). Execute of procedure by creating anonymous PL/SQL block
```
DECLARE
    -- Variables to receive OUT parameter values
    v_student_name student.student_name%TYPE;
    v_marks        student.marks%TYPE;

BEGIN
    -- Call the procedure
    GET_STUDENT_DETAILS(
        101,
        v_student_name,
        v_marks
    );

    -- Display returned values
    IF v_student_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE(
            'Student Name : ' || v_student_name
        );

        DBMS_OUTPUT.PUT_LINE(
            'Marks        : ' || v_marks
        );
    END IF;

END;
```
![output](7a5.png)
![output](7a6.png)



# (7a). Enable server output
```
SET SERVEROUTPUT ON;
```
![output](7a7.png)


# (7a). Create two bind variables
```
VARIABLE V_name VARCHAR2(50);
VARIABLE v_marks NUMBER;
```
![output](7a8.png)

# (7a).Call the Procedure
```
EXEC GET_STUDENT_DETAILS(101, :V_name, :V_marks);
```
![output](7a9.png)

# (7a). print the two binded variable;
```
PRINT v_name;
PRINT v_marks;
```
![output](7a10.png)
![output](7a11.png)
![output](7a12.png)


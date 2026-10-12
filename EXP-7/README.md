-- Drop old table if it exists to prevent 'Table already exists' error
DROP TABLE student PURGE;

-- Create Student Table
CREATE TABLE student (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    marks NUMBER(5,2)
);
INSERT INTO student (student_id, student_name, marks) VALUES (101, 'Raju', 85);
INSERT INTO student (student_id, student_name, marks) VALUES (102, 'Priya', 72);
INSERT INTO student (student_id, student_name, marks) VALUES (103, 'Kiran', 45);
INSERT INTO student (student_id, student_name, marks) VALUES (108, 'Sneha', 58);

COMMIT;
CREATE OR REPLACE FUNCTION GET_GRADE(p_marks IN NUMBER)
RETURN VARCHAR2 IS
BEGIN
    IF p_marks >= 80 THEN
        RETURN 'A (Distinct)';
    ELSIF p_marks >= 60 THEN
        RETURN 'B (First Class)';
    ELSIF p_marks >= 50 THEN
        RETURN 'C (Second Class)';
    ELSIF p_marks >= 40 THEN
        RETURN 'D (Pass)';
    ELSE
        RETURN 'F (Fail)';
    END IF;
END;
/
SELECT 
    student_id, 
    student_name, 
    marks, 
    GET_GRADE(marks) AS Grade 
FROM student;

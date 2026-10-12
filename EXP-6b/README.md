SET SERVEROUTPUT ON;

DECLARE
    -- Standard variables without table dependencies
    v_student_id    NUMBER;
    v_student_name  VARCHAR2(50);
    v_marks         NUMBER;
    v_age           NUMBER;

    -- User-defined exception
    e_invalid_marks EXCEPTION;

BEGIN
    -- 1. WHILE LOOP: Display numbers from 1 to 5
    DBMS_OUTPUT.PUT_LINE('--- WHILE LOOP ---');
    v_student_id := 1;
    WHILE v_student_id <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Value: ' || v_student_id);
        v_student_id := v_student_id + 1;
    END LOOP;


    -- 2. NUMERIC FOR LOOP: Display numbers from 1 to 5
    DBMS_OUTPUT.PUT_LINE('-------------------------');
    DBMS_OUTPUT.PUT_LINE('--- NUMERIC FOR LOOP ---');
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Value: ' || i);
    END LOOP;


    -- 3. NESTED FOR LOOP: Multiplication tables from 1 to 3
    DBMS_OUTPUT.PUT_LINE('-------------------------');
    DBMS_OUTPUT.PUT_LINE('--- MULTIPLICATION TABLES ---');
    FOR i IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('Table of ' || i);
        FOR j IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || (i * j));
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;


    -- 4. Sample Student Details Setup (Without requiring DB table)
    v_student_id   := 101;
    v_student_name := 'Ravi';
    v_marks        := 85;

    DBMS_OUTPUT.PUT_LINE('--- STUDENT DETAILS ---');
    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);


    -- 5. Validate Student's Marks
    IF v_marks > 100 THEN
        RAISE e_invalid_marks;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Marks Validation: Valid marks.');
    END IF;


    -- 6. Validate Student's Age (Handled with custom output instead of abrupt error stop)
    v_age := 17;
    DBMS_OUTPUT.PUT_LINE('-------------------------');
    DBMS_OUTPUT.PUT_LINE('--- AGE VALIDATION ---');
    
    IF v_age < 18 THEN
        DBMS_OUTPUT.PUT_LINE('Age Validation Warning: Student age (' || v_age || ') is below 18.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Age Validation: Student age is valid.');
    END IF;

EXCEPTION
    WHEN e_invalid_marks THEN
        DBMS_OUTPUT.PUT_LINE('Error: Student marks cannot be greater than 100.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

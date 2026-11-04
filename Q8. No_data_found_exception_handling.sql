DECLARE
    v_name students.student_name%TYPE;
BEGIN
    SELECT student_name
    INTO v_name
    FROM students
    WHERE student_id = 999;

    DBMS_OUTPUT.PUT_LINE(v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student does not exist.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
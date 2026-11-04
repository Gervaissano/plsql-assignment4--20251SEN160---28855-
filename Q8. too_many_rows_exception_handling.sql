DECLARE
    v_name students.student_name%TYPE;
BEGIN
    SELECT student_name
    INTO v_name
    FROM students;

    DBMS_OUTPUT.PUT_LINE(v_name);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Multiple students returned. Use a cursor.'
        );

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No students found.');
END;
/
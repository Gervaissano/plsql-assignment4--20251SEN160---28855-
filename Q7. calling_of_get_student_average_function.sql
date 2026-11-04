DECLARE
    v_average NUMBER;
BEGIN
    v_average := get_student_average(1);

    DBMS_OUTPUT.PUT_LINE(
        'Average marks: ' || ROUND(v_average, 2)
    );

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
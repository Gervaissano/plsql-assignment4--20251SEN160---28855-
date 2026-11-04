SET SERVEROUTPUT ON;

DECLARE
    v_message VARCHAR2(200);
BEGIN
    register_student(
        1006,
        3,
        103,
        78,
        v_message
    );

    DBMS_OUTPUT.PUT_LINE(v_message);

    IF v_message = 'Student registered successfully.' THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END;
/
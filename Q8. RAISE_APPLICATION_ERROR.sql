
SET SERVEROUTPUT ON;

DECLARE
    v_marks NUMBER := 120;
    e_invalid_marks EXCEPTION;
BEGIN
    IF v_marks < 0 OR v_marks > 100 THEN
        RAISE e_invalid_marks;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Marks accepted.');

EXCEPTION
    WHEN e_invalid_marks THEN
        BEGIN
            RAISE_APPLICATION_ERROR(
                -20002,
                'Invalid marks. Enter marks between 0 and 100.'
            );
        EXCEPTION
            WHEN OTHERS THEN
                IF SQLCODE = -20002 THEN
                    DBMS_OUTPUT.PUT_LINE(SQLERRM);
                ELSE
                    RAISE;
                END IF;
        END;
END;
/

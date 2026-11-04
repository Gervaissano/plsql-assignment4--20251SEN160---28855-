CREATE OR REPLACE FUNCTION get_student_average (
    p_student_id IN NUMBER
)
RETURN NUMBER
AS
    v_average NUMBER;
    v_count NUMBER;
BEGIN
    SELECT COUNT(*), AVG(marks)
    INTO v_count, v_average
    FROM registrations
    WHERE student_id = p_student_id;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Student has no registered marks.'
        );
    END IF;

    RETURN v_average;

EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/
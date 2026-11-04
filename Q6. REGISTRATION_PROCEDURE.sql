CREATE OR REPLACE PROCEDURE register_student (
    p_registration_id IN NUMBER,
    p_student_id IN NUMBER,
    p_course_id IN NUMBER,
    p_marks IN NUMBER,
    p_message OUT VARCHAR2
)
AS
    e_invalid_marks EXCEPTION;
BEGIN
    IF p_marks < 0 OR p_marks > 100 THEN
        RAISE e_invalid_marks;
    END IF;

    INSERT INTO registrations (
        registration_id,
        student_id,
        course_id,
        marks,
        registration_date
    )
    VALUES (
        p_registration_id,
        p_student_id,
        p_course_id,
        p_marks,
        SYSDATE
    );

    p_message := 'Student registered successfully.';

EXCEPTION
    WHEN e_invalid_marks THEN
        p_message := 'Error: Marks must be between 0 and 100.';

    WHEN DUP_VAL_ON_INDEX THEN
        p_message := 'Error: Duplicate registration or ID.';

    WHEN OTHERS THEN
        p_message := 'Registration failed: ' || SQLERRM;
END;
/
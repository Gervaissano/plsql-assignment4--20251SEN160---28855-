CREATE TABLE courses (
    course_id NUMBER
        CONSTRAINT pk_courses PRIMARY KEY,
    course_name VARCHAR2(100) NOT NULL,
    credits NUMBER(2)
        CONSTRAINT chk_courses_credits CHECK (credits > 0)
);
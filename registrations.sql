CREATE TABLE registrations (
    registration_id NUMBER
        CONSTRAINT pk_registrations PRIMARY KEY,
    student_id NUMBER NOT NULL,
    course_id NUMBER NOT NULL,
    marks NUMBER(5,2),
    registration_date DATE DEFAULT SYSDATE NOT NULL,

    CONSTRAINT fk_reg_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_reg_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CONSTRAINT chk_reg_marks
        CHECK (marks BETWEEN 0 AND 100),

    CONSTRAINT uq_student_course
        UNIQUE (student_id, course_id)
);
CREATE TABLE students (
    student_id NUMBER
        CONSTRAINT pk_students PRIMARY KEY,
    student_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100)
        CONSTRAINT uq_students_email UNIQUE
);
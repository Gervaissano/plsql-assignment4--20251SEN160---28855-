SELECT
    student_id,
    student_name,
    get_student_average(student_id) AS average_marks
FROM students
WHERE student_id = 1;
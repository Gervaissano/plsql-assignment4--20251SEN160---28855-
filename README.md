# plsql-assignment4--20251SEN160---28855-
Assignment 4 about Advanced Oracle PL/SQL Programming

## Student Registration and Grading Management System

A practical Oracle PL/SQL database application developed as a **group assignment by two students**. The project demonstrates the use of records, collections, implicit cursors, explicit cursors, bulk processing, stored procedures, functions, and exception handling.

> **Group members:**  
> 1. Sano Gervais — Student ID: `2025SEN160`  
> 2. MUKANEZA Claire — Student ID: `28855`

> **Course/Module:** Oracle PL/SQL  
> **Database:** Oracle Database 21c  
> **Project type:** Group assignment

---

## 1. Application Overview

The **Student Registration and Grading Management System** supports the management of university students, courses, registrations, and marks. It provides a structured way to store academic information and demonstrate practical database programming with Oracle PL/SQL.

### Main objectives

- Store and display student and course information.
- Manage student course registrations and marks.
- Calculate student average marks.
- Display registration, pass, and fail results.
- Demonstrate PL/SQL records and collections.
- Use implicit and explicit cursors to work with database rows.
- Demonstrate bulk processing with `BULK COLLECT` and `FORALL`.
- Implement stored procedures, functions, and meaningful exception handling.

## 2. Repository Structure

```text
plsql-assignment4-<studentID1>-<studentID2>/
├── README.md
├── .gitignore
├── 00_schema/
│   ├── 01_create_tables.sql
│   └── 02_insert_sample_data.sql
├── 01_procedures/
│   └── registration_procedure.sql
├── 02_functions/
│   └── get_student_average_function.sql
├── 03_tests/
│   ├── test_success_cases.sql
│   └── test_error_cases.sql
├── screenshots/
│   ├── displaying_values_of_students.PNG
│   ├── Displaying_values_of_courses.PNG
│   ├── display_registrations_and_marks_test.PNG
│   ├── Student_average.PNG
│   ├── calling_get_student_average_function.PNG
│   ├── Display_pass_and_fail_results.PNG
│   └── RAISE_APPLICATION_ERROR_test.PNG
└── docs/
    └── IMPLEMENTATION_NOTES.md
```

The links below use the suggested directory structure. If the files currently remain in another location in the repository, update the relative paths to match their committed locations.

## 3. Project Files

### Database schema and sample data

- [Students table script](student.sql)
- [Courses table script](course.sql)
- [Registrations table script](registrations.sql)
- [Student sample values](values_in_student.sql)
- [Course sample values](courses_value.sql)
- [Registration sample values](registrations_value.sql)

### Stored procedures

- [Registration procedure](Q6.REGISTRATION_PROCEDURE.sql)
- [Calling the registration procedure](01_procedures/Q6.%20CALLING_PROCEDURE.sql)

### Stored functions

- [Get student average function](Q7.get_student_average_function.sql)
- [Call average function using PL/SQL](Q7.calling_of_get_student_average_function.sql)
- [Call average function using SQL](Q7.calling_get_student_average_function_using_sql.sql)

### Exception handling

- [NO_DATA_FOUND exception handling](Q8.No_data_found_exception_handling.sql)
- [TOO_MANY_ROWS exception handling](Q8.too_many_rows_exception_handling.sql)
- [RAISE_APPLICATION_ERROR example](Q8.RAISE_APPLICATION_ERROR.sql)

### Test evidence and screenshots

- [Student table output](displaying_values_students.PNG)
- [Course table output](screenshots/Displaying_values_of_courses.PNG)
- [Registration and marks output](screenshots/display_registrations_and_marks%20test.PNG)
- [Student average output](screenshots/Student_average.PNG)
- [Calling the average function output](screenshots/calling_get_student_average_function.PNG)
- [Pass and fail results](screenshots/Display_pass_and_fail_results.PNG)
- [RAISE_APPLICATION_ERROR test output](screenshots/RAISE_APPLICATION_ERROR%20test.PNG)

### Documentation

- [Implementation notes](docs/IMPLEMENTATION_NOTES.md)

## 4. Database Design

The application uses three core relational tables:

- **STUDENTS:** Stores student IDs, names, and email addresses.
- **COURSES:** Stores course IDs, names, and credit values.
- **REGISTRATIONS:** Connects students to courses and stores marks and registration dates.

### Relationships

- One student can have multiple registrations.
- One course can appear in multiple registrations.
- Each registration refers to one existing student and one existing course.

### Constraints

The schema applies primary keys, foreign keys, required fields, unique values, and validation checks. Marks are restricted to the range of 0–100, and duplicate registration of the same student in the same course is prevented.

## 5. PL/SQL Concepts Demonstrated

| Concept | Application |
|---|---|
| Records and `%ROWTYPE` | Group and retrieve related student information |
| Collections | Hold multiple marks or student records |
| Implicit cursors | Inspect the effects of DML statements |
| Explicit cursors | Retrieve and process registration rows |
| `BULK COLLECT` | Fetch multiple rows into collections |
| `FORALL` | Execute bulk DML efficiently |
| Stored procedures | Register students for courses |
| Stored functions | Calculate student average marks |
| Exception handling | Respond to missing data, duplicates, invalid marks, and other errors |

## 6. How to Run

**Prerequisites:** Oracle Database 21c (or a compatible Oracle version) and Oracle SQL Developer or SQL*Plus.

1. Open the project in your preferred SQL editor.
2. Connect to your Oracle schema.
3. Run the table creation scripts in `00_schema/`.
4. Run the sample data scripts in `00_schema/`.
5. Compile the stored procedure and function scripts.
6. Run the test scripts in `03_tests/`.
7. Enable output before executing PL/SQL demonstrations:

   ```sql
   SET SERVEROUTPUT ON;
   ```

8. Review the screenshots and implementation notes.

**Execution order:** Create parent tables (`students`, `courses`) before the `registrations` table. Insert students and courses before inserting registrations.

> Run the scripts in a test schema. Re-running insert scripts may cause duplicate-key errors. Review transaction and rollback behavior before testing operations that modify data.

## 7. Testing

The project includes demonstrations of successful operations and error scenarios, including:

- Displaying students, courses, and registrations.
- Calculating student averages.
- Displaying pass and fail results.
- Handling missing records with `NO_DATA_FOUND`.
- Handling multi-row results with `TOO_MANY_ROWS`.
- Handling duplicate values and invalid marks.
- Demonstrating application errors using `RAISE_APPLICATION_ERROR`.

Screenshots provide evidence of selected execution results. The test scripts should be used to reproduce the demonstrations.

## 8. Performance Considerations

Bulk processing can reduce context switching between the PL/SQL and SQL engines when processing many rows. `BULK COLLECT` retrieves multiple rows into a collection, while `FORALL` performs bulk DML using collection values.

For large result sets, consider fetching in batches with `LIMIT` to manage memory. For bulk DML, use appropriate error handling, review partial-success behavior, and make transaction decisions deliberately. Performance benefits depend on workload and data volume.

## 9. Group Contribution

This assignment was completed collaboratively by two group members. Both members contributed to the planning, implementation, testing, documentation, and/or presentation of the database application.

**Group Member 1:** Sano Gervais  
**Group Member 2:** [Add full name]

Update this section to accurately reflect each member's actual responsibilities.

## 10. Presentation

During the demonstration, the group will:

1. Introduce the application and its purpose.
2. Explain the schema and relationships.
3. Show the inserted sample data.
4. Demonstrate records, collections, and cursors.
5. Demonstrate bulk processing.
6. Run the registration procedure and average function.
7. Show successful tests and exception-handling scenarios.
8. Summarize implementation choices and performance considerations.

---

**Project:** Student Registration and Grading Management System  
**Technology:** Oracle SQL and PL/SQL  
**Submission:** Group Assignment — Two Members
"""

path = Path("/mnt/data/README.md")
path.write_text(content, encoding="utf-8")
print(f"Created: {path} ({path.stat().st_size} bytes)")

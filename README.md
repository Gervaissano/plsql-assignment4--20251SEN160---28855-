# Oracle PL/SQL Assignment IV
## Records, Collections, Cursors and Bulk Processing

**Course:** Oracle Database and PL/SQL  
**Database Platform:** Oracle Database 21c  
**Project:** Student Registration and Grading Management System  
**Project Type:** Group Assignment (Two Members)

---

## 1. Group Members

This assignment was completed collaboratively by two group members.

• Sano Gervais — Student ID: 2025SEN160
• MUKANEZA Claire — Student ID: 28855

---

## 2. Application Description

The Student Registration and Grading Management System is a practical database application developed using Oracle SQL and PL/SQL.

The application is designed to manage university student information, available courses, student registrations, and academic marks.

The system demonstrates how Oracle PL/SQL programming concepts can be applied to solve real-world academic management problems.

### Main Objectives

- Manage student information.
- Create and manage academic courses.
- Register students for different courses.
- Store and retrieve student examination marks.
- Calculate student averages.
- Display student pass and fail results.
- Apply exception handling to manage invalid operations.
- Demonstrate efficient database processing using collections and bulk operations.

---

## 3. Technologies Used

- **Oracle Database 21c:** Database management system.
- **Oracle SQL:** Database creation, data insertion, and retrieval.
- **PL/SQL:** Stored procedures, functions, records, collections, and cursors.
- **Oracle SQL Developer:** Database development and execution environment.
- **GitHub:** Source code storage and project documentation.

---

## 4. Database Schema

The application uses three main database tables.

| Table | Description |
|---|---|
| STUDENTS | Stores student identification and personal information. |
| COURSES | Stores available academic courses and their credits. |
| REGISTRATIONS | Connects students with courses and stores their marks. |

### Database Relationships

- One student can have multiple course registrations.
- One course can have multiple student registrations.
- Each registration belongs to one student and one course.

### Database Constraints

The database uses primary keys, foreign keys, unique constraints, NOT NULL constraints, and CHECK constraints to maintain data integrity.

### Database Files

| File | Description |
|---|---|
| [student.sql](./student.sql) | Creates the students table. |
| [courses.sql](./courses.sql) | Creates the courses table. |
| [registrations.sql](./registrations.sql) | Creates the registrations table and relationships. |
| [values_in_student.sql](./values_in_student.sql) | Inserts student sample data. |
| [courses_value.sql](./courses_value.sql) | Inserts course sample data. |
| [registrations_value.sql](./registrations_value.sql) | Inserts registration sample data. |

---

## 5. Stored Procedures

Stored procedures are used to perform database operations through reusable PL/SQL programs.

The application implements a student registration procedure that accepts registration information, validates marks, and inserts registration records into the database.

| File | Description |
|---|---|
| [Q6. REGISTRATION_PROCEDURE.sql](./Q6.%20REGISTRATION_PROCEDURE.sql) | Defines the student registration procedure with input and output parameters. |
| [Q6. CALLING_PROCEDURE.sql](./Q6.%20CALLING_PROCEDURE.sql) | Demonstrates how to execute the registration procedure. |

---

## 6. Stored Functions

The application uses a stored function to calculate the average examination marks of a student.

The function accepts a student ID, retrieves the student's registered marks, calculates the average, and returns the result.

| File | Description |
|---|---|
| [Q7. get_student_average_function.sql](./Q7.%20get_student_average_function.sql) | Defines the student average calculation function. |
| [Q7. calling_of_get_student_average_function.sql](./Q7.%20calling_of_get_student_average_function.sql) | Demonstrates calling the function using an anonymous PL/SQL block. |
| [Q7. calling_get_student_average_function_using_sql.sql](./Q7.%20calling_get_student_average_function_using_sql.sql) | Demonstrates calling the stored function through an SQL statement. |

---

## 7. Exception Handling

Exception handling is implemented to manage database errors and invalid operations.

The application demonstrates predefined exceptions and application-generated errors.

| File | Description |
|---|---|
| [Q8. No_data_found_exception_handling.sql](./Q8.%20No_data_found_exception_handling.sql) | Handles situations where a requested student record does not exist. |
| [Q8. too_many_rows_exception_handling.sql](./Q8.%20too_many_rows_exception_handling.sql) | Demonstrates handling queries that return multiple rows when one row is expected. |
| [Q8. RAISE_APPLICATION_ERROR.sql](./Q8.%20RAISE_APPLICATION_ERROR.sql) | Demonstrates user-defined exceptions and RAISE_APPLICATION_ERROR. |

---

## 8. Screenshots and Execution Results

The following screenshots provide visual evidence of the application's execution and database operations.

| Screenshot | Description |
|---|---|
| [Displaying values of students.png](./displaying%20values%20of%20students.PNG) | Shows the student records stored in the database. |
| [Displaying values of courses.png](./Displaying_values_of_courses.PNG) | Shows the available courses. |
| [Display pass and fail results.png](./Display_pass_and_fail_results.PNG) | Demonstrates the pass and fail classification. |
| [Student average.png](./Student_average.PNG) | Shows the calculated student average. |
| [Calling student average function.png](./calling_get_student_average_function.PNG) | Shows the execution of the average function. |
| [Registration and marks.png](./display_registrations_and_marks%20test.PNG) | Displays student registrations and examination marks. |
| [RAISE_APPLICATION_ERROR test.png](./RAISE_APPLICATION_ERROR%20test.PNG) | Demonstrates application error handling. |

---

## 9. Implementation Notes and Performance Considerations

The implementation demonstrates important Oracle PL/SQL programming concepts, including records, collections, implicit cursors, explicit cursors, BULK COLLECT, FORALL, stored procedures, functions, and exception handling.

Bulk processing is particularly important when working with large amounts of database information.

BULK COLLECT retrieves multiple rows into a collection in a single operation, while FORALL executes bulk DML operations efficiently.

Compared with processing every record individually, bulk processing reduces communication overhead between the SQL and PL/SQL engines and can improve performance when handling large datasets.

Additional implementation explanations and performance considerations are provided in:

**[IMPLEMENTATION_NOTES.md](./IMPLEMENTATION_NOTES.md)**

---

## 10. How to Run the Application

Follow these steps to execute the project in Oracle SQL Developer or another compatible Oracle environment.

1. Open Oracle SQL Developer and connect to your Oracle Database 21c instance.
2. Execute the table creation scripts in the following order:
   - [student.sql](./student.sql)
   - [courses.sql](./courses.sql)
   - [registrations.sql](./registrations.sql)
3. Insert sample data using:
   - [values_in_student.sql](./values_in_student.sql)
   - [courses_value.sql](./courses_value.sql)
   - [registrations_value.sql](./registrations_value.sql)
4. Execute the stored procedure definition and its calling script.
5. Create and execute the student average function.
6. Run the exception-handling programs to test successful and unsuccessful operations.
7. Execute the verification queries and compare the results with the provided screenshots.

**Important:** Execute the scripts in the correct order to ensure that the required tables and relationships exist before inserting records.

---

## 11. Conclusion

This project demonstrates the practical application of Oracle SQL and PL/SQL in developing a Student Registration and Grading Management System.

Through collaborative development, the group applied database design principles and PL/SQL programming techniques to manage student records, course registrations, academic marks, and examination results.

The assignment also demonstrates the importance of exception handling, reusable stored procedures, functions, and efficient bulk processing in developing reliable database applications.

---

**Project:** Oracle PL/SQL Assignment IV  
**Application:** Student Registration and Grading Management System  
**Contributors:** Two Group Members  
**Database:** Oracle Database 21c

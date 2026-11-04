# IMPLEMENTATION_NOTES.md

# Student Registration and Grading Management System

## 1. Introduction

This project is a Student Registration and Grading Management System developed using Oracle Database 21c and PL/SQL.

The system helps manage:

- Student information
- Course information
- Student course registrations
- Student marks
- Student average marks

The main purpose is to reduce manual work, improve accuracy, and make student information easier to manage.

## 2. Database Implementation

The system uses three main tables.

### 2.1 Students Table

The `students` table stores student information.

Columns:

- `student_id`: Unique student identification number.
- `student_name`: Student's full name.
- `email`: Student's email address.

Constraints:

- Primary key prevents duplicate student IDs.
- NOT NULL ensures that the student name is provided.
- UNIQUE prevents duplicate email addresses.

### 2.2 Courses Table

The `courses` table stores course information.

Columns:

- `course_id`: Unique course identification number.
- `course_name`: Name of the course.
- `credits`: Number of course credits.

Constraints:

- Primary key identifies each course.
- NOT NULL ensures the course name is provided.
- CHECK ensures that credits are greater than zero.

### 2.3 Registrations Table

The `registrations` table connects students with courses.

Columns:

- `registration_id`: Unique registration number.
- `student_id`: Identifies the registered student.
- `course_id`: Identifies the selected course.
- `marks`: Student's marks.
- `registration_date`: Date of registration.

Constraints:

- Primary key prevents duplicate registration IDs.
- Foreign keys ensure that the student and course exist.
- CHECK ensures marks are between 0 and 100.
- UNIQUE prevents the same student from registering for the same course twice.
- DEFAULT SYSDATE automatically provides the registration date when it is not supplied.

## 3. PL/SQL Implementation

### 3.1 Records

Records allow us to store related information in one variable.

In this project, a record can hold information such as:

- Student ID
- Student name
- Average marks

Records make it easier to handle student information together instead of using separate variables for every field.

### 3.2 Collections

Collections allow us to store multiple values in one variable.

For example, a collection can store registration IDs or student marks.

Collections are useful when processing many students or registrations at the same time.

### 3.3 Implicit Cursors

Oracle automatically creates an implicit cursor when SQL statements such as INSERT, UPDATE, DELETE, or SELECT INTO are executed.

For example:

```sql
UPDATE registrations
SET marks = 85
WHERE registration_id = 1001;

DBMS_OUTPUT.PUT_LINE(
    SQL%ROWCOUNT || ' row(s) updated.'
);
```

`SQL%ROWCOUNT` tells us how many rows were affected by the latest SQL statement.

### 3.4 Explicit Cursors

Explicit cursors allow us to process query results one row at a time.

They are useful when displaying students and their registrations individually.

A cursor can:

1. Open the query.
2. Fetch a row.
3. Process the row.
4. Continue until no more rows remain.
5. Close the cursor.

### 3.5 BULK COLLECT

`BULK COLLECT` retrieves multiple rows into a collection in one operation.

It reduces repeated communication between the PL/SQL engine and the SQL engine.

This can improve performance when processing many registration records.

### 3.6 FORALL

`FORALL` sends collection-based DML operations in batches.

For example, it can update marks for multiple registrations.

It is generally more efficient than running the same UPDATE statement repeatedly inside a normal loop.

## 4. Procedures and Functions

### 4.1 Registration Procedure

The registration procedure adds a student to a course.

The procedure should:

1. Receive the student ID and course ID.
2. Check that the student exists.
3. Check that the course exists.
4. Insert the registration.
5. Handle errors if registration fails.

The database constraints provide additional protection against invalid data.

### 4.2 Average Marks Function

The average marks function calculates the average marks of a student.

Example:

```sql
SELECT AVG(marks)
INTO v_average
FROM registrations
WHERE student_id = p_student_id;
```

The function can return the average to the user.

If no registrations contain marks, AVG returns NULL. The application should handle this situation appropriately.

## 5. Testing and Results

Testing helps confirm that the system works correctly and handles invalid operations safely.

### Test 1: Create Tables

**Purpose:** Confirm that all database tables are created.

Expected result:

- STUDENTS created successfully.
- COURSES created successfully.
- REGISTRATIONS created successfully.

Verification:

```sql
SELECT table_name
FROM user_tables
WHERE table_name IN (
    'STUDENTS',
    'COURSES',
    'REGISTRATIONS'
);
```

If the tables already exist, Oracle may return ORA-00955 because the table name is already being used.

This does not always mean the original table is damaged. Check whether the table already exists before creating it again.

### Test 2: Insert Student Information

**Purpose:** Check whether student information can be saved.

Example:

```sql
INSERT INTO students
VALUES (1, 'Sano Gervais', 'sano@gmail.com');
```

Expected result:

- One row inserted.

Possible failure:

- ORA-00001: A primary key or unique constraint was violated.
- ORA-01400: A required column received NULL.

These errors protect the database against duplicate or incomplete information.

### Test 3: Register a Student

**Purpose:** Check whether an existing student can register for an existing course.

Example:

```sql
INSERT INTO registrations
    (registration_id, student_id, course_id, marks)
VALUES
    (1001, 1, 101, 85);
```

Expected result:

- Registration saved successfully.
- Registration date is automatically supplied.

Possible failure:

- ORA-02291: The student or course does not exist.
- ORA-00001: A unique constraint was violated.
- ORA-02290: A CHECK constraint was violated.

For example, registering student 99 when student 99 does not exist will fail because of the foreign key constraint.

### Test 4: Invalid Marks

**Purpose:** Confirm that marks outside the allowed range are rejected.

Example:

```sql
INSERT INTO registrations
    (registration_id, student_id, course_id, marks)
VALUES
    (1006, 1, 101, 120);
```

Expected result:

- The INSERT fails.
- Oracle raises ORA-02290 because the marks violate the CHECK constraint.

Marks such as -5 and 120 must not be accepted.

This protects the accuracy of student results.

### Test 5: Duplicate Registration

**Purpose:** Prevent one student from registering for the same course more than once.

Expected result:

- The second registration fails.
- Oracle raises ORA-00001 because of the unique constraint on student_id and course_id.

The student may register for another course, provided the registration is valid.

### Test 6: Calculate Average Marks

**Purpose:** Confirm that the average marks function gives the correct result.

Sample registrations:

| Course              | Marks |
| ------------------- | ----: |
| Database Management |    85 |
| Cybersecurity       |    90 |

Calculation:

Average = (85 + 90) / 2

Average = 87.5

Expected result:

- The function returns 87.5.

If the student has no marked registrations, the function should handle NULL or return a clearly defined result.

### Test 7: Implicit Cursor

**Purpose:** Confirm that the system can identify affected rows.

Example:

```sql
UPDATE registrations
SET marks = 88
WHERE registration_id = 1001;

DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
```

Expected result:

- Output: 1, if the registration exists and one row is updated.

If the registration does not exist:

- Output: 0.

### Test 8: Explicit Cursor

**Purpose:** Confirm that the system can retrieve registrations individually.

Expected result:

- Each matching registration is fetched and displayed.
- Processing stops when no more rows are available.

The cursor should be closed after processing.

### Test 9: BULK COLLECT

**Purpose:** Retrieve multiple registration records into a collection.

Expected result:

- Matching records are loaded into the collection.
- The collection can be processed using a loop.

If no records match:

- The collection is empty.
- The program should not assume that it contains data.

### Test 10: FORALL

**Purpose:** Confirm that multiple records can be updated using bulk processing.

Expected result:

- Valid updates are processed.
- The program reports the result correctly.

If a FORALL statement fails, the behavior depends on the exception-handling method.

With ordinary FORALL, an unhandled DML error stops the operation and raises an exception. Do not assume that every update succeeded.

With `SAVE EXCEPTIONS`, Oracle can continue processing eligible DML operations and report errors through `SQL%BULK_EXCEPTIONS`.

The program should identify which records failed and why.

### Test 11: Invalid Student ID

**Purpose:** Confirm that the registration procedure handles nonexistent students.

Expected result:

- Registration is rejected.
- The procedure displays or raises an appropriate error message.

If the procedure uses `SELECT INTO`, it may receive ORA-01403 (`NO_DATA_FOUND`) when the student does not exist.

### Test 12: Transaction Handling

**Purpose:** Confirm that successful and failed database operations are handled correctly.

Example:

```sql
SAVEPOINT before_test;

UPDATE registrations
SET marks = 95
WHERE registration_id = 1001;

ROLLBACK TO before_test;
```

Expected result:

- The update is undone.
- The previous marks are restored.

COMMIT should only be used when the transaction is ready to be saved.

## 6. Understanding Failures and Exceptions

Failures are important because they show where the system needs to protect data or guide the user.

### Common Oracle Errors

| Error     | Meaning                                                     |
| --------- | ----------------------------------------------------------- |
| ORA-00001 | Duplicate value violates a unique or primary key constraint |
| ORA-01400 | NULL inserted into a required column                        |
| ORA-01403 | No data found                                               |
| ORA-01422 | SELECT INTO returned multiple rows                          |
| ORA-02290 | CHECK constraint violated                                   |
| ORA-02291 | Foreign key parent record not found                         |
| ORA-00942 | Table or view does not exist or is inaccessible             |
| ORA-00955 | Object name already exists                                  |
| ORA-06502 | PL/SQL value or conversion error                            |

### Exception Handling

PL/SQL uses exception handling to respond to errors.

Example:

```sql
BEGIN
    INSERT INTO registrations
        (registration_id, student_id, course_id, marks)
    VALUES
        (1010, 1, 101, 85);

    DBMS_OUTPUT.PUT_LINE(
        'Registration successful.'
    );

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE(
            'Registration failed: duplicate value.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
        RAISE;
END;
/
```

The example handles duplicate values and reports other errors.

The `RAISE` statement allows an unhandled error to reach the caller. It is useful when the application must know that the operation failed.

In production, errors should be logged appropriately without exposing confidential information.

## 7. Performance Explanation

The system can improve performance through suitable database design and PL/SQL processing.

### 7.1 Primary Keys and Constraints

Primary keys and unique constraints help maintain data integrity and use indexes to support lookups.

Foreign keys ensure that registrations refer to valid students and courses.

### 7.2 Explicit Cursor vs Bulk Processing

An explicit cursor processes rows one at a time.

This is simple and useful when each row requires different processing.

However, processing many rows individually may require many SQL-to-PL/SQL context switches.

`BULK COLLECT` and `FORALL` can reduce those switches and improve performance for larger datasets.

### 7.3 LIMIT with BULK COLLECT

For a large number of rows, fetching everything into memory may consume too much memory.

Using `LIMIT` allows records to be fetched in batches.

Example:

```sql
FETCH registration_cursor
BULK COLLECT INTO registration_collection
LIMIT 500;
```

The cursor can be fetched repeatedly until all rows have been processed.

### 7.4 FORALL Performance

FORALL can improve performance when applying similar INSERT, UPDATE, or DELETE operations to multiple records.

However, performance depends on:

- Number of records
- SQL statement complexity
- Indexes
- Available memory
- Database workload
- Error-handling strategy

For a small sample of five registrations, the difference may be difficult to measure.

For a larger dataset, the difference may be more noticeable.

### 7.5 Avoid Unnecessary Queries

The system should avoid repeatedly querying the same information when it can be retrieved efficiently.

Useful practices include:

- Selecting only required columns.
- Filtering records using WHERE.
- Using suitable indexes.
- Avoiding unnecessary nested loops.
- Using bulk processing for suitable operations.

## 8. Test Summary

The following tests should be performed before the final demonstration.

- [ ] Tables created successfully.
- [ ] Valid student data inserted.
- [ ] Valid courses inserted.
- [ ] Valid registrations inserted.
- [ ] Invalid marks rejected.
- [ ] Duplicate registrations rejected.
- [ ] Invalid student and course IDs rejected.
- [ ] Average marks calculated correctly.
- [ ] Implicit cursor row count checked.
- [ ] Explicit cursor tested.
- [ ] BULK COLLECT tested.
- [ ] FORALL tested.
- [ ] Exception handling tested.
- [ ] Transaction rollback tested.

**Important:** Mark each test as PASS or FAIL only after executing it and checking the actual result.

## 9. Live Demonstration Plan

During the demonstration:

1. Introduce the Student Registration and Grading Management System.
2. Show the three database tables.
3. Display sample students and courses.
4. Demonstrate a successful registration.
5. Demonstrate an invalid marks attempt.
6. Show the duplicate registration error.
7. Calculate a student's average marks.
8. Demonstrate an implicit cursor.
9. Demonstrate an explicit cursor.
10. Show BULK COLLECT and FORALL.
11. Demonstrate exception handling.
12. Explain performance improvements.

Enable DBMS_OUTPUT in Oracle SQL Developer before running PL/SQL blocks that use DBMS_OUTPUT.PUT_LINE.

## 10. Conclusion

This project demonstrates how Oracle Database 21c and PL/SQL can be used to manage student registration and grading information.

Records and collections help organize data. Cursors help retrieve and process records. BULK COLLECT and FORALL help improve performance for suitable workloads.

Constraints and exception handling protect the database against invalid operations.

The project provides a practical example of database development, data validation, transaction management, and performance improvement.

# School Management System (MySQL)

A beginner-to-advanced MySQL capstone project for managing student
records, teachers, classes, subjects, enrollments, and examination
results.

This project demonstrates relational database design and practical SQL
skills commonly used in database administration and data analyst roles.

## Project Overview

**Project name:** School Management System\
**Database:** `school_management`\
**DBMS:** MySQL 8.0+\
**Tables:** 6

### Objectives

-   Store and manage student and teacher information.
-   Organize classes, sections, and subjects.
-   Track student enrollments by academic year.
-   Store examination marks and generate performance reports.
-   Practise SQL from basic queries to advanced database features.

## Database Schema

The database contains six tables:

  -----------------------------------------------------------------------
  Table                   Purpose                 Primary key
  ----------------------- ----------------------- -----------------------
  `students`              Student personal and    `student_id`
                          admission details       

  `teachers`              Teacher details,        `teacher_id`
                          specialization, and     
                          salary                  

  `classes`               Class, section, room,   `class_id`
                          and class teacher       

  `subjects`              Subjects and assigned   `subject_id`
                          teachers                

  `enrollments`           Student-to-class        `enrollment_id`
                          enrollment by academic  
                          year                    

  `exam_results`          Student marks for each  `result_id`
                          subject and exam        
  -----------------------------------------------------------------------

## ER Diagram

The following Mermaid ER diagram can be viewed directly on GitHub in the
rendered README.

``` mermaid
erDiagram
    TEACHERS ||--o{ CLASSES : manages
    TEACHERS ||--o{ SUBJECTS : teaches
    STUDENTS ||--o{ ENROLLMENTS : has
    CLASSES ||--o{ ENROLLMENTS : contains
    STUDENTS ||--o{ EXAM_RESULTS : receives
    SUBJECTS ||--o{ EXAM_RESULTS : records

    STUDENTS {
        INT student_id PK
        VARCHAR student_name
        DATE dob
        VARCHAR gender
        VARCHAR city
        VARCHAR email UK
        DATE admission_date
    }

    TEACHERS {
        INT teacher_id PK
        VARCHAR teacher_name
        VARCHAR subject_specialization
        VARCHAR email UK
        DECIMAL salary
        DATE hire_date
    }

    CLASSES {
        INT class_id PK
        VARCHAR class_name
        VARCHAR section
        INT teacher_id FK
        INT room_number
    }

    SUBJECTS {
        INT subject_id PK
        VARCHAR subject_name
        INT teacher_id FK
    }

    ENROLLMENTS {
        INT enrollment_id PK
        INT student_id FK
        INT class_id FK
        DATE enrollment_date
        VARCHAR academic_year
    }

    EXAM_RESULTS {
        INT result_id PK
        INT student_id FK
        INT subject_id FK
        VARCHAR exam_type
        DATE exam_date
        DECIMAL marks_obtained
        DECIMAL total_marks
    }
```

### Relationship summary

-   One teacher can be assigned to multiple classes.
-   One teacher can teach multiple subjects.
-   One student can have multiple enrollment records across academic
    years.
-   One class can contain multiple enrollment records.
-   One student can have multiple exam results.
-   One subject can appear in multiple exam results.

**Design note:** The `exam_results` table links students directly to
subjects. The current schema does not enforce that a student's enrolled
class offers a particular subject.

## Repository Structure

``` text
School-Management-System/
│
├── README.md
│
├── SQL/
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Insert_Data.sql
│   ├── 04_Basic_Queries.sql
│   ├── 05_Joins.sql
│   ├── 06_Subqueries.sql
│   ├── 07_Advanced_SQL.sql
│   └── 08_Views_Triggers_Procedures.sql
│
├── Documentation/
│   └── Project_Report.pdf
│
└── Screenshots/
    └── Query_Outputs/
```

## Requirements

-   MySQL Server 8.0 or later
-   MySQL Workbench or another MySQL client
-   Basic understanding of SQL

## Installation and Setup

1.  Clone or download this repository.
2.  Open MySQL Workbench and connect to your MySQL server.
3.  Run the SQL scripts in the following order:

``` sql
SOURCE /path/to/SQL/01_Create_Database.sql;
SOURCE /path/to/SQL/02_Create_Tables.sql;
SOURCE /path/to/SQL/03_Insert_Data.sql;
```

Replace `/path/to/` with the actual location of the downloaded project.
Alternatively, open each `.sql` file in Workbench and execute it.

4.  Select the database:

``` sql
USE school_management;
```

5.  Confirm that the tables and sample records were created:

``` sql
SHOW TABLES;

SELECT COUNT(*) AS total_students FROM students;
SELECT COUNT(*) AS total_teachers FROM teachers;
SELECT COUNT(*) AS total_classes FROM classes;
SELECT COUNT(*) AS total_subjects FROM subjects;
SELECT COUNT(*) AS total_enrollments FROM enrollments;
SELECT COUNT(*) AS total_exam_results FROM exam_results;
```

## Sample SQL Queries

The examples below use the table and column names in this project.

### 1. Display all students

``` sql
SELECT *
FROM students;
```

### 2. Find students from Kolkata

``` sql
SELECT student_id, student_name, city
FROM students
WHERE city = 'Kolkata';
```

### 3. Count students city-wise

``` sql
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city
ORDER BY total_students DESC;
```

### 4. Display students with their class and section

``` sql
SELECT
    s.student_name,
    c.class_name,
    c.section
FROM students AS s
JOIN enrollments AS e
    ON s.student_id = e.student_id
JOIN classes AS c
    ON e.class_id = c.class_id;
```

### 5. Display student names, subjects, and marks

``` sql
SELECT
    s.student_name,
    sub.subject_name,
    er.marks_obtained,
    er.total_marks
FROM exam_results AS er
JOIN students AS s
    ON er.student_id = s.student_id
JOIN subjects AS sub
    ON er.subject_id = sub.subject_id
ORDER BY s.student_name, sub.subject_name;
```

### 6. Calculate each student's average marks

``` sql
SELECT
    s.student_id,
    s.student_name,
    ROUND(AVG(er.marks_obtained), 2) AS average_marks
FROM students AS s
JOIN exam_results AS er
    ON s.student_id = er.student_id
GROUP BY s.student_id, s.student_name
ORDER BY average_marks DESC;
```

### 7. Find the top five students by average marks

``` sql
SELECT
    s.student_id,
    s.student_name,
    ROUND(AVG(er.marks_obtained), 2) AS average_marks
FROM students AS s
JOIN exam_results AS er
    ON s.student_id = er.student_id
GROUP BY s.student_id, s.student_name
ORDER BY average_marks DESC
LIMIT 5;
```

### 8. Calculate subject-wise average marks

``` sql
SELECT
    sub.subject_name,
    ROUND(AVG(er.marks_obtained), 2) AS average_marks
FROM subjects AS sub
JOIN exam_results AS er
    ON sub.subject_id = er.subject_id
GROUP BY sub.subject_id, sub.subject_name
ORDER BY average_marks DESC;
```

### 9. Assign pass/fail status (40% pass threshold)

``` sql
SELECT
    student_id,
    subject_id,
    marks_obtained,
    total_marks,
    CASE
        WHEN marks_obtained >= total_marks * 0.40 THEN 'PASS'
        ELSE 'FAIL'
    END AS result_status
FROM exam_results;
```

### 10. Rank students by average marks

``` sql
WITH student_scores AS (
    SELECT
        s.student_id,
        s.student_name,
        AVG(er.marks_obtained) AS average_marks
    FROM students AS s
    JOIN exam_results AS er
        ON s.student_id = er.student_id
    GROUP BY s.student_id, s.student_name
)
SELECT
    student_id,
    student_name,
    ROUND(average_marks, 2) AS average_marks,
    RANK() OVER (ORDER BY average_marks DESC) AS student_rank
FROM student_scores;
```

## SQL Concepts Covered

  -----------------------------------------------------------------------
  Level                               Topics
  ----------------------------------- -----------------------------------
  Beginner                            `SELECT`, `WHERE`, `DISTINCT`,
                                      `ORDER BY`, `LIMIT`, `LIKE`, `IN`,
                                      `BETWEEN`

  Intermediate                        `COUNT`, `SUM`, `AVG`, `MIN`,
                                      `MAX`, `GROUP BY`, `HAVING`

  Joins                               `INNER JOIN`, `LEFT JOIN`,
                                      multiple-table joins

  Advanced                            Subqueries, CTEs, `CASE`, window
                                      functions, `RANK`, `DENSE_RANK`,
                                      `LAG`

  Database objects                    Views, indexes, stored procedures,
                                      triggers

  Database operations                 `INSERT`, `UPDATE`, `DELETE`,
                                      `ALTER`, transactions, `COMMIT`,
                                      `ROLLBACK`
  -----------------------------------------------------------------------

## Suggested Analysis and Dashboard Ideas

After completing the SQL exercises, connect the database to Power BI and
build a School Performance Dashboard.

Suggested KPIs and visuals:

-   Total number of students
-   Total number of teachers
-   Student distribution by city
-   Student count by class and section
-   Average marks by subject
-   Top 10 students by average marks
-   Pass and fail distribution
-   Teacher salary analysis

Use the `students`, `teachers`, `classes`, `enrollments`, `subjects`,
and `exam_results` tables as data sources. Define relationships in Power
BI using their primary and foreign keys.

## Future Enhancements

Possible extensions for a later version:

-   Attendance management
-   Fee and payment tracking
-   Parent or guardian information
-   Timetable management
-   Student promotion between academic years
-   More examination terms and report cards

These features would require additional tables and are not included in
the current six-table scope.

## Learning Outcomes

By completing this project, you will practise:

-   Designing a relational database with primary and foreign keys.
-   Creating tables and inserting related records.
-   Writing basic, intermediate, and advanced SQL queries.
-   Joining multiple tables to create reports.
-   Analysing student performance using aggregate and window functions.
-   Creating reusable database objects.
-   Preparing SQL data for a Power BI dashboard.

## Author

**Your Name:** Add your name here\
**Project:** MySQL School Management System\
**Purpose:** SQL learning and Data Analyst portfolio

If you find this project useful, feel free to star the repository.

------------------------------------------------------------------------

*This is an educational sample project. The sample records and academic
data are fictional.*

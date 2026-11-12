MySQL Shell 8.0.35

Copyright (c) 2016, 2023, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \connect root@localhost:3306
Creating a session to 'root@localhost:3306'
Fetching schema names for auto-completion... Press ^C to stop.
Your MySQL connection id is 9
Server version: 8.0.35 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  JS > \sql
Switching to SQL mode... Commands end with ;
Fetching global names for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  SQL >
 MySQL  localhost:3306 ssl  SQL > CREATE DATABASE school_management;
ERROR: 1007 (HY000): Can't create database 'school_management'; database exists
 MySQL  localhost:3306 ssl  SQL >
 MySQL  localhost:3306 ssl  SQL > USE school_management;
Default schema set to `school_management`.
Fetching global names, object names from `school_management` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > SHOW DATABASES;
+------------------------------+
| Database                     |
+------------------------------+
| anudip_foundation            |
| attendance_db                |
| banking_system               |
| bookstore                    |
| employee_management_advanced |
| employeemanagement_batch     |
| expenditure_db               |
| f1                           |
| grocery_store                |
| information_schema           |
| library                      |
| library_management_advanced  |
| meditrack                    |
| movie_recommendation         |
| mysql                        |
| nitish                       |
| normalization_lab            |
| p1                           |
| performance_schema           |
| practical                    |
| practice                     |
| programming_course           |
| project                      |
| sakila                       |
| school_management            |
| shop                         |
| sql_practice_lab             |
| store_inventory_db           |
| store_management_advanced    |
| student                      |
| student_course_joins         |
| student_management_advanced  |
| sys                          |
| t1                           |
| trigger_lab                  |
| trigger_practice             |
| university                   |
| youtube_trend                |
+------------------------------+
38 rows in set (0.0025 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > drop database school_management;
Query OK, 7 rows affected (0.2101 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > CREATE DATABASE school_management;
Query OK, 1 row affected (0.0069 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > USE school_management;
Default schema set to `school_management`.
Fetching global names, object names from `school_management` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > SHOW DATABASES;
+------------------------------+
| Database                     |
+------------------------------+
| anudip_foundation            |
| attendance_db                |
| banking_system               |
| bookstore                    |
| employee_management_advanced |
| employeemanagement_batch     |
| expenditure_db               |
| f1                           |
| grocery_store                |
| information_schema           |
| library                      |
| library_management_advanced  |
| meditrack                    |
| movie_recommendation         |
| mysql                        |
| nitish                       |
| normalization_lab            |
| p1                           |
| performance_schema           |
| practical                    |
| practice                     |
| programming_course           |
| project                      |
| sakila                       |
| school_management            |
| shop                         |
| sql_practice_lab             |
| store_inventory_db           |
| store_management_advanced    |
| student                      |
| student_course_joins         |
| student_management_advanced  |
| sys                          |
| t1                           |
| trigger_lab                  |
| trigger_practice             |
| university                   |
| youtube_trend                |
+------------------------------+
38 rows in set (0.0016 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > -- 1. STUDENTS TABLE
Query OK, 0 rows affected (0.0006 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > CREATE TABLE students (
                                                  ->     student_id INT PRIMARY KEY AUTO_INCREMENT,
                                                  ->     student_name VARCHAR(100) NOT NULL,
                                                  ->     dob DATE,
                                                  ->     gender VARCHAR(10),
                                                  ->     city VARCHAR(50),
                                                  ->     email VARCHAR(100) UNIQUE,
                                                  ->     admission_date DATE
                                                  -> );
Query OK, 0 rows affected (0.0801 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > -- 2. TEACHERS TABLE
Query OK, 0 rows affected (0.0007 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > CREATE TABLE teachers (
                                                  ->     teacher_id INT PRIMARY KEY AUTO_INCREMENT,
                                                  ->     teacher_name VARCHAR(100) NOT NULL,
                                                  ->     subject_specialization VARCHAR(50),
                                                  ->     email VARCHAR(100) UNIQUE,
                                                  ->     salary DECIMAL(10,2),
                                                  ->     hire_date DATE
                                                  -> );
Query OK, 0 rows affected (0.0411 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > -- 3. CLASSES TABLE
Query OK, 0 rows affected (0.0004 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > CREATE TABLE classes (
                                                  ->     class_id INT PRIMARY KEY AUTO_INCREMENT,
                                                  ->     class_name VARCHAR(30) NOT NULL,
                                                  ->     section VARCHAR(10),
                                                  ->     teacher_id INT,
                                                  ->     room_number INT,
                                                  ->     FOREIGN KEY (teacher_id)
                                                  ->     REFERENCES teachers(teacher_id)
                                                  -> );
Query OK, 0 rows affected (0.0557 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > -- 4. SUBJECTS TABLE
Query OK, 0 rows affected (0.0004 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > CREATE TABLE subjects (
                                                  ->     subject_id INT PRIMARY KEY AUTO_INCREMENT,
                                                  ->     subject_name VARCHAR(50) NOT NULL,
                                                  ->     teacher_id INT,
                                                  ->     FOREIGN KEY (teacher_id)
                                                  ->     REFERENCES teachers(teacher_id)
                                                  -> );
Query OK, 0 rows affected (0.0377 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > -- 5. ENROLLMENTS TABLE
Query OK, 0 rows affected (0.0003 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > CREATE TABLE enrollments (
                                                  ->     enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
                                                  ->     student_id INT,
                                                  ->     class_id INT,
                                                  ->     enrollment_date DATE,
                                                  ->     academic_year VARCHAR(20),
                                                  ->     FOREIGN KEY (student_id)
                                                  ->     REFERENCES students(student_id),
                                                  ->     FOREIGN KEY (class_id)
                                                  ->     REFERENCES classes(class_id),
                                                  ->     UNIQUE(student_id, academic_year)
                                                  -> );
Query OK, 0 rows affected (0.0566 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > -- 6. EXAM_RESULTS TABLE
Query OK, 0 rows affected (0.0004 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > CREATE TABLE exam_results (
                                                  ->     result_id INT PRIMARY KEY AUTO_INCREMENT,
                                                  ->     student_id INT,
                                                  ->     subject_id INT,
                                                  ->     exam_type VARCHAR(30),
                                                  ->     exam_date DATE,
                                                  ->     marks_obtained DECIMAL(5,2),
                                                  ->     total_marks DECIMAL(5,2),
                                                  ->     FOREIGN KEY (student_id)
                                                  ->     REFERENCES students(student_id),
                                                  ->     FOREIGN KEY (subject_id)
                                                  ->     REFERENCES subjects(subject_id)
                                                  -> );
Query OK, 0 rows affected (0.0524 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > show tables;
+-----------------------------+
| Tables_in_school_management |
+-----------------------------+
| classes                     |
| enrollments                 |
| exam_results                |
| students                    |
| subjects                    |
| teachers                    |
+-----------------------------+
6 rows in set (0.0021 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > INSERT INTO students
                                                  -> (student_name, dob, gender, city, email, admission_date)
                                                  -> VALUES
                                                  -> ('Rahul Sharma','2008-05-12','Male','Kolkata','rahul@gmail.com','2023-04-10'),
                                                  -> ('Priya Singh','2009-08-20','Female','Delhi','priya@gmail.com','2023-04-11'),
                                                  -> ('Amit Kumar','2008-11-15','Male','Kolkata','amit@gmail.com','2023-04-12'),
                                                  -> ('Sneha Das','2009-02-10','Female','Howrah','sneha@gmail.com','2023-04-13'),
                                                  -> ('Rohit Verma','2008-07-25','Male','Delhi','rohit@gmail.com','2023-04-14'),
                                                  -> ('Anjali Roy','2009-09-18','Female','Kolkata','anjali@gmail.com','2023-04-15'),
                                                  -> ('Vikash Gupta','2008-12-05','Male','Patna','vikash@gmail.com','2023-04-16'),
                                                  -> ('Neha Sharma','2009-03-22','Female','Howrah','neha@gmail.com','2023-04-17'),
                                                  -> ('Karan Das','2008-06-14','Male','Kolkata','karan@gmail.com','2023-04-18'),
                                                  -> ('Pooja Kumari','2009-10-30','Female','Delhi','pooja@gmail.com','2023-04-19'),
                                                  -> ('Arjun Roy','2008-04-09','Male','Kolkata','arjun@gmail.com','2023-04-20'),
                                                  -> ('Riya Sen','2009-01-16','Female','Durgapur','riya@gmail.com','2023-04-21'),
                                                  -> ('Sourav Paul','2008-08-19','Male','Howrah','sourav@gmail.com','2023-04-22'),
                                                  -> ('Megha Dey','2009-05-27','Female','Kolkata','megha@gmail.com','2023-04-23'),
                                                  -> ('Aman Singh','2008-09-11','Male','Patna','aman@gmail.com','2023-04-24');
Query OK, 15 rows affected (0.0216 sec)

Records: 15  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > INSERT INTO teachers
                                                  -> (teacher_name, subject_specialization, email, salary, hire_date)
                                                  -> VALUES
                                                  -> ('Mr. Rajesh Sharma','Mathematics','rajesh@school.com',45000,'2018-06-10'),
                                                  -> ('Mrs. Sunita Das','Science','sunita@school.com',50000,'2017-04-15'),
                                                  -> ('Mr. Amit Roy','English','amitroy@school.com',40000,'2019-07-20'),
                                                  -> ('Mrs. Priyanka Sen','Computer','priyanka@school.com',55000,'2016-05-12'),
                                                  -> ('Mr. Suresh Kumar','History','suresh@school.com',42000,'2020-01-10');
Query OK, 5 rows affected (0.0063 sec)

Records: 5  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > INSERT INTO classes
                                                  -> (class_name, section, teacher_id, room_number)
                                                  -> VALUES
                                                  -> ('Class 8','A',1,101),
                                                  -> ('Class 9','A',2,102),
                                                  -> ('Class 10','A',3,103),
                                                  -> ('Class 11','A',4,104),
                                                  -> ('Class 12','A',5,105);
Query OK, 5 rows affected (0.0073 sec)

Records: 5  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > INSERT INTO subjects
                                                  -> (subject_name, teacher_id)
                                                  -> VALUES
                                                  -> ('Mathematics',1),
                                                  -> ('Science',2),
                                                  -> ('English',3),
                                                  -> ('Computer Science',4),
                                                  -> ('History',5),
                                                  -> ('Physics',2),
                                                  -> ('Chemistry',2),
                                                  -> ('Geography',5);
Query OK, 8 rows affected (0.0066 sec)

Records: 8  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > INSERT INTO enrollments
                                                  -> (student_id, class_id, enrollment_date, academic_year)
                                                  -> VALUES
                                                  -> (1,1,'2023-04-10','2023-2024'),
                                                  -> (2,2,'2023-04-11','2023-2024'),
                                                  -> (3,1,'2023-04-12','2023-2024'),
                                                  -> (4,2,'2023-04-13','2023-2024'),
                                                  -> (5,3,'2023-04-14','2023-2024'),
                                                  -> (6,3,'2023-04-15','2023-2024'),
                                                  -> (7,4,'2023-04-16','2023-2024'),
                                                  -> (8,2,'2023-04-17','2023-2024'),
                                                  -> (9,3,'2023-04-18','2023-2024'),
                                                  -> (10,4,'2023-04-19','2023-2024'),
                                                  -> (11,5,'2023-04-20','2023-2024'),
                                                  -> (12,5,'2023-04-21','2023-2024'),
                                                  -> (13,1,'2023-04-22','2023-2024'),
                                                  -> (14,4,'2023-04-23','2023-2024'),
                                                  -> (15,5,'2023-04-24','2023-2024');
Query OK, 15 rows affected (0.0072 sec)

Records: 15  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > INSERT INTO exam_results
                                                  -> (student_id, subject_id, exam_type, exam_date,
                                                  ->  marks_obtained, total_marks)
                                                  -> VALUES
                                                  -> (1,1,'Final','2024-02-10',85,100),
                                                  -> (1,2,'Final','2024-02-11',78,100),
                                                  -> (1,3,'Final','2024-02-12',90,100),
                                                  -> (2,1,'Final','2024-02-10',92,100),
                                                  -> (2,2,'Final','2024-02-11',88,100),
                                                  -> (2,3,'Final','2024-02-12',95,100),
                                                  -> (3,1,'Final','2024-02-10',65,100),
                                                  -> (3,2,'Final','2024-02-11',70,100),
                                                  -> (3,4,'Final','2024-02-12',80,100),
                                                  -> (4,1,'Final','2024-02-10',75,100),
                                                  -> (4,2,'Final','2024-02-11',82,100),
                                                  -> (4,3,'Final','2024-02-12',89,100),
                                                  -> (5,1,'Final','2024-02-10',55,100),
                                                  -> (5,2,'Final','2024-02-11',60,100),
                                                  -> (5,3,'Final','2024-02-12',65,100),
                                                  -> (6,1,'Final','2024-02-10',95,100),
                                                  -> (6,2,'Final','2024-02-11',93,100),
                                                  -> (6,3,'Final','2024-02-12',91,100),
                                                  -> (7,1,'Final','2024-02-10',72,100),
                                                  -> (7,4,'Final','2024-02-11',85,100),
                                                  -> (8,1,'Final','2024-02-10',68,100),
                                                  -> (8,2,'Final','2024-02-11',74,100),
                                                  -> (9,1,'Final','2024-02-10',88,100),
                                                  -> (9,3,'Final','2024-02-11',79,100),
                                                  -> (10,1,'Final','2024-02-10',81,100),
                                                  -> (10,4,'Final','2024-02-11',90,100),
                                                  -> (11,1,'Final','2024-02-10',76,100),
                                                  -> (11,2,'Final','2024-02-11',84,100),
                                                  -> (12,1,'Final','2024-02-10',89,100),
                                                  -> (12,3,'Final','2024-02-11',94,100),
                                                  -> (13,1,'Final','2024-02-10',45,100),
                                                  -> (13,2,'Final','2024-02-11',52,100),
                                                  -> (14,1,'Final','2024-02-10',91,100),
                                                  -> (14,4,'Final','2024-02-11',96,100),
                                                  -> (15,1,'Final','2024-02-10',58,100),
                                                  -> (15,2,'Final','2024-02-11',62,100);
Query OK, 36 rows affected (0.0151 sec)

Records: 36  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > SHOW TABLES;
+-----------------------------+
| Tables_in_school_management |
+-----------------------------+
| classes                     |
| enrollments                 |
| exam_results                |
| students                    |
| subjects                    |
| teachers                    |
+-----------------------------+
6 rows in set (0.0041 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students;
+------------+--------------+------------+--------+----------+------------------+----------------+
| student_id | student_name | dob        | gender | city     | email            | admission_date |
+------------+--------------+------------+--------+----------+------------------+----------------+
|          1 | Rahul Sharma | 2008-05-12 | Male   | Kolkata  | rahul@gmail.com  | 2023-04-10     |
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi    | priya@gmail.com  | 2023-04-11     |
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata  | amit@gmail.com   | 2023-04-12     |
|          4 | Sneha Das    | 2009-02-10 | Female | Howrah   | sneha@gmail.com  | 2023-04-13     |
|          5 | Rohit Verma  | 2008-07-25 | Male   | Delhi    | rohit@gmail.com  | 2023-04-14     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata  | anjali@gmail.com | 2023-04-15     |
|          7 | Vikash Gupta | 2008-12-05 | Male   | Patna    | vikash@gmail.com | 2023-04-16     |
|          8 | Neha Sharma  | 2009-03-22 | Female | Howrah   | neha@gmail.com   | 2023-04-17     |
|          9 | Karan Das    | 2008-06-14 | Male   | Kolkata  | karan@gmail.com  | 2023-04-18     |
|         10 | Pooja Kumari | 2009-10-30 | Female | Delhi    | pooja@gmail.com  | 2023-04-19     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata  | arjun@gmail.com  | 2023-04-20     |
|         12 | Riya Sen     | 2009-01-16 | Female | Durgapur | riya@gmail.com   | 2023-04-21     |
|         13 | Sourav Paul  | 2008-08-19 | Male   | Howrah   | sourav@gmail.com | 2023-04-22     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata  | megha@gmail.com  | 2023-04-23     |
|         15 | Aman Singh   | 2008-09-11 | Male   | Patna    | aman@gmail.com   | 2023-04-24     |
+------------+--------------+------------+--------+----------+------------------+----------------+
15 rows in set (0.0008 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM teachers;
+------------+-------------------+------------------------+---------------------+----------+------------+
| teacher_id | teacher_name      | subject_specialization | email               | salary   | hire_date  |
+------------+-------------------+------------------------+---------------------+----------+------------+
|          1 | Mr. Rajesh Sharma | Mathematics            | rajesh@school.com   | 45000.00 | 2018-06-10 |
|          2 | Mrs. Sunita Das   | Science                | sunita@school.com   | 50000.00 | 2017-04-15 |
|          3 | Mr. Amit Roy      | English                | amitroy@school.com  | 40000.00 | 2019-07-20 |
|          4 | Mrs. Priyanka Sen | Computer               | priyanka@school.com | 55000.00 | 2016-05-12 |
|          5 | Mr. Suresh Kumar  | History                | suresh@school.com   | 42000.00 | 2020-01-10 |
+------------+-------------------+------------------------+---------------------+----------+------------+
5 rows in set (0.0141 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM classes;
+----------+------------+---------+------------+-------------+
| class_id | class_name | section | teacher_id | room_number |
+----------+------------+---------+------------+-------------+
|        1 | Class 8    | A       |          1 |         101 |
|        2 | Class 9    | A       |          2 |         102 |
|        3 | Class 10   | A       |          3 |         103 |
|        4 | Class 11   | A       |          4 |         104 |
|        5 | Class 12   | A       |          5 |         105 |
+----------+------------+---------+------------+-------------+
5 rows in set (0.0005 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM subjects;
+------------+------------------+------------+
| subject_id | subject_name     | teacher_id |
+------------+------------------+------------+
|          1 | Mathematics      |          1 |
|          2 | Science          |          2 |
|          3 | English          |          3 |
|          4 | Computer Science |          4 |
|          5 | History          |          5 |
|          6 | Physics          |          2 |
|          7 | Chemistry        |          2 |
|          8 | Geography        |          5 |
+------------+------------------+------------+
8 rows in set (0.0005 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM enrollments;
+---------------+------------+----------+-----------------+---------------+
| enrollment_id | student_id | class_id | enrollment_date | academic_year |
+---------------+------------+----------+-----------------+---------------+
|             1 |          1 |        1 | 2023-04-10      | 2023-2024     |
|             2 |          2 |        2 | 2023-04-11      | 2023-2024     |
|             3 |          3 |        1 | 2023-04-12      | 2023-2024     |
|             4 |          4 |        2 | 2023-04-13      | 2023-2024     |
|             5 |          5 |        3 | 2023-04-14      | 2023-2024     |
|             6 |          6 |        3 | 2023-04-15      | 2023-2024     |
|             7 |          7 |        4 | 2023-04-16      | 2023-2024     |
|             8 |          8 |        2 | 2023-04-17      | 2023-2024     |
|             9 |          9 |        3 | 2023-04-18      | 2023-2024     |
|            10 |         10 |        4 | 2023-04-19      | 2023-2024     |
|            11 |         11 |        5 | 2023-04-20      | 2023-2024     |
|            12 |         12 |        5 | 2023-04-21      | 2023-2024     |
|            13 |         13 |        1 | 2023-04-22      | 2023-2024     |
|            14 |         14 |        4 | 2023-04-23      | 2023-2024     |
|            15 |         15 |        5 | 2023-04-24      | 2023-2024     |
+---------------+------------+----------+-----------------+---------------+
15 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM exam_results;
+-----------+------------+------------+-----------+------------+----------------+-------------+
| result_id | student_id | subject_id | exam_type | exam_date  | marks_obtained | total_marks |
+-----------+------------+------------+-----------+------------+----------------+-------------+
|         1 |          1 |          1 | Final     | 2024-02-10 |          85.00 |      100.00 |
|         2 |          1 |          2 | Final     | 2024-02-11 |          78.00 |      100.00 |
|         3 |          1 |          3 | Final     | 2024-02-12 |          90.00 |      100.00 |
|         4 |          2 |          1 | Final     | 2024-02-10 |          92.00 |      100.00 |
|         5 |          2 |          2 | Final     | 2024-02-11 |          88.00 |      100.00 |
|         6 |          2 |          3 | Final     | 2024-02-12 |          95.00 |      100.00 |
|         7 |          3 |          1 | Final     | 2024-02-10 |          65.00 |      100.00 |
|         8 |          3 |          2 | Final     | 2024-02-11 |          70.00 |      100.00 |
|         9 |          3 |          4 | Final     | 2024-02-12 |          80.00 |      100.00 |
|        10 |          4 |          1 | Final     | 2024-02-10 |          75.00 |      100.00 |
|        11 |          4 |          2 | Final     | 2024-02-11 |          82.00 |      100.00 |
|        12 |          4 |          3 | Final     | 2024-02-12 |          89.00 |      100.00 |
|        13 |          5 |          1 | Final     | 2024-02-10 |          55.00 |      100.00 |
|        14 |          5 |          2 | Final     | 2024-02-11 |          60.00 |      100.00 |
|        15 |          5 |          3 | Final     | 2024-02-12 |          65.00 |      100.00 |
|        16 |          6 |          1 | Final     | 2024-02-10 |          95.00 |      100.00 |
|        17 |          6 |          2 | Final     | 2024-02-11 |          93.00 |      100.00 |
|        18 |          6 |          3 | Final     | 2024-02-12 |          91.00 |      100.00 |
|        19 |          7 |          1 | Final     | 2024-02-10 |          72.00 |      100.00 |
|        20 |          7 |          4 | Final     | 2024-02-11 |          85.00 |      100.00 |
|        21 |          8 |          1 | Final     | 2024-02-10 |          68.00 |      100.00 |
|        22 |          8 |          2 | Final     | 2024-02-11 |          74.00 |      100.00 |
|        23 |          9 |          1 | Final     | 2024-02-10 |          88.00 |      100.00 |
|        24 |          9 |          3 | Final     | 2024-02-11 |          79.00 |      100.00 |
|        25 |         10 |          1 | Final     | 2024-02-10 |          81.00 |      100.00 |
|        26 |         10 |          4 | Final     | 2024-02-11 |          90.00 |      100.00 |
|        27 |         11 |          1 | Final     | 2024-02-10 |          76.00 |      100.00 |
|        28 |         11 |          2 | Final     | 2024-02-11 |          84.00 |      100.00 |
|        29 |         12 |          1 | Final     | 2024-02-10 |          89.00 |      100.00 |
|        30 |         12 |          3 | Final     | 2024-02-11 |          94.00 |      100.00 |
|        31 |         13 |          1 | Final     | 2024-02-10 |          45.00 |      100.00 |
|        32 |         13 |          2 | Final     | 2024-02-11 |          52.00 |      100.00 |
|        33 |         14 |          1 | Final     | 2024-02-10 |          91.00 |      100.00 |
|        34 |         14 |          4 | Final     | 2024-02-11 |          96.00 |      100.00 |
|        35 |         15 |          1 | Final     | 2024-02-10 |          58.00 |      100.00 |
|        36 |         15 |          2 | Final     | 2024-02-11 |          62.00 |      100.00 |
+-----------+------------+------------+-----------+------------+----------------+-------------+
36 rows in set (0.0005 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT COUNT(*) FROM students;
+----------+
| COUNT(*) |
+----------+
|       15 |
+----------+
1 row in set (0.0082 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT COUNT(*) FROM teachers;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.0018 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT COUNT(*) FROM classes;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.0018 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT COUNT(*) FROM subjects;
+----------+
| COUNT(*) |
+----------+
|        8 |
+----------+
1 row in set (0.0021 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT COUNT(*) FROM enrollments;
+----------+
| COUNT(*) |
+----------+
|       15 |
+----------+
1 row in set (0.0015 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT COUNT(*) FROM exam_results;
+----------+
| COUNT(*) |
+----------+
|       36 |
+----------+
1 row in set (0.0022 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students;
+------------+--------------+------------+--------+----------+------------------+----------------+
| student_id | student_name | dob        | gender | city     | email            | admission_date |
+------------+--------------+------------+--------+----------+------------------+----------------+
|          1 | Rahul Sharma | 2008-05-12 | Male   | Kolkata  | rahul@gmail.com  | 2023-04-10     |
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi    | priya@gmail.com  | 2023-04-11     |
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata  | amit@gmail.com   | 2023-04-12     |
|          4 | Sneha Das    | 2009-02-10 | Female | Howrah   | sneha@gmail.com  | 2023-04-13     |
|          5 | Rohit Verma  | 2008-07-25 | Male   | Delhi    | rohit@gmail.com  | 2023-04-14     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata  | anjali@gmail.com | 2023-04-15     |
|          7 | Vikash Gupta | 2008-12-05 | Male   | Patna    | vikash@gmail.com | 2023-04-16     |
|          8 | Neha Sharma  | 2009-03-22 | Female | Howrah   | neha@gmail.com   | 2023-04-17     |
|          9 | Karan Das    | 2008-06-14 | Male   | Kolkata  | karan@gmail.com  | 2023-04-18     |
|         10 | Pooja Kumari | 2009-10-30 | Female | Delhi    | pooja@gmail.com  | 2023-04-19     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata  | arjun@gmail.com  | 2023-04-20     |
|         12 | Riya Sen     | 2009-01-16 | Female | Durgapur | riya@gmail.com   | 2023-04-21     |
|         13 | Sourav Paul  | 2008-08-19 | Male   | Howrah   | sourav@gmail.com | 2023-04-22     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata  | megha@gmail.com  | 2023-04-23     |
|         15 | Aman Singh   | 2008-09-11 | Male   | Patna    | aman@gmail.com   | 2023-04-24     |
+------------+--------------+------------+--------+----------+------------------+----------------+
15 rows in set (0.0038 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT student_name, city FROM students;
+--------------+----------+
| student_name | city     |
+--------------+----------+
| Rahul Sharma | Kolkata  |
| Priya Singh  | Delhi    |
| Amit Kumar   | Kolkata  |
| Sneha Das    | Howrah   |
| Rohit Verma  | Delhi    |
| Anjali Roy   | Kolkata  |
| Vikash Gupta | Patna    |
| Neha Sharma  | Howrah   |
| Karan Das    | Kolkata  |
| Pooja Kumari | Delhi    |
| Arjun Roy    | Kolkata  |
| Riya Sen     | Durgapur |
| Sourav Paul  | Howrah   |
| Megha Dey    | Kolkata  |
| Aman Singh   | Patna    |
+--------------+----------+
15 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> WHERE city = 'Kolkata';
+------------+--------------+------------+--------+---------+------------------+----------------+
| student_id | student_name | dob        | gender | city    | email            | admission_date |
+------------+--------------+------------+--------+---------+------------------+----------------+
|          1 | Rahul Sharma | 2008-05-12 | Male   | Kolkata | rahul@gmail.com  | 2023-04-10     |
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata | amit@gmail.com   | 2023-04-12     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata | anjali@gmail.com | 2023-04-15     |
|          9 | Karan Das    | 2008-06-14 | Male   | Kolkata | karan@gmail.com  | 2023-04-18     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata | arjun@gmail.com  | 2023-04-20     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata | megha@gmail.com  | 2023-04-23     |
+------------+--------------+------------+--------+---------+------------------+----------------+
6 rows in set (0.0009 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> WHERE gender = 'Female';
+------------+--------------+------------+--------+----------+------------------+----------------+
| student_id | student_name | dob        | gender | city     | email            | admission_date |
+------------+--------------+------------+--------+----------+------------------+----------------+
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi    | priya@gmail.com  | 2023-04-11     |
|          4 | Sneha Das    | 2009-02-10 | Female | Howrah   | sneha@gmail.com  | 2023-04-13     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata  | anjali@gmail.com | 2023-04-15     |
|          8 | Neha Sharma  | 2009-03-22 | Female | Howrah   | neha@gmail.com   | 2023-04-17     |
|         10 | Pooja Kumari | 2009-10-30 | Female | Delhi    | pooja@gmail.com  | 2023-04-19     |
|         12 | Riya Sen     | 2009-01-16 | Female | Durgapur | riya@gmail.com   | 2023-04-21     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata  | megha@gmail.com  | 2023-04-23     |
+------------+--------------+------------+--------+----------+------------------+----------------+
7 rows in set (0.0011 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> WHERE student_name LIKE 'A%';
+------------+--------------+------------+--------+---------+------------------+----------------+
| student_id | student_name | dob        | gender | city    | email            | admission_date |
+------------+--------------+------------+--------+---------+------------------+----------------+
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata | amit@gmail.com   | 2023-04-12     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata | anjali@gmail.com | 2023-04-15     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata | arjun@gmail.com  | 2023-04-20     |
|         15 | Aman Singh   | 2008-09-11 | Male   | Patna   | aman@gmail.com   | 2023-04-24     |
+------------+--------------+------------+--------+---------+------------------+----------------+
4 rows in set (0.0016 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> WHERE student_name LIKE '%a%';
+------------+--------------+------------+--------+----------+------------------+----------------+
| student_id | student_name | dob        | gender | city     | email            | admission_date |
+------------+--------------+------------+--------+----------+------------------+----------------+
|          1 | Rahul Sharma | 2008-05-12 | Male   | Kolkata  | rahul@gmail.com  | 2023-04-10     |
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi    | priya@gmail.com  | 2023-04-11     |
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata  | amit@gmail.com   | 2023-04-12     |
|          4 | Sneha Das    | 2009-02-10 | Female | Howrah   | sneha@gmail.com  | 2023-04-13     |
|          5 | Rohit Verma  | 2008-07-25 | Male   | Delhi    | rohit@gmail.com  | 2023-04-14     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata  | anjali@gmail.com | 2023-04-15     |
|          7 | Vikash Gupta | 2008-12-05 | Male   | Patna    | vikash@gmail.com | 2023-04-16     |
|          8 | Neha Sharma  | 2009-03-22 | Female | Howrah   | neha@gmail.com   | 2023-04-17     |
|          9 | Karan Das    | 2008-06-14 | Male   | Kolkata  | karan@gmail.com  | 2023-04-18     |
|         10 | Pooja Kumari | 2009-10-30 | Female | Delhi    | pooja@gmail.com  | 2023-04-19     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata  | arjun@gmail.com  | 2023-04-20     |
|         12 | Riya Sen     | 2009-01-16 | Female | Durgapur | riya@gmail.com   | 2023-04-21     |
|         13 | Sourav Paul  | 2008-08-19 | Male   | Howrah   | sourav@gmail.com | 2023-04-22     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata  | megha@gmail.com  | 2023-04-23     |
|         15 | Aman Singh   | 2008-09-11 | Male   | Patna    | aman@gmail.com   | 2023-04-24     |
+------------+--------------+------------+--------+----------+------------------+----------------+
15 rows in set (0.0008 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> WHERE city IN ('Kolkata','Delhi');
+------------+--------------+------------+--------+---------+------------------+----------------+
| student_id | student_name | dob        | gender | city    | email            | admission_date |
+------------+--------------+------------+--------+---------+------------------+----------------+
|          1 | Rahul Sharma | 2008-05-12 | Male   | Kolkata | rahul@gmail.com  | 2023-04-10     |
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi   | priya@gmail.com  | 2023-04-11     |
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata | amit@gmail.com   | 2023-04-12     |
|          5 | Rohit Verma  | 2008-07-25 | Male   | Delhi   | rohit@gmail.com  | 2023-04-14     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata | anjali@gmail.com | 2023-04-15     |
|          9 | Karan Das    | 2008-06-14 | Male   | Kolkata | karan@gmail.com  | 2023-04-18     |
|         10 | Pooja Kumari | 2009-10-30 | Female | Delhi   | pooja@gmail.com  | 2023-04-19     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata | arjun@gmail.com  | 2023-04-20     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata | megha@gmail.com  | 2023-04-23     |
+------------+--------------+------------+--------+---------+------------------+----------------+
9 rows in set (0.0009 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> WHERE admission_date > '2023-04-15';
+------------+--------------+------------+--------+----------+------------------+----------------+
| student_id | student_name | dob        | gender | city     | email            | admission_date |
+------------+--------------+------------+--------+----------+------------------+----------------+
|          7 | Vikash Gupta | 2008-12-05 | Male   | Patna    | vikash@gmail.com | 2023-04-16     |
|          8 | Neha Sharma  | 2009-03-22 | Female | Howrah   | neha@gmail.com   | 2023-04-17     |
|          9 | Karan Das    | 2008-06-14 | Male   | Kolkata  | karan@gmail.com  | 2023-04-18     |
|         10 | Pooja Kumari | 2009-10-30 | Female | Delhi    | pooja@gmail.com  | 2023-04-19     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata  | arjun@gmail.com  | 2023-04-20     |
|         12 | Riya Sen     | 2009-01-16 | Female | Durgapur | riya@gmail.com   | 2023-04-21     |
|         13 | Sourav Paul  | 2008-08-19 | Male   | Howrah   | sourav@gmail.com | 2023-04-22     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata  | megha@gmail.com  | 2023-04-23     |
|         15 | Aman Singh   | 2008-09-11 | Male   | Patna    | aman@gmail.com   | 2023-04-24     |
+------------+--------------+------------+--------+----------+------------------+----------------+
9 rows in set (0.0022 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> ORDER BY student_name ASC;
+------------+--------------+------------+--------+----------+------------------+----------------+
| student_id | student_name | dob        | gender | city     | email            | admission_date |
+------------+--------------+------------+--------+----------+------------------+----------------+
|         15 | Aman Singh   | 2008-09-11 | Male   | Patna    | aman@gmail.com   | 2023-04-24     |
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata  | amit@gmail.com   | 2023-04-12     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata  | anjali@gmail.com | 2023-04-15     |
|         11 | Arjun Roy    | 2008-04-09 | Male   | Kolkata  | arjun@gmail.com  | 2023-04-20     |
|          9 | Karan Das    | 2008-06-14 | Male   | Kolkata  | karan@gmail.com  | 2023-04-18     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata  | megha@gmail.com  | 2023-04-23     |
|          8 | Neha Sharma  | 2009-03-22 | Female | Howrah   | neha@gmail.com   | 2023-04-17     |
|         10 | Pooja Kumari | 2009-10-30 | Female | Delhi    | pooja@gmail.com  | 2023-04-19     |
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi    | priya@gmail.com  | 2023-04-11     |
|          1 | Rahul Sharma | 2008-05-12 | Male   | Kolkata  | rahul@gmail.com  | 2023-04-10     |
|         12 | Riya Sen     | 2009-01-16 | Female | Durgapur | riya@gmail.com   | 2023-04-21     |
|          5 | Rohit Verma  | 2008-07-25 | Male   | Delhi    | rohit@gmail.com  | 2023-04-14     |
|          4 | Sneha Das    | 2009-02-10 | Female | Howrah   | sneha@gmail.com  | 2023-04-13     |
|         13 | Sourav Paul  | 2008-08-19 | Male   | Howrah   | sourav@gmail.com | 2023-04-22     |
|          7 | Vikash Gupta | 2008-12-05 | Male   | Patna    | vikash@gmail.com | 2023-04-16     |
+------------+--------------+------------+--------+----------+------------------+----------------+
15 rows in set (0.0009 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT * FROM students
                                                  -> LIMIT 5;
+------------+--------------+------------+--------+---------+-----------------+----------------+
| student_id | student_name | dob        | gender | city    | email           | admission_date |
+------------+--------------+------------+--------+---------+-----------------+----------------+
|          1 | Rahul Sharma | 2008-05-12 | Male   | Kolkata | rahul@gmail.com | 2023-04-10     |
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi   | priya@gmail.com | 2023-04-11     |
|          3 | Amit Kumar   | 2008-11-15 | Male   | Kolkata | amit@gmail.com  | 2023-04-12     |
|          4 | Sneha Das    | 2009-02-10 | Female | Howrah  | sneha@gmail.com | 2023-04-13     |
|          5 | Rohit Verma  | 2008-07-25 | Male   | Delhi   | rohit@gmail.com | 2023-04-14     |
+------------+--------------+------------+--------+---------+-----------------+----------------+
5 rows in set (0.0017 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT COUNT(*) AS total_students
                                                  -> FROM students;
+----------------+
| total_students |
+----------------+
|             15 |
+----------------+
1 row in set (0.0058 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT city, COUNT(*) AS total_students
                                                  -> FROM students
                                                  -> GROUP BY city;
+----------+----------------+
| city     | total_students |
+----------+----------------+
| Kolkata  |              6 |
| Delhi    |              3 |
| Howrah   |              3 |
| Patna    |              2 |
| Durgapur |              1 |
+----------+----------------+
5 rows in set (0.0058 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT AVG(salary) AS average_salary
                                                  -> FROM teachers;
+----------------+
| average_salary |
+----------------+
|   46400.000000 |
+----------------+
1 row in set (0.0023 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT MAX(salary) AS highest_salary
                                                  -> FROM teachers;
+----------------+
| highest_salary |
+----------------+
|       55000.00 |
+----------------+
1 row in set (0.0078 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT MIN(salary) AS lowest_salary
                                                  -> FROM teachers;
+---------------+
| lowest_salary |
+---------------+
|      40000.00 |
+---------------+
1 row in set (0.0017 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT SUM(salary) AS total_salary
                                                  -> FROM teachers;
+--------------+
| total_salary |
+--------------+
|    232000.00 |
+--------------+
1 row in set (0.0009 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT gender, COUNT(*) AS total
                                                  -> FROM students
                                                  -> GROUP BY gender;
+--------+-------+
| gender | total |
+--------+-------+
| Male   |     8 |
| Female |     7 |
+--------+-------+
2 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT city, COUNT(*) AS total_students
                                                  -> FROM students
                                                  -> GROUP BY city
                                                  -> HAVING COUNT(*) > 2;
+---------+----------------+
| city    | total_students |
+---------+----------------+
| Kolkata |              6 |
| Delhi   |              3 |
| Howrah  |              3 |
+---------+----------------+
3 rows in set (0.0520 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT AVG(marks_obtained) AS average_marks
                                                  -> FROM exam_results;
+---------------+
| average_marks |
+---------------+
|     78.666667 |
+---------------+
1 row in set (0.0013 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT subject_id,
                                                  ->        MAX(marks_obtained) AS highest_marks
                                                  -> FROM exam_results
                                                  -> GROUP BY subject_id;
+------------+---------------+
| subject_id | highest_marks |
+------------+---------------+
|          1 |         95.00 |
|          2 |         93.00 |
|          3 |         95.00 |
|          4 |         96.00 |
+------------+---------------+
4 rows in set (0.0024 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     c.class_name,
                                                  ->     c.section
                                                  -> FROM students s
                                                  -> INNER JOIN enrollments e
                                                  -> ON s.student_id = e.student_id
                                                  -> INNER JOIN classes c
                                                  -> ON e.class_id = c.class_id;
+--------------+------------+---------+
| student_name | class_name | section |
+--------------+------------+---------+
| Rahul Sharma | Class 8    | A       |
| Amit Kumar   | Class 8    | A       |
| Sourav Paul  | Class 8    | A       |
| Priya Singh  | Class 9    | A       |
| Sneha Das    | Class 9    | A       |
| Neha Sharma  | Class 9    | A       |
| Rohit Verma  | Class 10   | A       |
| Anjali Roy   | Class 10   | A       |
| Karan Das    | Class 10   | A       |
| Vikash Gupta | Class 11   | A       |
| Pooja Kumari | Class 11   | A       |
| Megha Dey    | Class 11   | A       |
| Arjun Roy    | Class 12   | A       |
| Riya Sen     | Class 12   | A       |
| Aman Singh   | Class 12   | A       |
+--------------+------------+---------+
15 rows in set (0.0014 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     t.teacher_name,
                                                  ->     c.class_name,
                                                  ->     c.room_number
                                                  -> FROM teachers t
                                                  -> INNER JOIN classes c
                                                  -> ON t.teacher_id = c.teacher_id;
+-------------------+------------+-------------+
| teacher_name      | class_name | room_number |
+-------------------+------------+-------------+
| Mr. Rajesh Sharma | Class 8    |         101 |
| Mrs. Sunita Das   | Class 9    |         102 |
| Mr. Amit Roy      | Class 10   |         103 |
| Mrs. Priyanka Sen | Class 11   |         104 |
| Mr. Suresh Kumar  | Class 12   |         105 |
+-------------------+------------+-------------+
5 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     sub.subject_name,
                                                  ->     t.teacher_name
                                                  -> FROM subjects sub
                                                  -> INNER JOIN teachers t
                                                  -> ON sub.teacher_id = t.teacher_id;
+------------------+-------------------+
| subject_name     | teacher_name      |
+------------------+-------------------+
| Mathematics      | Mr. Rajesh Sharma |
| Science          | Mrs. Sunita Das   |
| Physics          | Mrs. Sunita Das   |
| Chemistry        | Mrs. Sunita Das   |
| English          | Mr. Amit Roy      |
| Computer Science | Mrs. Priyanka Sen |
| History          | Mr. Suresh Kumar  |
| Geography        | Mr. Suresh Kumar  |
+------------------+-------------------+
8 rows in set (0.0008 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     sub.subject_name,
                                                  ->     er.marks_obtained
                                                  -> FROM exam_results er
                                                  -> INNER JOIN students s
                                                  -> ON er.student_id = s.student_id
                                                  -> INNER JOIN subjects sub
                                                  -> ON er.subject_id = sub.subject_id;
+--------------+------------------+----------------+
| student_name | subject_name     | marks_obtained |
+--------------+------------------+----------------+
| Rahul Sharma | Mathematics      |          85.00 |
| Priya Singh  | Mathematics      |          92.00 |
| Amit Kumar   | Mathematics      |          65.00 |
| Sneha Das    | Mathematics      |          75.00 |
| Rohit Verma  | Mathematics      |          55.00 |
| Anjali Roy   | Mathematics      |          95.00 |
| Vikash Gupta | Mathematics      |          72.00 |
| Neha Sharma  | Mathematics      |          68.00 |
| Karan Das    | Mathematics      |          88.00 |
| Pooja Kumari | Mathematics      |          81.00 |
| Arjun Roy    | Mathematics      |          76.00 |
| Riya Sen     | Mathematics      |          89.00 |
| Sourav Paul  | Mathematics      |          45.00 |
| Megha Dey    | Mathematics      |          91.00 |
| Aman Singh   | Mathematics      |          58.00 |
| Rahul Sharma | Science          |          78.00 |
| Priya Singh  | Science          |          88.00 |
| Amit Kumar   | Science          |          70.00 |
| Sneha Das    | Science          |          82.00 |
| Rohit Verma  | Science          |          60.00 |
| Anjali Roy   | Science          |          93.00 |
| Neha Sharma  | Science          |          74.00 |
| Arjun Roy    | Science          |          84.00 |
| Sourav Paul  | Science          |          52.00 |
| Aman Singh   | Science          |          62.00 |
| Rahul Sharma | English          |          90.00 |
| Priya Singh  | English          |          95.00 |
| Sneha Das    | English          |          89.00 |
| Rohit Verma  | English          |          65.00 |
| Anjali Roy   | English          |          91.00 |
| Karan Das    | English          |          79.00 |
| Riya Sen     | English          |          94.00 |
| Amit Kumar   | Computer Science |          80.00 |
| Vikash Gupta | Computer Science |          85.00 |
| Pooja Kumari | Computer Science |          90.00 |
| Megha Dey    | Computer Science |          96.00 |
+--------------+------------------+----------------+
36 rows in set (0.0014 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     s.city,
                                                  ->     sub.subject_name,
                                                  ->     er.exam_type,
                                                  ->     er.marks_obtained,
                                                  ->     er.total_marks
                                                  -> FROM students s
                                                  -> INNER JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> INNER JOIN subjects sub
                                                  -> ON er.subject_id = sub.subject_id;
+--------------+----------+------------------+-----------+----------------+-------------+
| student_name | city     | subject_name     | exam_type | marks_obtained | total_marks |
+--------------+----------+------------------+-----------+----------------+-------------+
| Rahul Sharma | Kolkata  | Mathematics      | Final     |          85.00 |      100.00 |
| Priya Singh  | Delhi    | Mathematics      | Final     |          92.00 |      100.00 |
| Amit Kumar   | Kolkata  | Mathematics      | Final     |          65.00 |      100.00 |
| Sneha Das    | Howrah   | Mathematics      | Final     |          75.00 |      100.00 |
| Rohit Verma  | Delhi    | Mathematics      | Final     |          55.00 |      100.00 |
| Anjali Roy   | Kolkata  | Mathematics      | Final     |          95.00 |      100.00 |
| Vikash Gupta | Patna    | Mathematics      | Final     |          72.00 |      100.00 |
| Neha Sharma  | Howrah   | Mathematics      | Final     |          68.00 |      100.00 |
| Karan Das    | Kolkata  | Mathematics      | Final     |          88.00 |      100.00 |
| Pooja Kumari | Delhi    | Mathematics      | Final     |          81.00 |      100.00 |
| Arjun Roy    | Kolkata  | Mathematics      | Final     |          76.00 |      100.00 |
| Riya Sen     | Durgapur | Mathematics      | Final     |          89.00 |      100.00 |
| Sourav Paul  | Howrah   | Mathematics      | Final     |          45.00 |      100.00 |
| Megha Dey    | Kolkata  | Mathematics      | Final     |          91.00 |      100.00 |
| Aman Singh   | Patna    | Mathematics      | Final     |          58.00 |      100.00 |
| Rahul Sharma | Kolkata  | Science          | Final     |          78.00 |      100.00 |
| Priya Singh  | Delhi    | Science          | Final     |          88.00 |      100.00 |
| Amit Kumar   | Kolkata  | Science          | Final     |          70.00 |      100.00 |
| Sneha Das    | Howrah   | Science          | Final     |          82.00 |      100.00 |
| Rohit Verma  | Delhi    | Science          | Final     |          60.00 |      100.00 |
| Anjali Roy   | Kolkata  | Science          | Final     |          93.00 |      100.00 |
| Neha Sharma  | Howrah   | Science          | Final     |          74.00 |      100.00 |
| Arjun Roy    | Kolkata  | Science          | Final     |          84.00 |      100.00 |
| Sourav Paul  | Howrah   | Science          | Final     |          52.00 |      100.00 |
| Aman Singh   | Patna    | Science          | Final     |          62.00 |      100.00 |
| Rahul Sharma | Kolkata  | English          | Final     |          90.00 |      100.00 |
| Priya Singh  | Delhi    | English          | Final     |          95.00 |      100.00 |
| Sneha Das    | Howrah   | English          | Final     |          89.00 |      100.00 |
| Rohit Verma  | Delhi    | English          | Final     |          65.00 |      100.00 |
| Anjali Roy   | Kolkata  | English          | Final     |          91.00 |      100.00 |
| Karan Das    | Kolkata  | English          | Final     |          79.00 |      100.00 |
| Riya Sen     | Durgapur | English          | Final     |          94.00 |      100.00 |
| Amit Kumar   | Kolkata  | Computer Science | Final     |          80.00 |      100.00 |
| Vikash Gupta | Patna    | Computer Science | Final     |          85.00 |      100.00 |
| Pooja Kumari | Delhi    | Computer Science | Final     |          90.00 |      100.00 |
| Megha Dey    | Kolkata  | Computer Science | Final     |          96.00 |      100.00 |
+--------------+----------+------------------+-----------+----------------+-------------+
36 rows in set (0.0032 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     s.city,
                                                  ->     sub.subject_name,
                                                  ->     er.exam_type,
                                                  ->     er.marks_obtained,
                                                  ->     er.total_marks
                                                  -> FROM students s
                                                  -> INNER JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> INNER JOIN subjects sub
                                                  -> ON er.subject_id = sub.subject_id;
+--------------+----------+------------------+-----------+----------------+-------------+
| student_name | city     | subject_name     | exam_type | marks_obtained | total_marks |
+--------------+----------+------------------+-----------+----------------+-------------+
| Rahul Sharma | Kolkata  | Mathematics      | Final     |          85.00 |      100.00 |
| Priya Singh  | Delhi    | Mathematics      | Final     |          92.00 |      100.00 |
| Amit Kumar   | Kolkata  | Mathematics      | Final     |          65.00 |      100.00 |
| Sneha Das    | Howrah   | Mathematics      | Final     |          75.00 |      100.00 |
| Rohit Verma  | Delhi    | Mathematics      | Final     |          55.00 |      100.00 |
| Anjali Roy   | Kolkata  | Mathematics      | Final     |          95.00 |      100.00 |
| Vikash Gupta | Patna    | Mathematics      | Final     |          72.00 |      100.00 |
| Neha Sharma  | Howrah   | Mathematics      | Final     |          68.00 |      100.00 |
| Karan Das    | Kolkata  | Mathematics      | Final     |          88.00 |      100.00 |
| Pooja Kumari | Delhi    | Mathematics      | Final     |          81.00 |      100.00 |
| Arjun Roy    | Kolkata  | Mathematics      | Final     |          76.00 |      100.00 |
| Riya Sen     | Durgapur | Mathematics      | Final     |          89.00 |      100.00 |
| Sourav Paul  | Howrah   | Mathematics      | Final     |          45.00 |      100.00 |
| Megha Dey    | Kolkata  | Mathematics      | Final     |          91.00 |      100.00 |
| Aman Singh   | Patna    | Mathematics      | Final     |          58.00 |      100.00 |
| Rahul Sharma | Kolkata  | Science          | Final     |          78.00 |      100.00 |
| Priya Singh  | Delhi    | Science          | Final     |          88.00 |      100.00 |
| Amit Kumar   | Kolkata  | Science          | Final     |          70.00 |      100.00 |
| Sneha Das    | Howrah   | Science          | Final     |          82.00 |      100.00 |
| Rohit Verma  | Delhi    | Science          | Final     |          60.00 |      100.00 |
| Anjali Roy   | Kolkata  | Science          | Final     |          93.00 |      100.00 |
| Neha Sharma  | Howrah   | Science          | Final     |          74.00 |      100.00 |
| Arjun Roy    | Kolkata  | Science          | Final     |          84.00 |      100.00 |
| Sourav Paul  | Howrah   | Science          | Final     |          52.00 |      100.00 |
| Aman Singh   | Patna    | Science          | Final     |          62.00 |      100.00 |
| Rahul Sharma | Kolkata  | English          | Final     |          90.00 |      100.00 |
| Priya Singh  | Delhi    | English          | Final     |          95.00 |      100.00 |
| Sneha Das    | Howrah   | English          | Final     |          89.00 |      100.00 |
| Rohit Verma  | Delhi    | English          | Final     |          65.00 |      100.00 |
| Anjali Roy   | Kolkata  | English          | Final     |          91.00 |      100.00 |
| Karan Das    | Kolkata  | English          | Final     |          79.00 |      100.00 |
| Riya Sen     | Durgapur | English          | Final     |          94.00 |      100.00 |
| Amit Kumar   | Kolkata  | Computer Science | Final     |          80.00 |      100.00 |
| Vikash Gupta | Patna    | Computer Science | Final     |          85.00 |      100.00 |
| Pooja Kumari | Delhi    | Computer Science | Final     |          90.00 |      100.00 |
| Megha Dey    | Kolkata  | Computer Science | Final     |          96.00 |      100.00 |
+--------------+----------+------------------+-----------+----------------+-------------+
36 rows in set (0.0058 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT s.student_id, s.student_name
                                                  -> FROM students s
                                                  -> LEFT JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> WHERE er.result_id IS NULL;
Empty set (0.0008 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     t.teacher_name,
                                                  ->     sub.subject_name
                                                  -> FROM teachers t
                                                  -> LEFT JOIN subjects sub
                                                  -> ON t.teacher_id = sub.teacher_id;
+-------------------+------------------+
| teacher_name      | subject_name     |
+-------------------+------------------+
| Mr. Rajesh Sharma | Mathematics      |
| Mrs. Sunita Das   | Science          |
| Mrs. Sunita Das   | Physics          |
| Mrs. Sunita Das   | Chemistry        |
| Mr. Amit Roy      | English          |
| Mrs. Priyanka Sen | Computer Science |
| Mr. Suresh Kumar  | History          |
| Mr. Suresh Kumar  | Geography        |
+-------------------+------------------+
8 rows in set (0.0034 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     c.class_name,
                                                  ->     t.teacher_name
                                                  -> FROM students s
                                                  -> JOIN enrollments e
                                                  -> ON s.student_id = e.student_id
                                                  -> JOIN classes c
                                                  -> ON e.class_id = c.class_id
                                                  -> JOIN teachers t
                                                  -> ON c.teacher_id = t.teacher_id;
+--------------+------------+-------------------+
| student_name | class_name | teacher_name      |
+--------------+------------+-------------------+
| Rahul Sharma | Class 8    | Mr. Rajesh Sharma |
| Amit Kumar   | Class 8    | Mr. Rajesh Sharma |
| Sourav Paul  | Class 8    | Mr. Rajesh Sharma |
| Priya Singh  | Class 9    | Mrs. Sunita Das   |
| Sneha Das    | Class 9    | Mrs. Sunita Das   |
| Neha Sharma  | Class 9    | Mrs. Sunita Das   |
| Rohit Verma  | Class 10   | Mr. Amit Roy      |
| Anjali Roy   | Class 10   | Mr. Amit Roy      |
| Karan Das    | Class 10   | Mr. Amit Roy      |
| Vikash Gupta | Class 11   | Mrs. Priyanka Sen |
| Pooja Kumari | Class 11   | Mrs. Priyanka Sen |
| Megha Dey    | Class 11   | Mrs. Priyanka Sen |
| Arjun Roy    | Class 12   | Mr. Suresh Kumar  |
| Riya Sen     | Class 12   | Mr. Suresh Kumar  |
| Aman Singh   | Class 12   | Mr. Suresh Kumar  |
+--------------+------------+-------------------+
15 rows in set (0.0021 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT student_id, student_name
                                                  -> FROM students
                                                  -> WHERE student_id IN (
                                                  ->     SELECT student_id
                                                  ->     FROM exam_results
                                                  ->     WHERE marks_obtained > (
                                                  ->         SELECT AVG(marks_obtained)
                                                  ->         FROM exam_results
                                                  ->     )
                                                  -> );
+------------+--------------+
| student_id | student_name |
+------------+--------------+
|          1 | Rahul Sharma |
|          2 | Priya Singh  |
|          3 | Amit Kumar   |
|          4 | Sneha Das    |
|          6 | Anjali Roy   |
|          7 | Vikash Gupta |
|          9 | Karan Das    |
|         10 | Pooja Kumari |
|         11 | Arjun Roy    |
|         12 | Riya Sen     |
|         14 | Megha Dey    |
+------------+--------------+
11 rows in set (0.0109 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT *
                                                  -> FROM teachers
                                                  -> WHERE salary > (
                                                  ->     SELECT AVG(salary)
                                                  ->     FROM teachers
                                                  -> );
+------------+-------------------+------------------------+---------------------+----------+------------+
| teacher_id | teacher_name      | subject_specialization | email               | salary   | hire_date  |
+------------+-------------------+------------------------+---------------------+----------+------------+
|          2 | Mrs. Sunita Das   | Science                | sunita@school.com   | 50000.00 | 2017-04-15 |
|          4 | Mrs. Priyanka Sen | Computer               | priyanka@school.com | 55000.00 | 2016-05-12 |
+------------+-------------------+------------------------+---------------------+----------+------------+
2 rows in set (0.0023 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT *
                                                  -> FROM students
                                                  -> WHERE student_id IN (
                                                  ->     SELECT student_id
                                                  ->     FROM exam_results
                                                  ->     WHERE marks_obtained > 90
                                                  -> );
+------------+--------------+------------+--------+----------+------------------+----------------+
| student_id | student_name | dob        | gender | city     | email            | admission_date |
+------------+--------------+------------+--------+----------+------------------+----------------+
|          2 | Priya Singh  | 2009-08-20 | Female | Delhi    | priya@gmail.com  | 2023-04-11     |
|          6 | Anjali Roy   | 2009-09-18 | Female | Kolkata  | anjali@gmail.com | 2023-04-15     |
|         12 | Riya Sen     | 2009-01-16 | Female | Durgapur | riya@gmail.com   | 2023-04-21     |
|         14 | Megha Dey    | 2009-05-27 | Female | Kolkata  | megha@gmail.com  | 2023-04-23     |
+------------+--------------+------------+--------+----------+------------------+----------------+
4 rows in set (0.0028 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     er.marks_obtained
                                                  -> FROM students s
                                                  -> JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> WHERE er.marks_obtained = (
                                                  ->     SELECT MAX(marks_obtained)
                                                  ->     FROM exam_results
                                                  -> );
+--------------+----------------+
| student_name | marks_obtained |
+--------------+----------------+
| Megha Dey    |          96.00 |
+--------------+----------------+
1 row in set (0.0014 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT s.student_name, er.marks_obtained
                                                  -> FROM students s
                                                  -> JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> JOIN subjects sub
                                                  -> ON er.subject_id = sub.subject_id
                                                  -> WHERE sub.subject_name = 'Mathematics'
                                                  -> AND er.marks_obtained > 80;
+--------------+----------------+
| student_name | marks_obtained |
+--------------+----------------+
| Rahul Sharma |          85.00 |
| Priya Singh  |          92.00 |
| Anjali Roy   |          95.00 |
| Karan Das    |          88.00 |
| Pooja Kumari |          81.00 |
| Riya Sen     |          89.00 |
| Megha Dey    |          91.00 |
+--------------+----------------+
7 rows in set (0.0011 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     student_id,
                                                  ->     marks_obtained,
                                                  ->     CASE
                                                  ->         WHEN marks_obtained >= 40 THEN 'PASS'
                                                  ->         ELSE 'FAIL'
                                                  ->     END AS result_status
                                                  -> FROM exam_results;
+------------+----------------+---------------+
| student_id | marks_obtained | result_status |
+------------+----------------+---------------+
|          1 |          85.00 | PASS          |
|          1 |          78.00 | PASS          |
|          1 |          90.00 | PASS          |
|          2 |          92.00 | PASS          |
|          2 |          88.00 | PASS          |
|          2 |          95.00 | PASS          |
|          3 |          65.00 | PASS          |
|          3 |          70.00 | PASS          |
|          3 |          80.00 | PASS          |
|          4 |          75.00 | PASS          |
|          4 |          82.00 | PASS          |
|          4 |          89.00 | PASS          |
|          5 |          55.00 | PASS          |
|          5 |          60.00 | PASS          |
|          5 |          65.00 | PASS          |
|          6 |          95.00 | PASS          |
|          6 |          93.00 | PASS          |
|          6 |          91.00 | PASS          |
|          7 |          72.00 | PASS          |
|          7 |          85.00 | PASS          |
|          8 |          68.00 | PASS          |
|          8 |          74.00 | PASS          |
|          9 |          88.00 | PASS          |
|          9 |          79.00 | PASS          |
|         10 |          81.00 | PASS          |
|         10 |          90.00 | PASS          |
|         11 |          76.00 | PASS          |
|         11 |          84.00 | PASS          |
|         12 |          89.00 | PASS          |
|         12 |          94.00 | PASS          |
|         13 |          45.00 | PASS          |
|         13 |          52.00 | PASS          |
|         14 |          91.00 | PASS          |
|         14 |          96.00 | PASS          |
|         15 |          58.00 | PASS          |
|         15 |          62.00 | PASS          |
+------------+----------------+---------------+
36 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     student_id,
                                                  ->     subject_id,
                                                  ->     ROUND(marks_obtained / total_marks * 100, 2) AS percentage,
                                                  ->     CASE
                                                  ->         WHEN marks_obtained / total_marks * 100 >= 90 THEN 'A+'
                                                  ->         WHEN marks_obtained / total_marks * 100 >= 80 THEN 'A'
                                                  ->         WHEN marks_obtained / total_marks * 100 >= 70 THEN 'B'
                                                  ->         WHEN marks_obtained / total_marks * 100 >= 60 THEN 'C'
                                                  ->         WHEN marks_obtained / total_marks * 100 >= 40 THEN 'D'
                                                  ->         ELSE 'F'
                                                  ->     END AS grade
                                                  -> FROM exam_results;
+------------+------------+------------+-------+
| student_id | subject_id | percentage | grade |
+------------+------------+------------+-------+
|          1 |          1 |      85.00 | A     |
|          1 |          2 |      78.00 | B     |
|          1 |          3 |      90.00 | A+    |
|          2 |          1 |      92.00 | A+    |
|          2 |          2 |      88.00 | A     |
|          2 |          3 |      95.00 | A+    |
|          3 |          1 |      65.00 | C     |
|          3 |          2 |      70.00 | B     |
|          3 |          4 |      80.00 | A     |
|          4 |          1 |      75.00 | B     |
|          4 |          2 |      82.00 | A     |
|          4 |          3 |      89.00 | A     |
|          5 |          1 |      55.00 | D     |
|          5 |          2 |      60.00 | C     |
|          5 |          3 |      65.00 | C     |
|          6 |          1 |      95.00 | A+    |
|          6 |          2 |      93.00 | A+    |
|          6 |          3 |      91.00 | A+    |
|          7 |          1 |      72.00 | B     |
|          7 |          4 |      85.00 | A     |
|          8 |          1 |      68.00 | C     |
|          8 |          2 |      74.00 | B     |
|          9 |          1 |      88.00 | A     |
|          9 |          3 |      79.00 | B     |
|         10 |          1 |      81.00 | A     |
|         10 |          4 |      90.00 | A+    |
|         11 |          1 |      76.00 | B     |
|         11 |          2 |      84.00 | A     |
|         12 |          1 |      89.00 | A     |
|         12 |          3 |      94.00 | A+    |
|         13 |          1 |      45.00 | D     |
|         13 |          2 |      52.00 | D     |
|         14 |          1 |      91.00 | A+    |
|         14 |          4 |      96.00 | A+    |
|         15 |          1 |      58.00 | D     |
|         15 |          2 |      62.00 | C     |
+------------+------------+------------+-------+
36 rows in set (0.0048 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     ROUND(AVG(er.marks_obtained), 2) AS average_marks
                                                  -> FROM students s
                                                  -> JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> GROUP BY s.student_id, s.student_name
                                                  -> HAVING AVG(er.marks_obtained) >= 75;
+--------------+---------------+
| student_name | average_marks |
+--------------+---------------+
| Rahul Sharma |         84.33 |
| Priya Singh  |         91.67 |
| Sneha Das    |         82.00 |
| Anjali Roy   |         93.00 |
| Vikash Gupta |         78.50 |
| Karan Das    |         83.50 |
| Pooja Kumari |         85.50 |
| Arjun Roy    |         80.00 |
| Riya Sen     |         91.50 |
| Megha Dey    |         93.50 |
+--------------+---------------+
10 rows in set (0.0048 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     ROUND(AVG(er.marks_obtained), 2) AS average_marks
                                                  -> FROM students s
                                                  -> JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> GROUP BY s.student_id, s.student_name
                                                  -> ORDER BY average_marks DESC
                                                  -> LIMIT 5;
+--------------+---------------+
| student_name | average_marks |
+--------------+---------------+
| Megha Dey    |         93.50 |
| Anjali Roy   |         93.00 |
| Priya Singh  |         91.67 |
| Riya Sen     |         91.50 |
| Pooja Kumari |         85.50 |
+--------------+---------------+
5 rows in set (0.0026 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT MAX(marks_obtained) AS second_highest
                                                  -> FROM exam_results
                                                  -> WHERE marks_obtained < (
                                                  ->     SELECT MAX(marks_obtained)
                                                  ->     FROM exam_results
                                                  -> );
+----------------+
| second_highest |
+----------------+
|          95.00 |
+----------------+
1 row in set (0.0029 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     COUNT(er.result_id) AS total_exams
                                                  -> FROM students s
                                                  -> JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> GROUP BY s.student_id, s.student_name
                                                  -> HAVING COUNT(er.result_id) > 2;
+--------------+-------------+
| student_name | total_exams |
+--------------+-------------+
| Rahul Sharma |           3 |
| Priya Singh  |           3 |
| Amit Kumar   |           3 |
| Sneha Das    |           3 |
| Rohit Verma  |           3 |
| Anjali Roy   |           3 |
+--------------+-------------+
6 rows in set (0.0031 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     s.student_name,
                                                  ->     SUM(er.marks_obtained) AS total_marks
                                                  -> FROM students s
                                                  -> JOIN exam_results er
                                                  -> ON s.student_id = er.student_id
                                                  -> GROUP BY s.student_id, s.student_name
                                                  -> ORDER BY total_marks DESC;
+--------------+-------------+
| student_name | total_marks |
+--------------+-------------+
| Anjali Roy   |      279.00 |
| Priya Singh  |      275.00 |
| Rahul Sharma |      253.00 |
| Sneha Das    |      246.00 |
| Amit Kumar   |      215.00 |
| Megha Dey    |      187.00 |
| Riya Sen     |      183.00 |
| Rohit Verma  |      180.00 |
| Pooja Kumari |      171.00 |
| Karan Das    |      167.00 |
| Arjun Roy    |      160.00 |
| Vikash Gupta |      157.00 |
| Neha Sharma  |      142.00 |
| Aman Singh   |      120.00 |
| Sourav Paul  |       97.00 |
+--------------+-------------+
15 rows in set (0.0017 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     sub.subject_name,
                                                  ->     ROUND(AVG(er.marks_obtained), 2) AS average_marks
                                                  -> FROM subjects sub
                                                  -> JOIN exam_results er
                                                  -> ON sub.subject_id = er.subject_id
                                                  -> GROUP BY sub.subject_id, sub.subject_name
                                                  -> ORDER BY average_marks DESC;
+------------------+---------------+
| subject_name     | average_marks |
+------------------+---------------+
| Computer Science |         87.75 |
| English          |         86.14 |
| Mathematics      |         75.67 |
| Science          |         74.30 |
+------------------+---------------+
4 rows in set (0.0031 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     sub.subject_name,
                                                  ->     s.student_name,
                                                  ->     er.marks_obtained
                                                  -> FROM exam_results er
                                                  -> JOIN students s
                                                  -> ON er.student_id = s.student_id
                                                  -> JOIN subjects sub
                                                  -> ON er.subject_id = sub.subject_id
                                                  -> WHERE er.marks_obtained = (
                                                  ->     SELECT MAX(er2.marks_obtained)
                                                  ->     FROM exam_results er2
                                                  ->     WHERE er2.subject_id = er.subject_id
                                                  -> );
+------------------+--------------+----------------+
| subject_name     | student_name | marks_obtained |
+------------------+--------------+----------------+
| English          | Priya Singh  |          95.00 |
| Mathematics      | Anjali Roy   |          95.00 |
| Science          | Anjali Roy   |          93.00 |
| Computer Science | Megha Dey    |          96.00 |
+------------------+--------------+----------------+
4 rows in set (0.0023 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > WITH student_average AS (
                                                  ->     SELECT
                                                  ->         s.student_id,
                                                  ->         s.student_name,
                                                  ->         e.class_id,
                                                  ->         AVG(er.marks_obtained) AS avg_marks
                                                  ->     FROM students s
                                                  ->     JOIN enrollments e
                                                  ->     ON s.student_id = e.student_id
                                                  ->     JOIN exam_results er
                                                  ->     ON s.student_id = er.student_id
                                                  ->     GROUP BY s.student_id, s.student_name, e.class_id
                                                  -> ),
                                                  -> class_average AS (
                                                  ->     SELECT
                                                  ->         class_id,
                                                  ->         AVG(avg_marks) AS class_avg
                                                  ->     FROM student_average
                                                  ->     GROUP BY class_id
                                                  -> )
                                                  -> SELECT
                                                  ->     sa.student_name,
                                                  ->     ROUND(sa.avg_marks, 2) AS student_average,
                                                  ->     ROUND(ca.class_avg, 2) AS class_average
                                                  -> FROM student_average sa
                                                  -> JOIN class_average ca
                                                  -> ON sa.class_id = ca.class_id
                                                  -> WHERE sa.avg_marks > ca.class_avg;
+--------------+-----------------+---------------+
| student_name | student_average | class_average |
+--------------+-----------------+---------------+
| Amit Kumar   |           71.67 |         68.17 |
| Rahul Sharma |           84.33 |         68.17 |
| Sneha Das    |           82.00 |         81.56 |
| Priya Singh  |           91.67 |         81.56 |
| Karan Das    |           83.50 |         78.83 |
| Anjali Roy   |           93.00 |         78.83 |
| Megha Dey    |           93.50 |         85.83 |
| Arjun Roy    |           80.00 |         77.17 |
| Riya Sen     |           91.50 |         77.17 |
+--------------+-----------------+---------------+
9 rows in set (0.0083 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > WITH student_scores AS (
                                                  ->     SELECT
                                                  ->         s.student_id,
                                                  ->         s.student_name,
                                                  ->         AVG(er.marks_obtained) AS average_marks
                                                  ->     FROM students s
                                                  ->     JOIN exam_results er
                                                  ->     ON s.student_id = er.student_id
                                                  ->     GROUP BY s.student_id, s.student_name
                                                  -> )
                                                  -> SELECT
                                                  ->     student_name,
                                                  ->     ROUND(average_marks, 2) AS average_marks,
                                                  ->     RANK() OVER (
                                                  ->         ORDER BY average_marks DESC
                                                  ->     ) AS student_rank
                                                  -> FROM student_scores;
+--------------+---------------+--------------+
| student_name | average_marks | student_rank |
+--------------+---------------+--------------+
| Megha Dey    |         93.50 |            1 |
| Anjali Roy   |         93.00 |            2 |
| Priya Singh  |         91.67 |            3 |
| Riya Sen     |         91.50 |            4 |
| Pooja Kumari |         85.50 |            5 |
| Rahul Sharma |         84.33 |            6 |
| Karan Das    |         83.50 |            7 |
| Sneha Das    |         82.00 |            8 |
| Arjun Roy    |         80.00 |            9 |
| Vikash Gupta |         78.50 |           10 |
| Amit Kumar   |         71.67 |           11 |
| Neha Sharma  |         71.00 |           12 |
| Rohit Verma  |         60.00 |           13 |
| Aman Singh   |         60.00 |           13 |
| Sourav Paul  |         48.50 |           15 |
+--------------+---------------+--------------+
15 rows in set (0.0045 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > WITH student_scores AS (
                                                  ->     SELECT
                                                  ->         s.student_name,
                                                  ->         e.class_id,
                                                  ->         AVG(er.marks_obtained) AS average_marks
                                                  ->     FROM students s
                                                  ->     JOIN enrollments e
                                                  ->     ON s.student_id = e.student_id
                                                  ->     JOIN exam_results er
                                                  ->     ON s.student_id = er.student_id
                                                  ->     GROUP BY s.student_id, s.student_name, e.class_id
                                                  -> ),
                                                  -> ranked_students AS (
                                                  ->     SELECT *,
                                                  ->         DENSE_RANK() OVER (
                                                  ->             PARTITION BY class_id
                                                  ->             ORDER BY average_marks DESC
                                                  ->         ) AS class_rank
                                                  ->     FROM student_scores
                                                  -> )
                                                  -> SELECT *
                                                  -> FROM ranked_students
                                                  -> WHERE class_rank = 1;
+--------------+----------+---------------+------------+
| student_name | class_id | average_marks | class_rank |
+--------------+----------+---------------+------------+
| Rahul Sharma |        1 |     84.333333 |          1 |
| Priya Singh  |        2 |     91.666667 |          1 |
| Anjali Roy   |        3 |     93.000000 |          1 |
| Megha Dey    |        4 |     93.500000 |          1 |
| Riya Sen     |        5 |     91.500000 |          1 |
+--------------+----------+---------------+------------+
5 rows in set (0.0025 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     student_id,
                                                  ->     subject_id,
                                                  ->     marks_obtained,
                                                  ->     SUM(marks_obtained) OVER (
                                                  ->         PARTITION BY student_id
                                                  ->         ORDER BY exam_date, result_id
                                                  ->     ) AS running_total
                                                  -> FROM exam_results;
+------------+------------+----------------+---------------+
| student_id | subject_id | marks_obtained | running_total |
+------------+------------+----------------+---------------+
|          1 |          1 |          85.00 |         85.00 |
|          1 |          2 |          78.00 |        163.00 |
|          1 |          3 |          90.00 |        253.00 |
|          2 |          1 |          92.00 |         92.00 |
|          2 |          2 |          88.00 |        180.00 |
|          2 |          3 |          95.00 |        275.00 |
|          3 |          1 |          65.00 |         65.00 |
|          3 |          2 |          70.00 |        135.00 |
|          3 |          4 |          80.00 |        215.00 |
|          4 |          1 |          75.00 |         75.00 |
|          4 |          2 |          82.00 |        157.00 |
|          4 |          3 |          89.00 |        246.00 |
|          5 |          1 |          55.00 |         55.00 |
|          5 |          2 |          60.00 |        115.00 |
|          5 |          3 |          65.00 |        180.00 |
|          6 |          1 |          95.00 |         95.00 |
|          6 |          2 |          93.00 |        188.00 |
|          6 |          3 |          91.00 |        279.00 |
|          7 |          1 |          72.00 |         72.00 |
|          7 |          4 |          85.00 |        157.00 |
|          8 |          1 |          68.00 |         68.00 |
|          8 |          2 |          74.00 |        142.00 |
|          9 |          1 |          88.00 |         88.00 |
|          9 |          3 |          79.00 |        167.00 |
|         10 |          1 |          81.00 |         81.00 |
|         10 |          4 |          90.00 |        171.00 |
|         11 |          1 |          76.00 |         76.00 |
|         11 |          2 |          84.00 |        160.00 |
|         12 |          1 |          89.00 |         89.00 |
|         12 |          3 |          94.00 |        183.00 |
|         13 |          1 |          45.00 |         45.00 |
|         13 |          2 |          52.00 |         97.00 |
|         14 |          1 |          91.00 |         91.00 |
|         14 |          4 |          96.00 |        187.00 |
|         15 |          1 |          58.00 |         58.00 |
|         15 |          2 |          62.00 |        120.00 |
+------------+------------+----------------+---------------+
36 rows in set (0.0031 sec)
 MySQL  localhost:3306 ssl  school_management  SQL > SELECT
                                                  ->     student_id,
                                                  ->     subject_id,
                                                  ->     marks_obtained,
                                                  ->     LAG(marks_obtained) OVER (
                                                  ->         PARTITION BY student_id
                                                  ->         ORDER BY exam_date, result_id
                                                  ->     ) AS previous_marks
                                                  -> FROM exam_results;
+------------+------------+----------------+----------------+
| student_id | subject_id | marks_obtained | previous_marks |
+------------+------------+----------------+----------------+
|          1 |          1 |          85.00 |           NULL |
|          1 |          2 |          78.00 |          85.00 |
|          1 |          3 |          90.00 |          78.00 |
|          2 |          1 |          92.00 |           NULL |
|          2 |          2 |          88.00 |          92.00 |
|          2 |          3 |          95.00 |          88.00 |
|          3 |          1 |          65.00 |           NULL |
|          3 |          2 |          70.00 |          65.00 |
|          3 |          4 |          80.00 |          70.00 |
|          4 |          1 |          75.00 |           NULL |
|          4 |          2 |          82.00 |          75.00 |
|          4 |          3 |          89.00 |          82.00 |
|          5 |          1 |          55.00 |           NULL |
|          5 |          2 |          60.00 |          55.00 |
|          5 |          3 |          65.00 |          60.00 |
|          6 |          1 |          95.00 |           NULL |
|          6 |          2 |          93.00 |          95.00 |
|          6 |          3 |          91.00 |          93.00 |
|          7 |          1 |          72.00 |           NULL |
|          7 |          4 |          85.00 |          72.00 |
|          8 |          1 |          68.00 |           NULL |
|          8 |          2 |          74.00 |          68.00 |
|          9 |          1 |          88.00 |           NULL |
|          9 |          3 |          79.00 |          88.00 |
|         10 |          1 |          81.00 |           NULL |
|         10 |          4 |          90.00 |          81.00 |
|         11 |          1 |          76.00 |           NULL |
|         11 |          2 |          84.00 |          76.00 |
|         12 |          1 |          89.00 |           NULL |
|         12 |          3 |          94.00 |          89.00 |
|         13 |          1 |          45.00 |           NULL |
|         13 |          2 |          52.00 |          45.00 |
|         14 |          1 |          91.00 |           NULL |
|         14 |          4 |          96.00 |          91.00 |
|         15 |          1 |          58.00 |           NULL |
|         15 |          2 |          62.00 |          58.00 |
+------------+------------+----------------+----------------+
36 rows in set (0.0011 sec)
 MySQL  localhost:3306 ssl  school_management  SQL >

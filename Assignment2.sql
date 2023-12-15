-- Students table
CREATE TABLE Students (
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
date_of_birth DATE,
email VARCHAR(100),
phone_number VARCHAR(15)
);
 

-- Teacher table
CREATE TABLE Teacher (
teacher_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100)
);

-- Courses table
CREATE TABLE Courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
credits INT,
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- Enrollments table
CREATE TABLE Enrollments (
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


-- Payments table
CREATE TABLE Payments (
payment_id INT PRIMARY KEY,
student_id INT,
amount DECIMAL(10, 2),
payment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students VALUES
(1, 'John', 'Doe', '1990-01-15', 'john.doe@email.com', '123-456-7890'),
(2, 'Alice', 'Johnson', '1992-05-20', 'alice.j@email.com', '987-654-3210'),
(3, 'Bob', 'Smith', '1991-08-12', 'bob.smith@email.com', '555-123-4567'),
(4, 'Eva', 'Davis', '1993-03-25', 'eva.d@email.com', '789-456-1230'),
(5, 'Chris', 'Miller', '1995-11-02', 'chris.m@email.com', '111-222-3333'),
(6, 'Sophia', 'Clark', '1994-07-18', 'sophia.c@email.com', '444-555-6666'),
(7, 'David', 'Moore', '1992-09-08', 'david.m@email.com', '777-888-9999'),
(8, 'Emma', 'Taylor', '1996-04-30', 'emma.t@email.com', '222-333-4444'),
(9, 'Alex', 'Johnson', '1993-12-10', 'alex.j@email.com', '666-777-8888'),
(10, 'Grace', 'Walker', '1995-06-15', 'grace.w@email.com', '999-000-1111');

INSERT INTO Teacher VALUES
(1, 'Jane', 'Smith', 'jane.smith@email.com'),
(2, 'Michael', 'Anderson', 'michael.anderson@email.com'),
(3, 'Emily', 'Williams', 'emily.w@email.com'),
(4, 'Brian', 'Johnson', 'brian.j@email.com'),
(5, 'Olivia', 'Clark', 'olivia.c@email.com'),
(6, 'James', 'Moore', 'james.m@email.com'),
(7, 'Sophie', 'Taylor', 'sophie.t@email.com'),
(8, 'Daniel', 'Walker', 'daniel.w@email.com'),
(9, 'Ella', 'Miller', 'ella.m@email.com'),
(10, 'Matthew', 'Davis', 'matthew.d@email.com');

INSERT INTO Courses VALUES
(1, 'Introduction to SQL', 3, 1),
(2, 'Data Structures', 4, 2),
(3, 'Web Development', 3, 3),
(4, 'Linear Algebra', 4, 2),
(5, 'Computer Networks', 3, 1),
(6, 'Software Engineering', 4, 3),
(7, 'Artificial Intelligence', 3, 1),
(8, 'Database Management Systems', 4, 2),
(9, 'Mobile App Development', 3, 3),
(10, 'Operating Systems', 4, 1);

INSERT INTO Enrollments VALUES
(1, 1, 1, '2023-01-01'),
(2, 2, 2, '2023-02-01'),
(3, 3, 3, '2023-02-15'),
(4, 4, 4, '2023-03-01'),
(5, 5, 5, '2023-03-15'),
(6, 6, 6, '2023-04-01'),
(7, 7, 7, '2023-04-15'),
(8, 8, 8, '2023-05-01'),
(9, 9, 9, '2023-05-15'),
(10, 10, 10, '2023-06-01');

INSERT INTO Payments VALUES
(1, 1, 50.00, '2023-01-15'),
(2, 2, 75.00, '2023-02-10'),
(3, 3, 100.00, '2023-02-20'),
(4, 4, 80.00, '2023-03-05'),
(5, 5, 60.00, '2023-03-20'),
(6, 6, 90.00, '2023-04-05'),
(7, 7, 120.00, '2023-04-20'),
(8, 8, 110.00, '2023-05-05'),
(9, 9, 95.00, '2023-05-20'),
(10, 10, 130.00, '2023-06-05');

--1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
Insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (11, 10, 105, '2023-11-28');
Select * from Enrollments;   

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.

UPDATE Teacher
SET email = 'new.email@example.com'
WHERE teacher_id = 2;

---4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
an enrollment record based on student and course

DELETE FROM Enrollments
WHERE student_id = 2 
 AND course_id = 3;

 ---5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
teacher from the respective tables.


 UPDATE Courses
SET teacher_id = 2 
WHERE course_id = 1;

---6. Delete a specific student from the "Students" table and remove all their enrollment records 
from the "Enrollments" table. Be sure to maintain referential integrity

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)VALUES (11, 11, 105, '2023-11-28');

DELETE FROM Enrollments WHERE student_id = 11;
    
DELETE FROM Students WHERE student_id = 11;


---7. Update the payment amount for a specific payment record in the "Payments" table. Choose any 
payment record and modify the payment amount.

UPDATE Payments
SET amount = 120.00
WHERE payment_id = 3;

------------joins

---1. Write an SQL query to calculate the total payments made by a specific student. You will need to 
join the "Payments" table with the "Students" table based on the students ID.

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 2 
GROUP BY s.student_id, s.first_name, s.last_name;

---2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.SELECT c.course_id, c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;---3. Write an SQL query to find the names of students who have not enrolled in any course. Use a 
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
without enrollments.SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;---4. Write an SQL query to retrieve the first name, last name of students, and the names of the 
courses they are enrolled in. Use JOIN operations between the "Students" table and the 
"Enrollments" and "Courses" tables.SELECT s.first_name,s.last_name,c.course_name
FROM Students s
JOIN
Enrollments e ON s.student_id = e.student_id
JOIN
Courses c ON e.course_id = c.course_id;---5. Create a query to list the names of teachers and the courses they are assigned to. Join the 
"Teacher" table with the "Courses" tableSELECT t.first_name AS teacher_first_name,t.last_name AS teacher_last_name,c.course_name
FROM Teacher t
JOIN
Courses c ON t.teacher_id = c.teacher_id;
---6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
"Students" table with the "Enrollments" and "Courses" tables.

SELECT s.first_name,s.last_name,e.enrollment_date
FROM Students s
JOIN
Enrollments e ON s.student_id = e.student_id
JOIN
Courses c ON e.course_id = c.course_id
WHERE
c.course_id = 1;




---7. Find the names of students who have not made any payments. Use a LEFT JOIN between the 
"Students" table and the "Payments" table and filter for students with NULL payment records.
SELECT s.first_name,s.last_name
FROM Students s
LEFT JOIN
Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;



---8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
enrollment records.

SELECT c.course_id,c.course_name
FROM Courses c
LEFT JOIN
Enrollments e ON c.course_id = e.course_id
WHERE
e.course_id IS NULL;

---ooooo9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
table to find students with multiple enrollment records.



SELECT DISTINCT e1.student_id,s.first_name
FROM Enrollments e1
JOIN 
Enrollments e2 ON e1.student_id = e2.student_id AND e1.enrollment_id <> e2.enrollment_id
JOIN
Students s ON e1.student_id = s.student_id;


---10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
table and the "Courses" table and filter for teachers with NULL course assignments.
SELECT t.teacher_id,t.first_name,t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.teacher_id IS NULL;


-------------- Aggregate Functions and Subqueries:

---1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
aggregate functions and subqueries to achieve this.

SELECT course_id,course_name,AVG(student_count) AS average_students_enrolled
FROM (SELECT c.course_id,c.course_name,COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN
Enrollments e ON c.course_id = e.course_id GROUP BY c.course_id, c.course_name) AS CourseStudentCount
GROUP BY course_id, course_name;



---2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
payment amount and then retrieve the student(s) associated with that amount.



SELECT *
FROM Students
WHERE student_id IN (SELECT student_id FROM Payments WHERE amount = (SELECT MAX(amount) FROM Payments)
);


---3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
course(s) with the maximum enrollment count.

SELECT course_id, course_name
FROM courses
WHERE course_id IN (SELECT course_id FROM enrollments GROUP BY course_id
HAVING COUNT(student_id) = (SELECT MAX(enrollment_count)
FROM (SELECT course_id, COUNT(student_id) as enrollment_count FROM enrollments GROUP BY course_id) AS enrollment_counts)
);

//////////////////////// with joins and subquery
SELECT c.course_id,c.course_name,COUNT(e.student_id) AS enrollment_count
FROM Courses c
left JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING
COUNT(e.student_id) = (SELECT MAX(enrollment_count) FROM (SELECT course_id, COUNT(student_id) AS enrollment_count 
FROM Enrollments GROUP BY course_id) as subquery );

---4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
payments for each teachers courses.

SELECT teacher.teacher_id, teacher.first_name, SUM(payments.amount) AS total_payments
FROM teacher
JOIN courses ON teacher.teacher_id = courses.teacher_id
JOIN enrollments ON courses.course_id = enrollments.course_id
JOIN payments ON enrollments.student_id = payments.student_id
GROUP BY teacher.teacher_id, teacher.first_name;

---5. Identify students who are enrolled in all available courses. Use subqueries to compare a 
students enrollments with the total number of courses.

SELECT student_id, first_name
FROM students
WHERE NOT exists (SELECT course_id FROM courses WHERE course_id NOT IN (SELECT course_id FROM enrollments
WHERE enrollments.student_id = students.student_id)
);

---6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
find teachers with no course assignments.



SELECT teacher_id, first_name
FROM teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM courses );


---7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
based on their date of birth.

SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students;


---8. Identify courses with no enrollments. Use subqueries to find courses without enrollment 
records.

SELECT course_id, course_name
FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollments);



---9. Calculate the total payments made by each student for each course they are enrolled in. Use 
subqueries and aggregate functions to sum payments.

SELECT s.student_id,s.first_name,e.course_id,
(SELECT SUM(p.amount) FROM Payments p  WHERE p.student_id = s.student_id) AS total_payments
FROM Students s
JOIN
Enrollments e ON s.student_id = e.student_id;


---10. Identify students who have made more than one payment. Use subqueries and aggregate 
functions to count payments per student and filter for those with counts greater than one

SELECT student_id, first_name
FROM students
WHERE student_id IN (SELECT student_id FROM payments GROUP BY student_id HAVING COUNT(payment_id) > 1
);


---11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
student.

SELECT students.student_id,students.first_name,SUM(payments.amount) AS total_payments
FROM students
LEFT JOIN payments ON students.student_id = payments.student_id
GROUP BY students.student_id, students.first_name;



---12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
count enrollments.


SELECT courses.course_id,courses.course_name,COUNT(enrollments.student_id) AS student_count
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;


---13. Calculate the average payment amount made by students. Use JOIN operations between the 
"Students" table and the "Payments" table and GROUP BY to calculate the average


SELECT students.student_id,students.first_name,AVG(payments.amount) AS average_payment
FROM students
LEFT JOIN payments ON students.student_id = payments.student_id
GROUP BY students.student_id, students.first_name;











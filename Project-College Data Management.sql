CSCI 340 01W Final Project
College Data Management
Ashish Acharya
Due Date: 5/8/2024 Wed. by 11:59pm
CIS


Step 6: SQL Statements to Create Database and Tables

CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Date_of_Birth DATE
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Department VARCHAR(50)
);

CREATE TABLE Professor (
    Professor_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50)
);

CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);



Step 7: SQL Statements for Data Insertion

-- Inserting data into Student Table
USE CollegeDB;
INSERT INTO Student (Student_ID, Name, Date_of_Birth)
VALUES
    (2000, 'John Smith', '2000-05-15'),
    (2001, 'Emily Johnson', '2001-09-20'),
    (2002, 'Michael Brown', '1999-12-10'),
    (2003, 'Venessa Diaz', '2020-05-07'),
    (2004, 'Avery Dawson', '1993-01-25');

-- Inserting data into Course Table
USE CollegeDB;
INSERT INTO Course (Course_ID, Title, Department)
VALUES
    (101, 'Introduction to Computer Science', 'Computer Science'),
    (102, 'Calculus I', 'Mathematics'),
    (103, 'Quantum Mechanics', 'Physics'),
    (104, 'Database', 'Computer Science'),
    (105, 'Calculus II', 'Mathematics'),
    (106, 'Thermodynamics', 'Physics');

-- Inserting data into Professor Table
USE CollegeDB;
INSERT INTO Professor (Professor_ID, Name, Department)
VALUES
    (2001, 'Dr. Sarah Lee', 'Computer Science'),
    (2002, 'Prof. Mark Johnson', 'Mathematics'),
    (2003, 'Dr. Amanda White', 'Physics'),
    (2004, 'Prof. Mark Graham', 'Computer Science'),
    (2005, 'Prof. Tina Dawson', 'Mathematics'),
    (2006, 'Dr. Marry White', 'Physics');

-- Insert into Enrollment Table
USE CollegeDB;
INSERT INTO Enrollment (Enrollment_ID, Student_ID, Course_ID)
VALUES
    (9000, 2000, 101),
    (9001, 2000, 102),
    (9002, 2001, 101),
    (9003, 2001, 104),
    (9004, 2002, 103),
    (9005, 2002, 106),
    (9006, 2003, 106),
    (9007, 2004, 105),
    (9008, 2004, 103);



Step 8: SQL Statements for Data Deletion

USE CollegeDB;
DELETE FROM Student WHERE Student_ID = 2003;
DELETE FROM Course WHERE Course_ID = 105;


Step 9: SQL Statements for Data Update

USE CollegeDB;
UPDATE Student
SET Name = 'Robert Johnson'
WHERE Student_ID = 2000;

UPDATE Course
SET Title = 'Advanced Computer Science'
WHERE Course_ID = 101;


Step 10: SQL SELECT Statement with WHERE Clause

USE CollegeDB;
SELECT * FROM Student WHERE Date_of_Birth > '1993-09-20';


Step 11: SQL SELECT Statement with GROUP BY Clause

USE CollegeDB;
SELECT Department, COUNT(*) AS Total_Courses FROM Course GROUP BY Department;


Step 12: SQL SELECT Statement with ORDER BY Clause

USE CollegeDB;
SELECT * FROM Student ORDER BY Name ASC;


Step 13: SQL SELECT Statement with HAVING Clause

USE CollegeDB;
SELECT Department, COUNT(*) AS Total_Courses FROM Course GROUP BY Department HAVING Total_Courses > 1;


Step 14: SQL SELECT Statement with JOIN

USE CollegeDB;
SELECT * FROM Student
INNER JOIN Enrollment ON Student.Student_ID = Enrollment.Student_ID;


Step 15: SQL SELECT Statement with DATE Data Type in WHERE Clause

USE CollegeDB;
SELECT * FROM Student WHERE Date_of_Birth < '2000-01-01';


Step 16: SQL CREATE VIEW Statement

USE CollegeDB;
CREATE VIEW Enrollment_Info AS
SELECT 
    s.Student_ID,
    s.Name AS Student_Name,
    c.Title AS Course_Title,
    c.Department AS Course_Department,
    p.Professor_ID,
    p.Name AS Professor_Name
FROM 
    Student s
    INNER JOIN Enrollment e ON s.Student_ID = e.Student_ID
    INNER JOIN Course c ON e.Course_ID = c.Course_ID
    INNER JOIN Professor p ON c.Department = p.Department
ORDER BY Student_Name ASC;


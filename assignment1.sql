-- Creating Database 'SchoolDB'

CREATE DATABASE IF NOT EXISTS SchoolDB;

-- Using Database 'SchoolDB'

USE SchoolDB;

-- Creating Table 'Student'

CREATE TABLE Student (
    Roll_no INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone BIGINT(10) NOT NULL,
    marks INT NOT NULL CHECK (marks BETWEEN 0 AND 100),
    favourite_subjects VARCHAR(255)
);

-- Populating the table with random data

INSERT INTO Student (name, phone, marks, favourite_subjects)
VALUES
    ('Rohan Verma', '8764568324', 98, 'Maths'),
    ('Aarav Kapoor', '9875389045', 85, 'Science'),
    ('Ananya Sharma', '9876543222', 92, 'English'),
    ('Ishita Verma', '9876543210', 72, 'Hindi'),
    ('Rajat Singhania', '8765432109', 39, 'History'),
    ('Nisha Khanna', '7654321098', 56, 'English'),
    ('Siddharth Reddy', '6543210987', 85, 'Maths'),
    ('Priya Desai', '5432109876', 96, 'Physical Education'),
    ('Vikram Yadav', '4321098765', 62, 'Geography'),
    ('Meera Joshi', '3210987654', 59, 'Biology'),
    ('Rohan Malhotra', '2109876543', 74, 'English'),
    ('Preeti Chatterjee', '1098765432', 89, 'Geography'),
    ('Aditya Rajput', '9870123456', 44, 'Hindi'),
    ('Kavya Kapoor', '8901234567', 52, 'Physical Education'),
    ('Varun Mehra', '7890123456', 49, 'History'),
    ('Jaya Nair', '6789012345', 60, 'Biology'),
    ('Dev Khurana', '5678901234', 81, 'Hindi'),
    ('Shruti Sharma', '4567890123', 53, 'Physical Education'),
    ('Aniket Kapoor', '3456789012', 63, 'Science'),
    ('Swara Banerjee', '2345678901', 58, 'Geography'),
    ('Arnav Singh', '1234567890', 93, 'Maths'),
    ('Riya Bhatia', '8765432101', 83, 'Maths'),
    ('Pranav Deshmukh', '7654321090', 99, 'Science'),
    ('Aisha Kumar', '6543210980', 59, 'Science'),
    ('Karthik Rana', '5432109870', 69, 'Hindi')
    ;

-- Triggers to restrict user from deleting the Student table

DELIMITER //
CREATE TRIGGER prevent_drop_Student
BEFORE DELETE
ON Student
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot Drop Student Table';
END//
DELIMITER ;

-- Query to calculate the average marks of students

SELECT AVG(marks) AS average_marks FROM Student;

-- Query to calculate the unique number of subjects

SELECT COUNT(DISTINCT favourite_subjects) AS unique_subjects FROM Student;

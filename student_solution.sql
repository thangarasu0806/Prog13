USE CollegeDB;

DROP TABLE IF EXISTS StudentCourse;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE StudentCourse (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Commerce');

INSERT INTO Faculty VALUES
(101, 'Dr. Kumar', 1),
(102, 'Dr. Priya', 2);

INSERT INTO Course VALUES
(201, 'Database Management System', 101),
(202, 'Python Programming', 101),
(203, 'Business Management', 102);

INSERT INTO Student VALUES
(301, 'John', 1),
(302, 'David', 2),
(303, 'Alex', 1);

INSERT INTO StudentCourse VALUES
(301, 201),
(301, 202),
(302, 203),
(303, 201);

create database universities;
use universities;
CREATE TABLE University (
    university_id INT PRIMARY KEY,
    university_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES University(university_id)
);

CREATE TABLE Program (
    program_id INT PRIMARY KEY,
    program_name VARCHAR(100),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES University(university_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    program_id INT,
    FOREIGN KEY (program_id) REFERENCES Program(program_id)
);

CREATE TABLE Syllabus (
    syllabus_id INT PRIMARY KEY,
    syllabus_name VARCHAR(100),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES University(university_id)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    specialization VARCHAR(100),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES University(university_id)
);

CREATE INDEX idx_university_location ON University(location);
CREATE INDEX idx_department_university_id ON Department(university_id);
CREATE INDEX idx_program_university_id ON Program(university_id);
CREATE INDEX idx_course_program_id ON Course(program_id);
CREATE INDEX idx_syllabus_university_id ON Syllabus(university_id);
CREATE INDEX idx_faculty_university_id ON Faculty(university_id);
INSERT INTO University (university_id, university_name, location) VALUES
(1, 'Delhi University', 'Delhi'),
(2, 'Jawaharlal Nehru University', 'Delhi'),
(3, 'Aligarh Muslim University', 'Aligarh'),
(4, 'University of Jammu', 'Jammu'),
(5, 'Jamia Millia Islamia', 'Delhi');

INSERT INTO Department (department_id, department_name, university_id) VALUES
(101, 'Computer Science', 1),
(102, 'Physics', 2),
(103, 'Mathematics', 1),
(104, 'Chemistry', 3),
(105, 'Management Studies', 4);

INSERT INTO Program (program_id, program_name, university_id) VALUES
(201, 'MCA', 1),
(202, 'MA in International Relations', 2),
(203, 'B.Tech in Mechanical Engineering', 4),
(204, 'M.Sc in Chemistry', 3),
(205, 'MBA', 5);

INSERT INTO Course (course_id, course_name, program_id) VALUES
(301, 'Database Management Systems', 201),
(302, 'Foreign Policy Analysis', 202),
(303, 'Thermodynamics', 203),
(304, 'Organic Chemistry', 204),
(305, 'Marketing Management', 205);

INSERT INTO Syllabus (syllabus_id, syllabus_name, university_id) VALUES
(401, 'Computer Architecture', 1),
(402, 'International Relations Theory', 2),
(403, 'Fluid Mechanics', 4),
(404, 'Analytical Chemistry', 3),
(405, 'Financial Management', 5);

INSERT INTO Faculty (faculty_id, faculty_name, specialization, university_id) VALUES
(501, 'political science', 'Computer Networks', 1),
(502, 'science', 'Political Science', 2),
(503, 'education', 'Thermal Engineering', 4),
(504, 'medicine', 'Organic Chemistry', 3),
(505, 'engineering', 'Marketing', 5);
SELECT university_name
FROM University
WHERE location = 'Delhi';
 
SELECT department_name
FROM Department
WHERE university_id = (SELECT university_id FROM University WHERE university_name = 'Aligarh Muslim University');
 
SELECT location
FROM University
WHERE university_name = 'Jawaharlal Nehru University';
 
SELECT program_name
FROM Program
WHERE university_id = (SELECT university_id FROM University WHERE university_name = 'University of Jammu');
 
SELECT u.university_name
FROM University u
JOIN Program p ON u.university_id = p.university_id
WHERE p.program_name = 'MCA';
SELECT c.course_name
FROM Course c
JOIN Program p ON c.program_id = p.program_id
JOIN University u ON p.university_id = u.university_id
WHERE u.university_name = 'Aligarh Muslim University' AND p.program_name = 'MCA';

SELECT faculty_name, university_name
FROM Faculty f
JOIN University u ON f.university_id = u.university_id
WHERE specialization = 'Information Security';
 
SELECT syllabus_name, university_name
FROM Syllabus s
JOIN University u ON s.university_id = u.university_id
WHERE syllabus_name = 'Computer Architecture';
  

SELECT faculty_name
FROM Faculty f
JOIN Department d ON f.university_id = d.university_id
JOIN University u ON d.university_id = u.university_id
WHERE d.department_name = 'Computer Science' AND u.location = 'Delhi';
 
SELECT university_name
FROM University
WHERE university_id = (
    SELECT university_id
    FROM Department
    GROUP BY university_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Query to create the database
CREATE DATABASE online_course_management;

-- Queries to create the tables
CREATE TABLE Course_creator (
    creator_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_date DATE,
    email VARCHAR(255),
    PRIMARY KEY creator_id
);

CREATE TABLE Student (
    student_id INT,
    firstn_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    birth_date DATE,
    email VARCHAR(255),
    address_line_1 VARCHAR(255),
    address_line_2 VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip CHAR(5),
    PRIMARY KEY student_id
);

CREATE TABLE Course (
    course_id INT,
    course_title VARCHAR(255),
    course_description VARCHAR(255),
    department VARCHAR(255),
    total_points INT,
    course_status VARCHAR(255),
    creator_id INT,
    PRIMARY KEY course_id,
    FOREIGN KEY creator_id REFERENCES Course_creator(creator_id)
);

CREATE TABLE Module (
    module_id INT,
    course_id INT,
    module_title VARCHAR(255),
    module_description VARCHAR(255),
    section_number INT,
    total_points INT,
    PRIMARY KEY module_int,
    FOREIGN KEY course_id REFERENCES Course(course_id)
);

CREATE TABLE Class_enrollment (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY student_id REFERENCES Student(student_id),
    FOREIGN KEY course_id REFERENCES Course(course_id)
);

CREATE TABLE Invoice (
    invoice_id INT,
    student_id INT,
    payment_total FLOAT(8, 2),
    payment_date DATE,
    PRIMARY KEY invoice_id,
    FOREIGN KEY student_id REFERENCES Student(student_id)
);

CREATE TABLE Assignment (
    assignment_id INT,
    course_id INT,
    module_id INT,
    max_points INT,
    PRIMARY KEY assignment_id,
    FOREIGN KEY course_id REFERENCES Course(course_id),
    FOREIGN KEY module_id REFERENCES Module(module_id)
);

CREATE TABLE Exam (
    exam_id INT,
    course_id INT,
    max_points INT,
    PRIMARY KEY exam_id,
    FOREIGN KEY course_id REFERENCES Course(course_id)
);

CREATE TABLE Assignment_submission (
    assignment_id INT,
    student_id INT,
    scored_points FLOAT(6,2),
    submission_date DATE,
    submission_time TIME,
    FOREIGN KEY assignment_id REFERENCES Assignment(assignment_id),
    FOREIGN KEY student_id REFERENCES Student(student_id)
);

CREATE TABLE Exam_submission (
    exam_id INT,
    student_id INT,
    scored_points FLOAT(6,2),
    submission_date DATE,
    submission_time TIME,
    FOREIGN KEY exam_id REFERENCES Exam(exam_id),
    FOREIGN KEY student_id REFERENCES Student(student_id)
);

CREATE TABLE Module_completion (
    module_id INT,
    student_id INT,
    completed BOOLEAN,
    completion_date DATE,
    total_points_earned FLOAT(6,2),
    FOREIGN KEY module_id REFERENCES Module(module_id),
    FOREIGN KEY student_id REFERENCES Student(student_id)
);

CREATE TABLE Course_subscribers (
    course_id INT,
    student_id INT,
    course_creator INT,
    creator_earning_per_subscriber FLOAT(6,2),
    FOREIGN KEY course_id REFERENCES Course(course_id),
    FOREIGN KEY student_id REFERENCES Student(student_id),
    FOREIGN KEY course_creator REFERENCES Course(creator_id)
);

CREATE TABLE Student_Activity (
    student_id INT,
    course_id INT,
    creator_id INT,
    invoice_id INT,
    activity_date DATE,
    student_course_status VARCHAR(255),
    FOREIGN KEY student_id REFERENCES Student(student_id),
    FOREIGN KEY course_id REFERENCES Course(course_id),
    FOREIGN KEY creator_id REFERENCES Course_creator (creator_id),
    FOREIGN KEY invoice_id REFERENCES Invoice(invoice_id)
);

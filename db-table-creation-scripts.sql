-- Query to create the database
CREATE DATABASE online_course_management;

-- Queries to create the tables
CREATE TABLE Online_Courses.db_datawriter.Course_creator (
    creator_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_date DATE,
    email VARCHAR(255)
);

CREATE TABLE Online_Courses.db_datawriter.Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    birth_date DATE,
    email VARCHAR(255),
    address_line_1 VARCHAR(255),
    address_line_2 VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip CHAR(5),
);

CREATE TABLE Online_Courses.db_datawriter.Course (
    course_id INT PRIMARY KEY,
    course_title VARCHAR(255),
    course_description VARCHAR(255),
    department VARCHAR(255),
    total_points INT,
    course_status VARCHAR(255),
	creator_id INT,
    CONSTRAINT fk_creator_id FOREIGN KEY (creator_id) REFERENCES Online_Courses.db_datawriter.Course_creator(creator_id)
);

CREATE TABLE Online_Courses.db_datawriter.Module (
    module_id INT PRIMARY KEY,
    course_id INT,
    module_title VARCHAR(255),
    module_description VARCHAR(255),
    section_number INT,
    total_points INT,
    CONSTRAINT fk_module_course FOREIGN KEY (course_id) REFERENCES Online_Courses.db_datawriter.Course(course_id)
);

CREATE TABLE Online_Courses.db_datawriter.Class_enrollment (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    CONSTRAINT fk_enrollment_student FOREIGN KEY (student_id) REFERENCES Online_Courses.db_datawriter.Student(student_id),
    CONSTRAINT fk_enrollment_course FOREIGN KEY (course_id) REFERENCES Online_Courses.db_datawriter.Course(course_id)
);

CREATE TABLE Online_Courses.db_datawriter.Invoice (
    invoice_id INT PRIMARY KEY,
    student_id INT,
    payment_total DECIMAL(8,2),
    payment_date DATE,
    CONSTRAINT fk_invoice_student FOREIGN KEY (student_id) REFERENCES Online_Courses.db_datawriter.Student(student_id)
);

CREATE TABLE Online_Courses.db_datawriter.Assignment (
    assignment_id INT PRIMARY KEY,
    course_id INT,
    module_id INT,
    max_points INT,
    CONSTRAINT fk_assignment_course FOREIGN KEY (course_id) REFERENCES Online_Courses.db_datawriter.Course(course_id),
    CONSTRAINT fk_assignment_module FOREIGN KEY (module_id) REFERENCES Online_Courses.db_datawriter.Module(module_id)
);

CREATE TABLE Online_Courses.db_datawriter.Exam (
    exam_id INT PRIMARY KEY,
    course_id INT,
    module_id INT,
    max_points INT,
    passed BIT, /*Because there's not Boolean option in SQL server use the BIT option where 1 = yes & 0 = no*/
    CONSTRAINT fk_exam_course FOREIGN KEY (course_id) REFERENCES Online_Courses.db_datawriter.Course(course_id),
    CONSTRAINT fk_exam_module FOREIGN KEY (module_id) REFERENCES Online_Courses.db_datawriter.Module(module_id)
);

CREATE TABLE Online_Courses.db_datawriter.Assignment_submission (
    assignment_id INT,
    student_id INT,
    scored_points DECIMAL(6,2),
    submission_date DATE,
    submission_time TIME,
    CONSTRAINT fk_submission_assignment FOREIGN KEY (assignment_id) REFERENCES Online_Courses.db_datawriter.Assignment(assignment_id),
    CONSTRAINT fk_submission_student FOREIGN KEY (student_id) REFERENCES Online_Courses.db_datawriter.Student(student_id)
);

CREATE TABLE Online_Courses.db_datawriter.Exam_submission (
    exam_id INT,
    student_id INT,
    scored_points DECIMAL(6,2),
    submission_date DATE,
    submission_time TIME,
    CONSTRAINT fk_submission_exam FOREIGN KEY (exam_id) REFERENCES Online_Courses.db_datawriter.Exam(exam_id),
    CONSTRAINT fk_submission_exam_student FOREIGN KEY (student_id) REFERENCES Online_Courses.db_datawriter.Student(student_id)
);

CREATE TABLE Online_Courses.db_datawriter.Module_completion (
    module_id INT,
    student_id INT,
    completed BIT,
    completion_date DATE,
    total_points_earned DECIMAL(6,2),
    CONSTRAINT fk_completion_module FOREIGN KEY (module_id) REFERENCES Online_Courses.db_datawriter.Module(module_id),
    CONSTRAINT fk_completion_module_student FOREIGN KEY (student_id) REFERENCES Online_Courses.db_datawriter.Student(student_id)
);

CREATE TABLE Online_Courses.db_datawriter.Course_subscribers (
    course_id INT,
    student_id INT,
    course_creator INT,
    creator_earning_per_subscriber DECIMAL(6,2),
    CONSTRAINT fk_subscriber_course FOREIGN KEY (course_id) REFERENCES Online_Courses.db_datawriter.Course(course_id),
    CONSTRAINT fk_subscriber_student FOREIGN KEY (student_id) REFERENCES Online_Courses.db_datawriter.Student(student_id),
    CONSTRAINT fk_subscriber_creator FOREIGN KEY (course_creator) REFERENCES Online_Courses.db_datawriter.Course_creator(creator_id)
);

/*DELETE invoice_id & creator_id because it's unnnecesary for this table for this first delete the 
constraints fk_activity_course_creator & fk_activity_invoice*/
CREATE TABLE Online_Courses.db_datawriter.Student_Activity (
    student_id INT,
    course_id INT,
    activity_date DATE,
    student_course_status VARCHAR(255),
    CONSTRAINT fk_activity_student FOREIGN KEY (student_id) REFERENCES Online_Courses.db_datawriter.Student(student_id),
    CONSTRAINT fk_activity_course FOREIGN KEY (course_id) REFERENCES Online_Courses.db_datawriter.Course(course_id)
);

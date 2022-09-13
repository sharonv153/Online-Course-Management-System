-- Queries to insert data into all the tables
INSERT INTO Course_creator (creator_id, first_name, last_name, birth_date, department, email)
VALUES (10001, 'Alex', ''),
    ()
    ();

INSERT INTO Student (student_id, first_name, last_name, birth_date, address_line_1, address_line_2, city, state, zip, email)
VALUES ()
    ()
    ();

INSERT INTO Course (course_id, course_title, course_description, department, total_points, course_status, instructor_id, creator_id)
VALUES ()
    ()
    ();

INSERT INTO Module (module_id, course_id, module_title, module_description, section_number, total_points)
VALUES ()
    ()
    ();

INSERT INTO Class_enrollment (student_id, course_id, start_date, end_date, points_earned, enrollment_date)
VALUES ()
    ()
    ();

INSERT INTO Invoice (invoice_id, student_id, payment_total, payment_date)
VALUES ()
    ()
    ();

INSERT INTO Assignment (assignment_id, course_id, module_id, max_points,)
VALUES ()
    ()
    ();

INSERT INTO Exam (exam_id, course_id, module_id, max_points, passed)
VALUES ()
    ()
    ();

INSERT INTO Assignment_submission (assignment_id, student_id, scored_points, submission_date, submission_time)
VALUES ()
    ()
    ();

INSERT INTO Exam_submission (exam_id, student_id, scored_points, submission_date, submission_time)
VALUES ()
    ()
    ();

INSERT INTO Module_completion ( module_id, student_id, completed, completion_date, total_points_earned)
VALUES ()
    ()
    ();

INSERT INTO Course_subscribers (course_id, student_id, course_creator, creator_earning_per_subscriber)
VALUES ()
    ()
    ();

INSERT INTO Student_Activity (student_id, course_id, creator_id, invoice_id, activity_date, student_course_status)
VALUES ()
    ()
    ();

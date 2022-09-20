-- This files shows queries created to answer specific questions or requests

-- 1 How many students each course has and who is the course creator?
-- [sub query to sum students attending course, and then compile together
-- subquery  with course information and course creator table]
SELECT c.course_id, c.course_title, c.creator_id, count(ce.student_id)
FROM Course c
    JOIN Class_enrollment ce
        ON c.course_id = ce.course_id
GROUP BY c.course_id, c.course_title, c.creator_id;

-- 2 Get the names of all students that aren't enrolled in any courses
SELECT student_id, first_name, last_name
FROM Student s
WHERE s.student_id NOT IN (SELECT student_id
                            FROM Class_enrollment);

-- 3 Get the names of all students that are enrolled in at least a course
SELECT s.first_name, s.last_name, c.course_title, ce.enrollment_date, c.department
FROM Student s
    RIGHT JOIN Class_enrollment ce
        ON s.student_id = ce.student_id
    LEFT JOIN Course c
        ON ce.course_id = c.course_id
WHERE s.student_id IN (SELECT student_id
                     FROM Class_enrollment);

-- 4 Get the name of the students that bring the most profit in and
-- how much profit it is (students that are either enrolled in no courses or just on 1 course) 
SELECT s.student_id, s.first_name, s.last_name, (payment_total - sum(ce.class_cost)) as revenue
FROM Student s
    JOIN Class_enrollment ce
        ON s.student_id = ce.student_id
    JOIN Invoice i
        ON ce.student_id = i.student_id
WHERE s.student_id NOT IN (SELECT student_id
                            FROM Class_enrollment) 
    OR s.student_id = (SELECT count(student_id)
                       FROM Class_enrollment
                       HAVING count(student_id) = 1)
HAVING revenue > 5;

-- 5 Get the courses with the most students in it, add course name, 
-- course id, calculate how much $$ the course creator makes, and order by # of students
SELECT ce.course_id, cc.course_title, CONCAT(ce.first_name, ' ', ce.last_name) as creator_name, 
    COUNT(ce.student_id) as total_students, (COUNT(ce.student_id)*5) as creator__revenue
FROM Class_enrollment ce
    JOIN Course c
        ON  ce.course_id = c.course_id
    JOIN Course_creator cc
        ON ce.creator_id = cc.creator_id
GROUP BY ce.course_id, cc.course_title, creator_name
ORDER BY ce.total_students DESC;

-- 6 Get all the courses that have no students enrolled
SELECT c.course_id, c.course_title, c.department, 
FROM Course c
    JOIN Class_enrollment ce
        ON c.course_id = ce.course_id
WHERE c.course_id NOT IN (SELECT course_id
                          FROM Class_enrollment);

-- 7 Get all the courses that have at least 1 student that completed
-- all the modules [use subquery]
SELECT c.course_id, c.course_title
FROM Course c
    JOIN Class_enrollment ce
        ON c.course_id = ce.course_id
    JOIN Modules m
        ON c.course_id = m.course_id
WHERE m.module_id = (SELECT m2.module_id
                     FROM Modules m2
                     WHERE m2.module_id = m.module_id);

-- 8 Find students that have scored at least 800 points
-- or find students that have submitted at least 3 assignments and 2 tests
SELECT s.student_id, count(assignment_id) as Assignments_submitted, count(exam_id) as Exams_submitted
FROM Student s
    JOIN Assignment_submission a
        ON s.student_id = a.student_id
    JOIN Exam_submission e
        ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING count(assignment_id) > 3 AND count(exam_id) > 2
ORDER BY s.student_id;

-- 9 Create a view that computes the grade of each student by 
-- adding all the points from assingments, exams, and module 
-- completion by course
CREATE VIEW Grades AS (
    SELECT s.student_id, s.first_name, s.last_name, c.course_title,
        sum(esub.scored_points, asub.scored_points, mc.total_points_earned) as total_points
    FROM Student s
        JOIN Module_completion mc
            ON c.student_id = mc.student_id
        JOIN Modules m
            ON mc.module_id = m.module_id
        JOIN Exam_submission esub
            ON s.student_id = esub.student_id
        JOIN Exam e
            ON esub.exam_id = e.exam_id
        JOIN Assignment_submission asub
            ON s.student_id = adub.student_id
        JOIN Assingment a
            ON asub.assignment_id = a.assignment_id
        JOIN Course c
            ON m.course_id = c.course_id
);


-- 10 Create a view to compute how many active subcribers each creator has per course 
-- and how much compensation they should receive for the month of August in 2021:

CREATE VIEW Creator_earnings AS 
    SELECT Course_creator.creator_id, Student_Activity.student_course_status,
     Course_subscribers.course_id, count(Student_Activity.student_id) AS total_active_students, 
     (count(Student_Activity.student_id)*creator_earning_per_subscriber) AS total_earnings
    FROM Course_creator
        JOIN Course
            ON Course.creator_id = Course_creator.creator_id
        JOIN Student_Activity
            ON Course.course_id = Student_Activity.course_id
        JOIN Course_subscribers 
            ON Course_subscribers.student_id = Student_Activity.student_id
    WHERE student_course_status = 'Active' AND activity_date BETWEEN '2021-08-01' AND '2021-08-31'
    GROUP BY Course_creator.creator_id, Student_Activity.student_course_status
    ORDER BY Course_creator.creator_id DESC;

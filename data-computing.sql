-- This files shows queries created to answer specific questions or requests

/*
1 How many students each course has and who is the course creator?
[sub query to sum students attending course, and then compile together
subquery  with course information and course creator table]
*/
SELECT c.course_id, c.course_title, c.creator_id, count(ce.student_id) as total_students_enrolled
FROM Online_Courses.db_datawriter.Course c
    JOIN Online_Courses.db_datawriter.Class_enrollment ce
        ON c.course_id = ce.course_id
GROUP BY c.course_id, c.course_title, c.creator_id;

/*
2 Get the names of all students that aren't enrolled in any courses
*/
SELECT student_id, first_name, last_name
FROM Online_Courses.db_datawriter.Student s
WHERE s.student_id NOT IN (SELECT student_id
                            FROM Online_Courses.db_datawriter.Class_enrollment);

/* 
3 Get the names of all students that are enrolled in at least a course
*/
SELECT s.first_name, s.last_name, c.course_title, ce.enrollment_date, c.department as course_category
FROM Online_Courses.db_datawriter.Student s
    RIGHT JOIN Online_Courses.db_datawriter.Class_enrollment ce
        ON s.student_id = ce.student_id
    LEFT JOIN Online_Courses.db_datawriter.Course c
        ON ce.course_id = c.course_id
WHERE s.student_id IN (SELECT student_id
                     FROM Online_Courses.db_datawriter.Class_enrollment);

/*
4 Get the name of the students that bring more than $5 in revenue each month
(students that are either enrolled in no courses or just on 1 course) 
*/
    SELECT student_id, DATENAME(month, activity_date) as active_month, (20-(count(course_id)*5)) AS Revenue
    FROM Online_Courses.db_datawriter.Student_Activity
    GROUP BY student_id, DATENAME(month, activity_date)
    HAVING (20-(count(course_id)*5)) > 5
    ORDER BY student_id, DATENAME(month, activity_date);
    
 /* 
6 Get all the courses that have no students enrolled
WORKS
*/
SELECT course_id, course_title, department
FROM Online_Courses.db_datawriter.Course
WHERE course_id NOT IN (SELECT course_id
                          FROM Online_Courses.db_datawriter.Class_enrollment);
                          
/*
8 FIND THE STUDENTS THAT HAVE SCORED AT LEAST 1500 POINTS SO FAR BY COURSE
*/
    SELECT a.student_id, (SUM(a.scored_points)+SUM(e.scored_points)+SUM(m.total_points_earned)) as total_points, mo.course_id
    FROM Online_Courses.db_datawriter.Assignment_submission a
        INNER JOIN Online_Courses.db_datawriter.Exam_submission e
            ON a.student_id = e.student_id
        INNER JOIN Online_Courses.db_datawriter.Module_completion M
            ON e.student_id = m.student_id
        INNER JOIN Online_Courses.db_datawriter.Module mo
            ON mo.module_id = m.module_id
    GROUP BY a.student_id, mo.course_id
    HAVING (SUM(a.scored_points)+SUM(e.scored_points)+SUM(m.total_points_earned)) >= 800
    ORDER BY total_points;
  
 /*
9 Create a view that computes the grade of each student by 
adding all the points from assingments, exams, and module 
completion by course
WORKS 
*/ 
    CREATE VIEW db_datawriter.Grades AS (
        SELECT a.student_id, (SUM(a.scored_points)+SUM(e.scored_points)+SUM(m.total_points_earned)) as total_points, mo.course_id
        FROM Online_Courses.db_datawriter.Assignment_submission a
            INNER JOIN Online_Courses.db_datawriter.Exam_submission e
                ON a.student_id = e.student_id
            INNER JOIN Online_Courses.db_datawriter.Module_completion M
                ON e.student_id = m.student_id
            INNER JOIN Online_Courses.db_datawriter.Module mo
                ON mo.module_id = m.module_id
        GROUP BY a.student_id, mo.course_id
    );


/*
10. Creat a union of all the assignments and exam submissions for all students
*/
SELECT a.student_id, a.assignment_id as Submission_Type, a.scored_points, a.submission_date
FROM Online_Courses.db_datawriter.Assignment_submission a
UNION ALL
SELECT e.student_id, e.exam_id, e.scored_points, e.submission_date
FROM Online_Courses.db_datawriter.Exam_submission e;

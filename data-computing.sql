-- This files shows queries created to answer specific questions or requests

-- create a view to compute how many active subcribers each creator has per course 
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

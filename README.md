# Kelpler's Online Courses Database Management System (DBMS)
Kepler is new business who’s goal is to make education more accessible to everyone. They are working on building a new platform where independent creators can build their own courses. Kepler’s business model will be subscription based, this means that users have to subscribe to the website to join a course. Their users have to pay a monthly subscription fee of $20, which allows them to enroll in up to 3 courses at a time. If a user wishes to subscribe to more than 3 courses they would have to compete or drop out from one of the 3 courses they are already enrolled in.

The company is working on developing their online platform and is requesting help with building their database. For them to launch their platform they need an efficient database that can store all the information for their clients, creators, payment information, and courses. Based on some research and suggestions from their development team, the company has decided to use Microsoft SQL Server as their database platform. Thus, they expect the database and queries to be built using T-SQL.

Some important details about the company, essential for the database design process:
<ul>
  <li>The courses are built by independent creators</li>
  <li>Each student pays a flat fee every month of $20</li>
  <li>Each course creator (instructor) makes a total of $5 per active student a month per course</li>
  <li>Each student can enroll in up to 3 courses at a time and can only enroll in a new one once they either drop or complete one of the courses they are already enrolled in</li>
  <li>An active student is one that currently has a subscription and is enrolled in at least one course</li>
  <li>The platform keeps either $5 per student or whatever is left from the $20 after a student enrolls in up to 3 courses</li>
  <li>If a student is actively subscribed and paying their monthly subscription but is not enrolled in any courses the total of their subscription will go to the course platform</li>
  <li>If a student cancels their subscription to the website, they automatically become inactive and the creators of the courses they are enrolled in will stop receiving revenue from that student</li>
  <li>Creators receive their payout at the beginning of the month for the previous month, meaning on February 5 a creator will receive a payout for the total active subscribers for January</li>
  <li>Each course is separated into Modules</li>
  <li>To avoid keeping students enrolled in an endless class, each course can have up to 10 modules</li>
</ul>

## Objectives
<ul>
  <li>Design a relational database that holds all the information necessary for an online course platform</li>
  <li>Utilize the normalization process to build a structure with the essential tables for the business to operate without generating data redundancy</li>
  <li>Build a database that the business can later use to analyze their data and make business decisions</li>
</ul>

### Entities

<ul>
  <li><em>Students:</em> tracks every student that creates an account on the website. Whether they subscribe or not a unique id is created, and their information is saved.</li>
  <li><em>Course creator:</em> holds all the information of the course creator. </li>
  <li><em>Course:</em> will contain all the information essential for tracking the course and who created it.</li>
  <li><em>Modules:</em> will show the information that relates to the course and all the modules or sections that belong to each course.</li>
  <li><em>Class enrollment:</em> will help match and track which students join which course.</li>
  <li><em>Assignment:</em> keeps a record of the list of assignments associated with each module and the total points that a student can get with each assignment.</li>
  <li><em>Exam:</em> keeps a record of the list of exams associated with each module and the total points each one is worth.</li>
  <li><em>Invoice:</em> will track the students that make their monthly payment thus keeping their active status on the website.</li>
  <li><em>Assignment submission:</em> matches the assignments for each module and tracks which student submitted it and how many points they earned.</li>
  <li><em>Exam submission:</em> matches the exam submissions of each student for each module. Tracks the submission date, time, and how many points they earned.</li>
  <li><em>Module completion:</em> will track all the students that completed a course, their total points earned, and their final score.</li>
  <li><em>Course subscribers:</em> will keep track of which students are enrolled in which courses.</li>
  <li><em>Course activity:</em> this will track if a student is still enrolled in a course every month and if they have a paid account.</li>
</ul>

### Views 
The views have the purpose of collecting and putting data together while computing totals based on other table columns.
The views in this project were created to avoid duplicating data and reduce the amount of data that gets stored.
<ul>
  <li><em>Creator Earnings:</em> this view has the purpose of displaying how many active subscribers each course that belongs to each creator has and how much they will profit.</li>
</ul>

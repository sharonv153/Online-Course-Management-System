
-- Queries to insert data into all the tables
INSERT INTO Course_creator (creator_id, first_name, last_name, birth_date, email)
VALUES (1000100, 'Alicia', 'Pearce', '06-13-1992', 'AliciaKPearce@gmail.com'),
    (1000101, 'Jamie', 'Norton', '11-12-1987', 'JamieNorton@outlook.com'),
    (1000102, 'Susan', 'Gum', '4-28-1967', 'SusanJGum@yahoo.com');

INSERT INTO Student (student_id, first_name, last_name, birth_date, email, address_line_1, address_line_2, city, state, zip)
VALUES (2000100,'James','Dickson','05-05-1995','jamesd@outlook.com','4594 Half and Half Drive','Apt #C12','Selma','CA','93662'),
    (2000101,'Rachel','Holt','07-19-1981','RachelCHolt@gmail.com','3778 Perry Street','','Flint','MI','48548'),
    (2000102,'Patrick','Bair','04-3-1996','PatrickSBair@gmail.com','3070 Bagwell Avenue','Apt #3','Ocala','FL','34471'),
    (2000103,'Rose','Cox','11-15-1998','RoseBCox@outlook.com','2790 Sugarfoot Lane','Apt A','Indianapolis','IN','46254'),
    (2000104,'Armand','Washington','05-27-1979','ArmandLWashington@gmail.com','744 Olen Thomas Drive','','Graham','TX','76046'),
    (2000105,'Timothy','Ankney','07-08-1988','TimothySAnkney@outlook.com','3208 Tanglewood Road','','Olive Branch','MS','38654'),
    (2000106,'Gene','McGough','11-23-2002','GeneDMcGough@gmail.com','2291 Lowland Drive','APT 2','St Anne','IL','60964'),
    (2000107,'Alvin','Chaney','08-30-1998','AlvinSChaney@yahoo.com','178 Mount Street','APT B-4','Saginaw','MI','48601'),
    (2000108,'Michael','Aragon','10-18-1997','MichaelBAragon@outlook.com','2515 Freshour Circle','','San Antonio','TX','78205'),
    (2000109,'Violet','Suarez','09-24-1986','VioletJSuarez@yahoo.com','43 Cunningham Court','','Ortonville','MI','48462'),
    (2000110,'Owen','Scotti','04-25-2000','OwenSScotti@outlook.com','1587 Virginia Street','APT 23','Chicago','IL','60644'),
    (2000111,'Fernando','Nelson','06-16-2001','FernandoRNelson@gmail.com','535 Commerce Boulevard','APT T4','Omaha','NE','68154'),
    (2000112,'Ernest','Macias','04-29-2002','ErnestPMacias@outlook.com','3197 Red Hawk Road','','Cerro Gordo','MN','56212'),
    (2000113,'George','Derr','05-28-1990','GeorgeSDerr@yahoo.com','4778 Hart Country Lane','','Atlanta','GA','30303'),
    (2000114,'Romona','Duncan','03-31-2001','RomonaADuncan@gmail.com','3333 Timberbrook Lane','APT B5','Denver','CO','80239'),
    (2000115,'Solomon','Greiner','04-10-1994','SolomonKGreiner@outlook.com','1256 Private Lane','APT C','Albany','GA','31701'),
    (2000116,'Alan','Vick','05-21-1994','AlanMVick@yahoo.com','2378 Dawson Drive','','Lonsdale','AR','72087'),
    (2000117,'James','Blanchard','03-03-1981','JamesTBlanchard@gmail.com','4593 Brooke Street','','Houston','TX','77063'),
    (2000118,'Dolores','Hunter','12-20-1992','DoloresKHunter@yahoo.com','2250 Patterson Street','APT C42','Houston','TX','77002'),
    (2000119,'Robin','Hayes','07-20-1998','RobinJHayes@gmail.com','1791 Bailey Drive','APT 22','Iowa City','IA','52240'),
    (2000120,'Erin','Orth','06-29-2000','ErinJOrth@gmail.com','17 Huntz Lane','','Worcester','MA','01608');

INSERT INTO Course (course_id, course_title, course_description, department, total_points, course_status, creator_id)
VALUES (3000100,'Business Strategy Specialization','Covers both the dynamics and the global aspects of strategic management. You will learn how to evaluate industry evolution, build and sustain competitive advantage, formulate and assess business strategies, and align efforts to organizational strategy.','Business',1000,'Active',1000101),
    (3000101,'Python Basics for Data Science','This Python course provides a beginner-friendly introduction to Python for Data Science. Practice through lab exercises, and you will be ready to create your first Python scripts on your own!','Data Science',1000,'Active',1000101),
    (3000103,'Computer Science for Web Programming','Through hands-on projects, you will learn to write and use APIs, create interactive UIs, and leverage cloud services like GitHub and Heroku. You will emerge with knowledge and experience in principles, languages, and tools that empower you to design and deploy applications.','Computer Science',1000,'Active',1000102),
    (3000104,'Renewable Energy','This specialization focuses on pragmatic and fact-based information, including real-world costs and technical performance, market trends, and web-based analysis tools.','Science & Engineering',1000,'Active',1000101),
    (3000105,'Graphic Design','This four-course sequence exposes students to the fundamental skills required to make sophisticated graphic design: process, historical context, and communication through image-making and typography.','Arts & Humanities',1000,'Active',1000100),
    (3000106,'Social Media Marketing','In this program, you will learn how to create a social media presence that people want to follow.','Business',1000,'Active',1000100);

INSERT INTO Module (module_id, course_id, module_title, module_description, section_number, total_points)
VALUES (4000100,3000106,'Introduction to Social Media Marketing','You will learn what social media marketing entails, including the history and the different social media channels that exist.',1,60),
    (4000101,3000106,'Social Media Management','You will learn how to create effective social media posts and how to create a strong brand to help you build a social media presence.',2,60),
    (4000102,3000106,'Fundamentals of Social Media Advertising','Learn how to work with design teams by capturing the essence of your ad campaign in a creative brief, and understand how privacy policies may affect your ads.',3,60),
    (4000103,3000106,'Measure and Optimize Social Media Marketing Campaigns','Learn how to assess advertising effectiveness through lift studies and optimize your campaigns with split testing.',4,60),
    (4000104,3000106,'Social Media Marketing Capstone','Practice creating a presentation on the marketing campaign you have been developing throughout the program with a project where you will gain hands-on experience',5,60),
    (4000105,3000105,'Fundamentals of Graphic Design','At the end of this course you will have learned how to explore and investigate visual representation through a range of image-making techniques; understand basic principles of working with shape, color and pattern; been exposed to the language and skills of typography; and understand and have applied the principles of composition and visual contrast.',1,60),
    (4000106,3000105,'Introduction to Typography','In this rigorous introductory course, we will study, name, and measure the characteristics of letterforms.',2,60),
    (4000107,3000105,'Introduction to Imagemaking','Imagemaking is a fluid and exciting area of graphic design that comes out of practice and process: experimenting fearlessly, showing and sharing ideas, and giving and receiving knowledgeable and constructive input.',3,60),
    (4000108,3000105,'Ideas from the History of Graphic Design','Students will develop an understanding of where the wide variety of today’s design practice comes from. ',4,60),
    (4000109,3000105,'Brand New Brand','This course is the culmination of the Graphic Design Specialization and gives you an opportunity to tie together your knowledge and skills into a single project: a brand development guide for a company you will invent.',5,60),
    (4000110,3000104,'Renewable Energy Technology Fundamentals','Upon completing the course, you will be conversant with the opportunities and challenges of renewable energy technologies.  You will be comfortable participating in debates and making decisions regarding these technologies.',1,75),
    (4000111,3000104,'Renewable Power and Electricity Systems','This course provides a solid grounding in the basics of renewable electricity. We will start with how electricity is measured, how electricity systems operate, and how renewable technologies like wind turbines and solar PV work.',2,75),
    (4000112,3000104,'Renewable Energy Projects','This course will teach you to plan, execute, and operate renewable energy projects such as solar PV plants, wind farms, and geothermal generators.',3,75),
    (4000113,3000104,'Renewable Energy Futures','We will review promising new renewable technologies and approaches, such as floating platforms for wind turbines and building-integrated photovoltaics (PV), and point out key opportunities and limitations.',4,75),
    (4000114,3000103,'HTML & CSS','Learn the basics of web development with HTML & CSS.',1,50),
    (4000115,3000103,'Git & Github','Learn to use Git and Github. How they are different and how they function.',2,50),
    (4000116,3000103,'SQL, Models, and Migrations','Learn about the backend of a website and how data flows.',3,50),
    (4000117,3000103,'JavaScript','Build applications and interactive websites with Javascrypt',4,50),
    (4000118,3000103,'User Interfaces & Testing','Learn to build user friendly websites. Execute tests to build to test functionality.',5,50),
    (4000119,3000103,'Scalability and Security','Learn to build secure websites and ways to build applications that can be scaled',6,50),
    (4000120,3000101,'Python Basics','Your first program. Types. Expressions and Variables. String Operations.',1,60),
    (4000121,3000101,'Python Data Structures','Lists and Tuples. Sets. Dictionaries',2,60),
    (4000122,3000101,'Python Programming Fundamentals','Conditions and Branching. Loops. Functions. Objects and Classes.',3,60),
    (4000123,3000101,'Working with Data in Python','Reading files with open. Writing files with open. Loading data with Pandas. Working with and Saving data with Pandas',4,60),
    (4000123,3000101,'Working with Numpy Arrays','Numpy 1d Arrays. Numpy 2d Arrays.',5,60),
    (4000123,3000100,'Foundations of Business Strategy','Explore the underlying theory and frameworks that provide the foundations of a successful business strategy and provide the tools you need to understand that strategy: SWOT, Competitor, Environmental, Five Forces, and Capabilities Analyses, as well as Strategy Maps.',1,60),
    (4000123,3000100,'Advanced Business Strategy','Learn the tools to analyze strategy across time (competitive dynamics), industries (corporate strategy), geographies (international strategy), and institutions (non-market strategy).',2,60),
    (4000123,3000100,'Business Growth Strategy','Learn to determine how best to build value, whether by scaling existing markets, entering established markets or creating new markets through innovation and acquisitions.',3,60),
    (4000123,3000100,'Strategic Planning and Execution','Earn the pillars of strategy execution--analysis, formulation, and implementation--and how to use the 4A model to effectively approach strategy execution.',4,60),
    (4000123,3000100,'Business Strategy in Practice','The Business Strategy Capstone Project, a comprehensive Strategic Analysis, provides an opportunity for you to synthesize concepts and knowledge from the four prerequisite courses in the specialization.',5,60);

INSERT INTO Class_enrollment (student_id, course_id, enrollment_date)
VALUES (2000100,3000103,'02-05-2020'),
    (2000101,3000105,'06-15-2020'),
    (2000103,3000106,'08-04-2020'),
    (2000104,3000104,'05-22-2020'),
    (2000101,3000104,'06-18-2020'),
    (2000116,3000103,'04-20-2020'),
    (2000113,3000106,'08-22-2020'),
    (2000106,3000100,'03-06-2020'),
    (2000109,3000103,'02-25-2020'),
    (2000111,3000105,'11-20-2020'),
    (2000100,3000101,'10-15-2020'),
    (2000102,3000106,'06-06-2020'),
    (2000119,3000100,'04-16-2020'),
    (2000118,3000103,'07-08-2020'),
    (2000112,3000106,'05-28-2020');
    (2000113,3000105,'06-01-2020'),
    (2000110,3000103,'10-23-2020'),

INSERT INTO Invoice (invoice_id, student_id, payment_total, payment_date)
VALUES (500000,2000100,20,'02-05-2020'),
    (500001,2000101,20,'06-10-2020'),
    (500002,2000103,20,'08-03-2020'),
    (500003,2000104,20,'04-24-2020'),
    (500004,2000105,20,'10-04-2020'),
    (500005,2000108,20,'04-10-2020'),
    (500006,2000119,20,'04-16-2020'),
    (500007,2000102,20,'07-10-2020')
    (500008,2000113,20,'06-01-2020')
    (500009,2000118,20,'07-01-2020')
    (500010,2000116,20,'04-15-2020')
    (500011,2000119,20,'05-16-2020');

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

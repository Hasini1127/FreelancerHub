USE freelancehub;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE freelancer_skills;
TRUNCATE TABLE project_skills;
TRUNCATE TABLE reviews;
TRUNCATE TABLE portfolio;
TRUNCATE TABLE proposals;
TRUNCATE TABLE contracts;
TRUNCATE TABLE projects;
TRUNCATE TABLE freelancer_profiles;
TRUNCATE TABLE users;
TRUNCATE TABLE skills;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO skills (name) VALUES
('Web Development'),
('UI/UX Design'),
('Backend Development'),
('Python Development'),
('AI and Machine Learning'),
('Data Analytics'),
('Mobile App Development'),
('Graphic Design'),
('Database Development'),
('Full-Stack Development'),
('Java Development'),
('Frontend Development'),
('Cybersecurity'),
('WordPress Development'),
('Cloud and DevOps'),
('Software Testing'),
('Digital Marketing'),
('API Integration'),
('HTML'),
('CSS'),
('JavaScript'),
('React'),
('Node.js'),
('Python'),
('SQL'),
('Figma'),
('AWS'),
('Git');

INSERT INTO users (name, email, password, role) VALUES
('Demo Client 1', 'client1@demo.com', '$2b$10$xyz', 'client'),
('Demo Client 2', 'client2@demo.com', '$2b$10$xyz', 'client');

INSERT INTO users (name, email, password, role) VALUES
('Arjun Reddy', 'freelancer1@demo.com', '$2b$10$xyz', 'freelancer'),
('Priya Sharma', 'freelancer2@demo.com', '$2b$10$xyz', 'freelancer'),
('Karthik Varma', 'freelancer3@demo.com', '$2b$10$xyz', 'freelancer'),
('Ananya Rao', 'freelancer4@demo.com', '$2b$10$xyz', 'freelancer'),
('Rahul Mehta', 'freelancer5@demo.com', '$2b$10$xyz', 'freelancer'),
('Sneha Patel', 'freelancer6@demo.com', '$2b$10$xyz', 'freelancer'),
('Vikram Singh', 'freelancer7@demo.com', '$2b$10$xyz', 'freelancer'),
('Meera Nair', 'freelancer8@demo.com', '$2b$10$xyz', 'freelancer'),
('Aditya Kumar', 'freelancer9@demo.com', '$2b$10$xyz', 'freelancer'),
('Divya Reddy', 'freelancer10@demo.com', '$2b$10$xyz', 'freelancer'),
('Nikhil Verma', 'freelancer11@demo.com', '$2b$10$xyz', 'freelancer'),
('Kavya Iyer', 'freelancer12@demo.com', '$2b$10$xyz', 'freelancer'),
('Rohit Das', 'freelancer13@demo.com', '$2b$10$xyz', 'freelancer'),
('Pooja Menon', 'freelancer14@demo.com', '$2b$10$xyz', 'freelancer'),
('Sandeep Rao', 'freelancer15@demo.com', '$2b$10$xyz', 'freelancer'),
('Ishita Shah', 'freelancer16@demo.com', '$2b$10$xyz', 'freelancer'),
('Manish Gupta', 'freelancer17@demo.com', '$2b$10$xyz', 'freelancer'),
('Neha Reddy', 'freelancer18@demo.com', '$2b$10$xyz', 'freelancer'),
('Akash Kumar', 'freelancer19@demo.com', '$2b$10$xyz', 'freelancer'),
('Riya Kapoor', 'freelancer20@demo.com', '$2b$10$xyz', 'freelancer');

INSERT INTO freelancer_profiles (user_id, professional_title, bio, hourly_rate, experience, availability, location) VALUES
(3, 'Web Developer', 'I am Arjun Reddy, a passionate Web Developer ready to take on new challenges and deliver excellent results. I specialize in Web Development.', 452, 'Experienced', 'Available', 'City, India'),
(4, 'UI/UX Designer', 'I am Priya Sharma, a passionate UI/UX Designer ready to take on new challenges and deliver excellent results. I specialize in UI/UX Design.', 602, 'Beginner', 'Available', 'City, India'),
(5, 'Backend Developer', 'I am Karthik Varma, a passionate Backend Developer ready to take on new challenges and deliver excellent results. I specialize in Backend Development.', 498, 'Intermediate', 'Available', 'City, India'),
(6, 'Python Developer', 'I am Ananya Rao, a passionate Python Developer ready to take on new challenges and deliver excellent results. I specialize in Python Development.', 680, 'Experienced', 'Available', 'City, India'),
(7, 'AI/ML Developer', 'I am Rahul Mehta, a passionate AI/ML Developer ready to take on new challenges and deliver excellent results. I specialize in AI and Machine Learning.', 521, 'Experienced', 'Busy', 'City, India'),
(8, 'Data Analyst', 'I am Sneha Patel, a passionate Data Analyst ready to take on new challenges and deliver excellent results. I specialize in Data Analytics.', 711, 'Beginner', 'Available', 'City, India'),
(9, 'Mobile App Developer', 'I am Vikram Singh, a passionate Mobile App Developer ready to take on new challenges and deliver excellent results. I specialize in Mobile App Development.', 376, 'Beginner', 'Available', 'City, India'),
(10, 'Graphic Designer', 'I am Meera Nair, a passionate Graphic Designer ready to take on new challenges and deliver excellent results. I specialize in Graphic Design.', 314, 'Experienced', 'Available', 'City, India'),
(11, 'Database Developer', 'I am Aditya Kumar, a passionate Database Developer ready to take on new challenges and deliver excellent results. I specialize in Database Development.', 736, 'Intermediate', 'Busy', 'City, India'),
(12, 'Full-Stack Developer', 'I am Divya Reddy, a passionate Full-Stack Developer ready to take on new challenges and deliver excellent results. I specialize in Full-Stack Development.', 690, 'Experienced', 'Busy', 'City, India'),
(13, 'Java Developer', 'I am Nikhil Verma, a passionate Java Developer ready to take on new challenges and deliver excellent results. I specialize in Java Development.', 464, 'Intermediate', 'Busy', 'City, India'),
(14, 'React Developer', 'I am Kavya Iyer, a passionate React Developer ready to take on new challenges and deliver excellent results. I specialize in Frontend Development.', 658, 'Experienced', 'Busy', 'City, India'),
(15, 'Cybersecurity Learner', 'I am Rohit Das, a passionate Cybersecurity Learner ready to take on new challenges and deliver excellent results. I specialize in Cybersecurity.', 719, 'Experienced', 'Busy', 'City, India'),
(16, 'WordPress Developer', 'I am Pooja Menon, a passionate WordPress Developer ready to take on new challenges and deliver excellent results. I specialize in WordPress Development.', 546, 'Intermediate', 'Busy', 'City, India'),
(17, 'Cloud and DevOps Junior Engineer', 'I am Sandeep Rao, a passionate Cloud and DevOps Junior Engineer ready to take on new challenges and deliver excellent results. I specialize in Cloud and DevOps.', 450, 'Beginner', 'Available', 'City, India'),
(18, 'Frontend Developer', 'I am Ishita Shah, a passionate Frontend Developer ready to take on new challenges and deliver excellent results. I specialize in Frontend Development.', 715, 'Beginner', 'Busy', 'City, India'),
(19, 'Software Tester', 'I am Manish Gupta, a passionate Software Tester ready to take on new challenges and deliver excellent results. I specialize in Software Testing.', 791, 'Experienced', 'Available', 'City, India'),
(20, 'Digital Marketing Specialist', 'I am Neha Reddy, a passionate Digital Marketing Specialist ready to take on new challenges and deliver excellent results. I specialize in Digital Marketing.', 647, 'Beginner', 'Busy', 'City, India'),
(21, 'Data Visualization Developer', 'I am Akash Kumar, a passionate Data Visualization Developer ready to take on new challenges and deliver excellent results. I specialize in Data Analytics.', 490, 'Intermediate', 'Available', 'City, India'),
(22, 'API Integration Developer', 'I am Riya Kapoor, a passionate API Integration Developer ready to take on new challenges and deliver excellent results. I specialize in API Integration.', 636, 'Beginner', 'Available', 'City, India');

INSERT INTO freelancer_skills (freelancer_id, skill_id) VALUES
(3, 1),
(4, 2),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 12),
(15, 13),
(16, 14),
(17, 15),
(18, 12),
(19, 16),
(20, 17),
(21, 6),
(22, 18);

INSERT INTO projects (client_id, title, description, category, budget, deadline, experience_level, status) VALUES
(1, 'Responsive college website', 'Looking for a professional to build a Responsive college website. Required skills include Web Development.', 'Web Development', 15000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'UI/UX design for a mobile application', 'Looking for a professional to build a UI/UX design for a mobile application. Required skills include UI/UX Design.', 'UI/UX Design', 8000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'Python data analysis', 'Looking for a professional to build a Python data analysis. Required skills include Data Analytics.', 'Data Analytics', 5000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'Machine learning prediction prototype', 'Looking for a professional to build a Machine learning prediction prototype. Required skills include AI and Machine Learning.', 'AI and Machine Learning', 20000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'REST API development', 'Looking for a professional to build a REST API development. Required skills include Backend Development.', 'Backend Development', 12000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'Java application development', 'Looking for a professional to build a Java application development. Required skills include Java Development.', 'Java Development', 18000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'E-commerce frontend', 'Looking for a professional to build a E-commerce frontend. Required skills include Frontend Development.', 'Frontend Development', 10000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'MySQL database design', 'Looking for a professional to build a MySQL database design. Required skills include Database Development.', 'Database Development', 6000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'Flutter application prototype', 'Looking for a professional to build a Flutter application prototype. Required skills include Mobile App Development.', 'Mobile App Development', 25000, '2026-12-31', 'Intermediate', 'Open'),
(1, 'Dashboard and data visualization', 'Looking for a professional to build a Dashboard and data visualization. Required skills include Data Analytics.', 'Data Analytics', 14000, '2026-12-31', 'Intermediate', 'Open');

INSERT INTO reviews (project_id, reviewer_id, reviewed_user_id, rating, comment) VALUES
(6, 1, 3, 4, 'Great work by Arjun Reddy!'),
(4, 1, 4, 4, 'Great work by Priya Sharma!'),
(1, 1, 5, 4, 'Great work by Karthik Varma!'),
(9, 1, 6, 5, 'Great work by Ananya Rao!'),
(5, 1, 7, 5, 'Great work by Rahul Mehta!'),
(8, 1, 8, 5, 'Great work by Sneha Patel!'),
(8, 1, 9, 4, 'Great work by Vikram Singh!'),
(4, 1, 10, 4, 'Great work by Meera Nair!'),
(7, 1, 11, 5, 'Great work by Aditya Kumar!'),
(2, 1, 12, 5, 'Great work by Divya Reddy!'),
(1, 1, 13, 5, 'Great work by Nikhil Verma!'),
(2, 1, 14, 4, 'Great work by Kavya Iyer!'),
(1, 1, 15, 5, 'Great work by Rohit Das!'),
(5, 1, 16, 5, 'Great work by Pooja Menon!'),
(8, 1, 17, 4, 'Great work by Sandeep Rao!'),
(8, 1, 18, 4, 'Great work by Ishita Shah!'),
(6, 1, 19, 5, 'Great work by Manish Gupta!'),
(7, 1, 20, 5, 'Great work by Neha Reddy!'),
(5, 1, 21, 4, 'Great work by Akash Kumar!'),
(9, 1, 22, 4, 'Great work by Riya Kapoor!');


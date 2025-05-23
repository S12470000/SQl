CREATE DATABASE DOTNET;

CREATE TABLE TeamMembers(
Id INT PRIMARY KEY,
Name VARCHAR(25),
"Course Name" VARCHAR(25) NOT NULL,
"PHASE 1" VARCHAR(50),
"PHASE 2" VARCHAR(50),
"PHASE 3" VARCHAR(50),
"PHASE 4" VARCHAR(50),
Assignment VARCHAR(400));

INSERT INTO TeamMembers (id, Name,supervisor, "Course Name", "PHASE 1", "PHASE 2", "PHASE 3", "PHASE 4", Assignment)
VALUES 
(1, 'Mudit Pandit', 'Sandeep sir & Shubham sir','cshap', 'Completed', 'In Progress', 'Not Started', 'Not Started', 'Assignment on Shopping cart'),
(2, 'SUNIL SAINI', 'Sandeep Sir & Shubham sir', 'cshap', 'Completed', 'In Progress', 'Not Started', 'Not Started', 'Assignment on Shopping cart'),
(3, 'YASH sharma', 'Shubham Sir & Shubham sir', 'cshap', 'Completed', 'In Progress', 'Not Started',  'Not Started', 'Assignment on Shopping cart');

SELECT * FROM TeamMembers;

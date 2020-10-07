--Michael Krummenacker MIS 315 Project 18

--1. Insert yourself into the Person table. Use your firstName, lastName, and your UNCW userName. Leave the ID blank - it will be filled in with a unique number by the database.

INSERT INTO Person (firstName, lastName, userName)
VALUES ('Michael','Krummenacker','mrk8220');

SELECT firstName,
	   lastName,
	   userName,
	   personID
FROM   Person
WHERE  lastName = 'Krummenacker'

--2. Insert yourself into the Student table. Find your Person.ID (using a SELECT statement?). Insert your personID and the year you entered UNCW.

INSERT INTO Student(studentID, yearOfUniversityEntry)
VALUES (3435,2017);

SELECT studentID,
	   yearOfUniversityEntry
FROM Student

--3. Insert yourself into the ClassMember table as a member of the Fall 2019 MIS315 class. Use your Student.personID, and figure out the correct ClassSection by running this query:

INSERT INTO ClassMember(studentID, classSectionID)
VALUES (3435,2998);


SELECT classSectionID,
	   instructorID,
	   entryDate
FROM   ClassSection
WHERE  instructorID = 2164


--4. Choose another class that you are enrolled in this semester. Make sure this class does not yet exist in the ClassSection table. Insert a record for that class (with the appropriate 
--instructor), and insert yourself into the ClassMember table as a member of the class. Make sure that all necessary records are in the necessary tables. This is likely to require 
--multiple statements. For example, suppose you are enrolled in ACG203.002 right now. You may have to INSERT a record in Department for the Accounting and Business Law department, 
--then a record in Subject for ACG, then a record in Course for ACG203, then a record in Person and Instructor for the instructor, then a record into ClassSection for ACG203.002, 
--then insert yourself. At a minimum, you should have an INSERT into the ClassSection table, and an INSERT into the ClassMember table.

SELECT * 
FROM Person
WHERE lastName = 'stoker'

SELECT *
FROM Instructor


INSERT INTO ClassSection(courseID, termID, InstructorID, sectionNumber)
VALUES(1477, 1100, 2164, 001);

INSERT INTO ClassMember(studentID, classSectionID)
VALUES (3435,3107);
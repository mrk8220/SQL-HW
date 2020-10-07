--Michael Krummenacker MIS315 Project 17

--1. Insert a new person whose name is Jonathon Smith. His nickname is Jack. Leave all the other fields empty. Use the safe form of the INSERT statement, where you specify every field that you will provide a value for.

INSERT 
INTO tblPerson(FirstName,LastName, Nickname)
VALUES('Jonathon','Smith','Jack')

SELECT FirstName,
	   LastName,
	   Nickname
FROM   tblPerson

--2. Update Jack's cell phone number to 987-456-1234. Don't change any other field. Make sure you only change Jack's cell phone by having the right PersonID=? in the WHERE clause.

UPDATE tblPerson
SET PhoneCell = '987-456-1234'
WHERE PersonID = 10000

SELECT PhoneCell,
	   PersonID,
	   FirstName
FROM   tblPerson

--3. Insert a new person whose name is Deborah Jones. Her nickname is Debbie. Leave all the other fields empty. Use the safe form of the INSERT statement, where you specify every field that you will provide a value for.

INSERT 
INTO tblPerson(FirstName,LastName, Nickname)
VALUES('Deborah','Jones','Debbie')

SELECT LastName
FROM tblPerson

--4. Update Debbie's nickname to Deb. Don't change any other field. Make sure you only change Debbie's nickname by having the right PersonID=? in the WHERE clause.

UPDATE tblPerson
SET Nickname = 'Deb'
WHERE PersonID = 10001

SELECT LastName,
	   PersonID
FROM tblPerson

--5. Give Jack the Student/Alumni role. You do this by inserting a record into the tblPersonRoles table. Use Jack's perID. Use roleID of 1 (refer to validPersonRoles to see that this the Student/Alumni role.)

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10000, 1)

SELECT  roleID,
		perID
FROM tblPersonRoles

--6. Give Jack the Grad Asst role (yes, Jack can have two roles). Look up the right roleID for Grad Asst in the validPersonRoles table.

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10000, 89)

SELECT  roleID,
		roleDesc
FROM validPersonRoles

--7. Delete Deb from the database. Make sure you only delete Deb's record by having the right PersonID=? in the WHERE clause.

DELETE 
FROM tblPerson 
WHERE Nickname = 'Deb';

SELECT LastName,
	   PersonID
FROM tblPerson

--8. We need to put Jack's mother into the system. This will take two separate operations: and insert into tblPerson, and an insert into tblPersonRoles. 
--Write both statements. Jack's mom's name is Karen Smith and her nickname is Kay.

INSERT 
INTO tblPerson(FirstName,LastName, Nickname)
VALUES('Karen','Smith','Kay')

SELECT LastName,
	   PersonID
FROM tblPerson

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10002, 21)

SELECT  roleID,
		perID
FROM tblPersonRoles

--9. Enter a new person named David Johnson with the nickname of Dave and phone number 765-867-5309 who is a CEN mentor and a Business Week presenter. Make sure to give the proper roles to David.

INSERT 
INTO tblPerson(FirstName,LastName, Nickname, PhoneCell)
VALUES('David','Johnson','Dave', '765-867-5309')

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10003, 31)

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10003, 46)

SELECT LastName,
	   PersonID
FROM tblPerson

SELECT  roleID,
		perID
FROM tblPersonRoles


--10. Enter a new person named Diane Kincaid with the nickname DeeDee. She is an ISOM advisory board member, a CEN mentor, a Business Week presenter, and a Guest Lecturer.

INSERT 
INTO tblPerson(FirstName,LastName, Nickname)
VALUES('Diane','Kincaid','DeeDee')

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10004, 26)

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10004, 31)

INSERT   
INTO tblPersonRoles(perID, roleID)
VALUES(10004, 46)

SELECT LastName,
	   PersonID
FROM tblPerson

SELECT  roleID,
		perID
FROM tblPersonRoles
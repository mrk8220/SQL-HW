--Michael Krummenacker MIS 315 Project 15

--1. Show the lastname, first initial, and email of all men. Order by lastname. Use the LEFT() function for the first initial.

SELECT  lastName,
		LEFT(firstName, 1) AS [First Initial],
		email
FROM    Person
WHERE   gender = 'm'

--2. Show the lastname, email, location of '@' in the email, number of characters in the email, and the host name of the email (part to the right of the @). Use the CHARINDEX(), LEN(), and RIGHT() functions.

SELECT  lastName,
		email,
		LEN(email) AS [Email Length],
		CHARINDEX('@', email) AS [Index of @],
		RIGHT(email, CHARINDEX('@', email)) AS [Hostname]
FROM    Person


--3. Show the lastname, firstname, and year of birth for everyone. Use DATEPART (Links to an external site.)().

SELECT    lastName,
		  firstName,
		  DATEPART(year, dateOfBirth) AS [Year]
FROM      Person

--4. Show the lastname, firstname, dateOfBirth, today's date, and the estimated age in years of everyone using DATEDIFF (Links to an external site.)().

SELECT    lastName,
		  firstName,
		  DATEDIFF(year, dateOfBirth, '3/31/2020') AS [DateDiff]
FROM      Person

--5. Show the lastname and firstname of everyone, then their dateOf Birth, the day of the week of their dateofbirth, their birthday this year, and the day of the week for their birthday this year. This will use DATEFROMPARTS (Links to an external site.)(), and DATEPART().

SELECT    lastName,
		  firstName,
		  DATEPART(dd, dateOfBirth) AS [Birthday],
		  DATEFROMPARTS(2020, DATEPART(mm, dateOfBirth), DATEPART(dd, dateOfBirth)) AS [This Years Birthday]
FROM      Person

--6. Show the lastname and firstname of people who were entered more than 2 years ago.

SELECT   lastName,
		 firstName
FROM     Person
WHERE   DATEPART(year, entryDate) <= 2018 

--7. Show the lastname, firstname, and email of all people whose email is NULL. Also show in the same table people whose salutory is blank, i.e., an empty string. Be aware that NULL is not the same as blank - each must be checked separately.

SELECT   lastName,
		 firstName,
		 email
FROM     Person  
WHERE    email = NULL

--8. We need to check our data for inconsistencies. In one SELECT statement, find the ID of every person whose record was updated prior to their creation date, or whose weight is less than zero.

SELECT   lastName,
		 firstName
FROM     Person
WHERE    DATEDIFF(year, entryDate, lastUpdateDate) < 0 OR
		 weight < 0

--9. Give a count of people, by Year of birth. Also provide the average weight of people for each year.

SELECT    YEAR(dateOfBirth) AS [Year],
		  COUNT(dateOfBirth) AS [COUNT],
		  AVG(weight) AS [AVG Weight]
FROM      Person
GROUP BY  YEAR(dateOfBirth)

--10. Give a count of people, by Month of birth. Also provide the average weight of people for each month.

SELECT    MONTH(dateOfBirth) AS [Month],
		  COUNT(dateOfBirth) AS [COUNT],
		  AVG(weight) AS [AVG Weight]
FROM      Person
GROUP BY  MONTH(dateOfBirth)
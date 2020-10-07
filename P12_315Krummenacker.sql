--Michael Krummenacker 315 Project 12 Ranking

--Show a list of last names, their weight, and their ROW_NUMBER() based on weight, ASC. Order the records based on last name.

SELECT   lastName,
         weight,
         ROW_NUMBER() OVER (ORDER BY weight ASC) AS [row]
FROM     Person
ORDER BY lastName

--Show a list of last names, their weight, and their DENSE_RANK() based on weight, ASC. Order the records based on last name.

SELECT   lastName,
         weight,
         DENSE_RANK() OVER (ORDER BY weight ASC) AS [dense]
FROM     Person
ORDER BY lastName

--Show a list of last names, their birthdate, and their RANK() based on birthdate, ASC. Order the records based on last name.

SELECT   lastName,
         dateOfBirth,
         RANK()      OVER (ORDER BY dateOfBirth ASC) AS [Rank]
FROM     Person
Order BY lastName

--Show a list of last names, their birthdate, and NTILE(100) based on birthdate, ASC. Order the records by last name.

SELECT   lastName,
         dateOfBirth,
         NTILE(100) OVER (ORDER BY dateOfBirth ASC) AS [NTILE]
FROM     Person
Order BY lastName

--Show a list of last names, their gender, their weight, and their dense rank based on weight within their gender group. Order the records based on last name.

SELECT   lastName,
         gender,
         weight,
         DENSE_RANK() OVER (PARTITION BY gender ORDER BY weight ASC) AS [dense]
FROM     Person
ORDER BY lastName

--Show a list of last names, their gender, their weight, and their NTILE(100) based on weight within their gender group. Order the records based on gender, then weight.

SELECT   lastName,
         gender,
         weight,
         NTILE(100) OVER (PARTITION BY gender ORDER BY weight ASC) AS [NTILE]
FROM     Person
ORDER BY gender,
         weight

--Show a list of last names, their gender, and their birthdate. Also show their dense rank (youngest to oldest) in terms of age, compared to others of the same gender. (OVER ORDER BY dateofbirth DESC). Order the records based on last name.

SELECT   lastName,
         gender,
         dateOfBirth,
         DENSE_RANK() OVER (PARTITION BY gender ORDER BY dateOfBirth DESC) AS [dense]
FROM     Person
ORDER BY lastName

--Show a list of last names, their birthdate, and their percentile (NTILE(100)) (oldest to youngest). Ordr the records based on last name.

SELECT   lastName,
         dateOfBirth,
         NTILE(100) OVER (ORDER BY dateOfBirth ASC) AS [ntile]
FROM     Person
ORDER BY lastName


--Show a list of people whose last names start with 'S'. For these people, show their last name, and their weight rank (lowest to highest) compared to people with the same last name.

SELECT   lastName,
         RANK() OVER (PARTITION BY lastName ORDER BY weight DESC) AS [rank]
FROM     Person
WHERE    lastName LIKE 'S%'
ORDER BY lastName

--Rank all the people by weight into three groups: 1=low weight, 2=medium weight, 3=high weight. Give a list of their last names and their weight ranking.

SELECT   lastName,
         NTILE(3) OVER (ORDER BY weight) AS [Ntile]
FROM     Person
ORDER BY lastName
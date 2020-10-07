--Michael Krummenacker MIS315 Project 9

--1. Show a list of last names, but only include common lastnames, where more than 100 people have the lastname.

SELECT   lastName
FROM     Person
GROUP BY lastname
HAVING   COUNT(lastName) > 100

--2. Show a list of last names, but only include lastnames common to men, where more than 100 men have the lastname.

SELECT   lastName
FROM     Person
WHERE    gender = 'm'
GROUP BY lastName
HAVING   COUNT(lastName) > 100

--3. Show a list of first names that start with the letter C, but only include common first names, where more than 100 people have that first name.

SELECT   firstName
FROM     Person
WHERE    firstName LIKE 'C%'
GROUP BY firstName
HAVING   COUNT(firstName) > 100

--4. Show a list of years when people were born. Only include years when fewer than 50 people were born.

SELECT   YEAR(dateOfBirth)
FROM     Person
GROUP BY YEAR(dateOfBirth)
HAVING   COUNT(ID) < 50

--5. Show a list of years when people were born. Only include years when more than 200 men over 200 pounds were born.

SELECT   YEAR(dateOfBirth)
FROM     Person
WHERE    gender = 'm' AND
		 weight > 200
GROUP BY YEAR(dateOfBirth)
HAVING   COUNT(ID) > 200

--6. Show a list of authors' last names , and the number of books they wrote. Only include authors who have only written 1 book.

SELECT   au_lname,
		 COUNT(titles.title_id)
FROM     authors 
   JOIN  titleauthor ON  authors.au_id = titleauthor.au_id
   JOIN  titles      ON  titles.title_id = titleauthor.title_id
GROUP BY au_lname
HAVING   COUNT(titles.title_id) = 1

--7. Show a list of book titles, and the number of authors on the book. Only include books that have more than 1 author.

SELECT   titles.title,
		 COUNT(authors.au_id) as [# of Authors]
FROM     authors 
   JOIN  titleauthor ON  authors.au_id = titleauthor.au_id
   JOIN  titles      ON  titles.title_id = titleauthor.title_id
GROUP BY titles.title
HAVING   COUNT(authors.au_id) > 1

--8. Show a list of authors' last names, and the average royaltyper that they have received for their books. Only include authors whose average royaltyper is $70 or more.

SELECT  au_lname,
		AVG(royaltyper) AS [$ RoyalTyper]
FROM     authors 
   JOIN  titleauthor ON  authors.au_id = titleauthor.au_id
   JOIN  titles      ON  titles.title_id = titleauthor.title_id
GROUP BY au_lname
HAVING   AVG(royaltyper) > 70

--9. Show a list of authors' last names, and the total amount of advances they've had across all titles. Only include authors who have received more than $10000 in advances.

SELECT   au_lname,
         SUM(advance) AS [Total Advance]
FROM     authors 
   JOIN  titleauthor ON  authors.au_id = titleauthor.au_id
   JOIN  titles      ON  titles.title_id = titleauthor.title_id    
GROUP BY au_lname
HAVING   SUM(advance) > 10000

--10. Show a list of authors' last names, and the total amounf of advances they've had across all titles. Only include authors in California who have received more than $8000 in advances.

SELECT   au_lname,
         SUM(advance) AS [Total Advance]
FROM     authors 
   JOIN  titleauthor ON  authors.au_id = titleauthor.au_id
   JOIN  titles      ON  titles.title_id = titleauthor.title_id 
WHERE    authors.state = 'ca'
GROUP BY au_lname
HAVING   SUM(advance) > 8000


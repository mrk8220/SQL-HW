--Michael Krummenacker MIS315 Project 6

--Categories and Products
--1.Show the CategoryID, CategoryName, ProductID, and ProductName of all products. Use the WHERE clause syntax for the JOIN.

SELECT   Products.CategoryID,
         CategoryName,
         ProductID,
         ProductName
FROM     Categories,
         Products
WHERE    Products.CategoryID = Categories.CategoryID
ORDER BY Products.CategoryID



--2. Do #1 again, but use the JOIN syntax.

SELECT   Categories.CategoryID,
         CategoryName,
         ProductID,
         ProductName
FROM     Products JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY Products.CategoryID

--3. Show the ProductID, ProductName, CategoryID, and CategoryName of all products. Use the WHERE clause syntax for the JOIN.

SELECT   ProductID,
         ProductName,
         Products.CategoryID,
         CategoryName
FROM     Categories,
         Products
WHERE    Products.CategoryID = Categories.CategoryID
ORDER BY ProductID

--4. Do #3 again, but use the JOIN syntax

SELECT   ProductID,
         ProductName,
         Categories.CategoryID,
         CategoryName
FROM     Products JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY ProductID

--5. Show the number of products in each category. The columns should be CategoryID, CategoryName, and [Count of Products]. Order by CategoryID.

SELECT   Categories.CategoryID,
		 CategoryName,
		 Count(ProductID)
FROM     Products,
		 Categories
WHERE    Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName,
		 Categories.CategoryID
ORDER BY Categories.CategoryID


--Suppliers and Products
--6. Show the Supplier Company Name, the ProductName, and the unitprice of all products. Use whichever JOIN style you like.

SELECT   CompanyName,
		 ProductName,
		 UnitPrice
FROM	 Suppliers,
		 Products

--7. Show the ProductID, ProductName, and Supplier Company Name of all products that are not discontinued.

SELECT   ProductID,
		 ProductName,
		 CompanyName,
		 Discontinued
FROM     Suppliers,
		 Products
WHERE    Discontinued = 0
ORDER BY ProductID

--8. Show the number of products by supplier.

SELECT   CompanyName,
		 COUNT(ProductID) AS [Number of Products]
FROM     Suppliers,
		 Products
GROUP BY CompanyName

--9. Show the Supplier CompanyName, and the minimum, average, and maximum unitprice of products from each supplier.

SELECT   CompanyName,
		 MIN(UnitPrice) AS [MIN $],
		 MAX(UnitPrice) AS [MAX $],
		 AVG(UnitPrice) AS [AVG $]
FROM     Suppliers,
		 Products
GROUP BY CompanyName


--10. Show the CategoryName, ProductName, and Supplier CompanyName for every product. This is a 3-table join - don't panic! It should look something like this:

SELECT   ProductID,
		 CategoryName,
	     ProductName,
		 CompanyName
FROM    Categories
   JOIN Products   ON Categories.CategoryID = Products.CategoryID
   JOIN Suppliers  ON Suppliers.SupplierID  = Products.SupplierID
ORDER BY ProductID
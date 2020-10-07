--Michael Krummenacker MIS 315 Project 14

--1. Select the ProductID, ProductName, and one more column. The last column should be titled "InStock/OnOrder". The contents should be a varchar that has the unitsinstock, then a forward slash, then the unitsOnOrder. So it should look like this: 32/10

SELECT    ProductID,
		  ProductName,
		  ISNULL([UnitsInStock] / NULLIF([UnitsOnOrder], 0),0) AS [InStock/OnOrder]
FROM      Products

--2. Select the productID, productname, and one more column. Only show products whose unitsInStock are below their reorderlevel. The last column should be titled "Amount to Order". The number in the columns should be the number of units to bring the UnitsInstock up to 2 times the reorderlevel. So if the UnitsInStock is 8, and the reorderLevel is 20, then the Amount to order would be 32. In other words: (20 * 2) - 8.

SELECT   ProductID,
		 ProductName,
		 (ReorderLevel * 2) - UnitsInStock AS [Amount to Order]
FROM    Products

--3. Select the ProductID, ProductName, and the location of the first space in the productName. Use the CHARINDEX (Links to an external site.) function.
SELECT  ProductID,
		ProductName,
		CHARINDEX(' ', ProductName) AS [FirstSpace]
FROM    Products

--4. Show the ProductName, then a column that has the productID and CategoryID concatenated together like this: 18(2).

SELECT   ProductName,
		 (ProductID + CategoryID) AS [Concatenated]
FROM     Products

--5. Our new system cannot handle the hyphens in the QuantityPerUnit field, so we need to replace all hyphens in this field with the lower case x. Show the ProductID in the first column, the current QuantityPerUnit, and the new QuantityPerUnit with all hyphens replaced with an x. Use the REPLACE (Links to an external site.) function.

SELECT    ProductID,
		  QuantityPerUnit,
		  REPLACE (QuantityPerUnit, '-' , 'x') AS [New QuantityPerUnit]
FROM      Products

--6. Our new system cannot handle Unicode (Links to an external site.) characters, only ASCII (Links to an external site.) characters. The current Productname data type is NVARCHAR, which is unicode, and might have non-ASCII characters in it. We need to check! Show the ProductID, and ProductName, and the first location of any non-Unicode characters. See the note at the bottom for how to find non-Unicode characters. 

SELECT ProductID,
       ProductName,
       CONVERT(VARCHAR,ProductName), -- any unicode characters converted to ?
       CHARINDEX('?',CONVERT(VARCHAR,ProductName)) -- find ?
FROM   Products


--7. It's going to be made up of the CategoryID, the SupplierID, and the ProductID with hyphens between them, something like this: 2-12-77. Use the CONCAT_WS (Links to an external site.) function to do this. Show the CategoryID, the SupplierID, the ProductID, and the new ProductCode column.

SELECT   CONCAT_WS ( '-', CategoryID, SupplierID, ProductID) AS [Concat]
FROM     Products

--8. Our invoices can only show 20 characters for the Product. We'd like this to be made up of the left-most 15 characters of the ProductName, then a forward slash, then the leftmost 4 characters of the QuantityPerUnit. Use the LEFT (Links to an external site.) function to help out. 
--Show the ProductID, ProductName, QuantityPerUnit, and the new column, named ProductDescription.

SELECT    ProductID,
		  ProductName,
		  QuantityPerUnit,
		  LEFT ( ProductName , 15 ) + LEFT (QuantityPerUnit, 4) AS [ProductDescription] 
FROM      Products

--9. Oops, we messed up the logic on question #2 above. We might already have some units on order! Re-do #2. Only show products where the (UnitsInStock+UnitsOnOrder) is less than the ReorderLevel. For these products, calculate the Amount to order as (2*ReorderLevel) - (UnitsInStock+UnitsOnOrder).

SELECT   ProductID,
		 ProductName,
		 (2*ReorderLevel) - (UnitsInStock+UnitsOnOrder) AS [Amount to Order]
FROM    Products
WHERE   (UnitsInStock+UnitsOnOrder) < ReorderLevel

--10.Our new system cannot handle Unicode characters in the ProductName or QuantityPerUnit columns. Use the CONVERT function to show the ProductID, then the current ProductName, then the ProductName converted from to VARCHAR. Do the same for QuantityPerUnit.

SELECT ProductID,
       ProductName,
       CONVERT(VARCHAR,ProductName), -- any unicode characters converted to ?
       CHARINDEX('?',CONVERT(VARCHAR,ProductName)), -- find ?
	   CONVERT(VARCHAR,QuantityPerUnit), -- any unicode characters converted to ?
       CHARINDEX('?',CONVERT(VARCHAR,QuantityPerUnit))
FROM   Products
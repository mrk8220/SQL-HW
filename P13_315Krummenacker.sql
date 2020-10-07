--Michael Krummenacker MIS315 Project 13

--Show each productname, then the ROW_NUMBER, RANK, DENSE_RANK and NTILE(4) based on unitprice.
SELECT    ProductName,
		  ROW_NUMBER() OVER (ORDER BY UnitPrice) AS [ROW NUMBER],
		  RANK() OVER (ORDER BY UnitPrice) AS [Rank],
		  DENSE_RANK() OVER (ORDER BY UnitPrice) AS [DENSE RANK],
		  NTILE(4) OVER (ORDER BY UnitPrice) AS [NTILE]
FROM      Products
--Show a list of products, their unit price, and their ROW_NUMBER() based on unitprice, ASC. Order the records based on productname.

SELECT    ProductName,
		  ROW_NUMBER() OVER (ORDER BY UnitPrice ASC) AS [ROW NUMBER]
FROM      Products
ORDER BY  ProductName

--Show a list of products, their unit price, and their DENSE_RANK() based on unitprice, ASC. Order the records based on productname.

SELECT    ProductName,
		  UnitPrice,
		  DENSE_RANK() OVER (ORDER BY UnitPrice ASC) AS [Dense_Rank]
FROM      Products
ORDER BY  ProductName

--Show a list of products, their unitsinstock, and their RANK() based on unitsinstock, ASC. Order the records based on productname.

SELECT    ProductName,
		  UnitsInStock,
		  RANK() OVER (ORDER BY UnitsInStock ASC) AS [Rank]
FROM      Products
ORDER BY  ProductName

--Show a list of products, their inventory value (unitsInStock*unitprice), and their RANK() based on inventory value, highest to lowest. Order the records by inventory value.

SELECT    ProductName,
		  UnitsInStock * UnitPrice AS [Inventory Value],
		  RANK() OVER (ORDER BY UnitsInStock * UnitPrice DESC) AS [Rank]
FROM      Products
ORDER BY  UnitsInStock * UnitPrice

--Show a list of products, categoryID, and their unitprice. Also show their dense rank within their category based on unitprice highest to lowest. Order by CategoryID, then unitprice desc.

SELECT    ProductName,
		  CategoryID,
		  Unitprice,
		  DENSE_RANK() OVER (ORDER BY UnitPrice DESC) AS [DENSE RANK]
FROM      Products
ORDER BY  CategoryID DESC,
		  UnitPrice  DESC


--Show a list of products, supplierID, and unitprice. Also show their ROW_NUMBER compared to other products from the same supplier, based on unitprice highest to lowest. order by SupplierID, then unitprice desc.

SELECT   ProductName,
	     SupplierID,
		 UnitPrice,
		 ROW_NUMBER() OVER (ORDER BY UnitPrice DESC) AS [Row Number]
FROM     Products
ORDER BY SupplierID DESC,
		 UnitPrice DESC

--Rank (NTILE()) all products by inventory value: 1 = high $ in inventory, 2=medium $ in inventory, 3=low $ in inventory. Order by RANK(), then by productname.

SELECT   ProductName,
		 UnitsInStock * UnitPrice AS [Inventory Value],
		 NTILE(3) OVER (ORDER BY UnitsInStock * UnitPrice) AS [NTILE]
FROM     Products
ORDER BY RANK() OVER (ORDER BY UnitsInStock * UnitPrice),
		 ProductName

--Show each OrderID, the freight, and the RANK() for each order based on freight.

SELECT   OrderID,
		 Freight,
		 RANK() OVER (ORDER BY Freight) AS [Rank]
FROM     Orders


--Show each OrderID, the shipper, the freight, and the RANK() for each order based on freight compared to the same shipper.

SELECT   OrderID,
		 Shippers.CompanyName,
		 RANK() OVER (ORDER BY Freight) AS [Rank]
FROM     Orders,
		 Shippers
--Michael Krummenacker MIS315 Project 10 Outer Joins

--1.Show the company name and city of all suppliers that supply us products (INNER JOIN, DISTINCT).
SELECT DISTINCT   CompanyName,
           City
FROM       Products
     INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID


--2.Show the Supplier company name and a count of how many products they supply us. Only include suppliers that supply us products (INNER JOIN, GROUP BY). In other words, there should be no counts of zero.

SELECT    CompanyName,
          Count(ProductID) AS [# of Products]
FROM      Products
     INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
GROUP BY  CompanyName,
          City

--3. Show the Supplier company name and a count of how many products they supply us. Include suppliers that don't supply us products (LEFTJOIN, GROUP BY). In other words, there may be counts of zero.

SELECT    CompanyName,
          Count(ProductID) AS [# of Products]
FROM      Suppliers
     LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY  CompanyName,
          City

--4. Show the company name and city of all suppliers that DO NOT supply us products. (LEFT JOIN, WHERE IS NULL).

SELECT    CompanyName
FROM      Suppliers
     LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE     Products.ProductID IS NULL
GROUP BY  CompanyName


--5. Show the category ID and name of categories that have products in them (INNER JOIN, DISTINCT).

SELECT  DISTINCT  Categories.CategoryID,
          CategoryName
FROM      Categories
          INNER JOIN Products ON Products.CategoryID = Categories.CategoryID

--6. Show the category name and a count of how many products in the category. Only include categories that have products (INNER JOIN, GROUP BY). In other words, there should be no counts of zero.

SELECT    CategoryName,
          COUNT(ProductID) AS [# of Products]
FROM      Categories
          INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
GROUP BY  CategoryName


--7. Show the category name and a count of how many products in the category. Include categories that don't have products (LEFTJOIN, GROUP BY). In other words, there may be counts of zero.

SELECT    CategoryName,
          COUNT(ProductID) AS [# of Products]
FROM      Categories
          LEFT JOIN Products ON Products.CategoryID = Categories.CategoryID
GROUP BY  CategoryName

--8. Show the categoryID and name of all categories that do not have products in them. (LEFT JOIN, WHERE IS NULL).

SELECT    CategoryName
FROM      Categories
          LEFT JOIN Products ON Products.CategoryID = Categories.CategoryID
WHERE     Products.ProductID IS NULL
GROUP BY  CategoryName

--9. Show the product name and unit price of all products that have appeared on an order (INNER JOIN, DISTINCT).

SELECT DISTINCT ProductName,
                Products.UnitPrice
FROM            Products
                INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID 
                INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID

--10. Show the product name and a count of how many orders a product has been on. Only include products that have been on an order. (INNER JOIN, GROUP BY). In other words, there should be no counts of zero.

SELECT          ProductName,
                COUNT(Orders.OrderID) AS [Orders]
FROM            Products
                INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID 
                INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY        ProductName

--11. Show the product name and a count of how many orders a product has been on. Include products that have not been on an order. (LEFT JOIN, GROUP BY.) In other words, there may be counts of zero.

SELECT          ProductName,
                COUNT(Orders.OrderID) AS [Orders]
FROM            Products
                LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID 
                LEFT JOIN Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY        ProductName

--12. Show the product name and unitprice of all products that have not been on an order (LEFT JOIN, WHERE IS NULL).

SELECT          ProductName
FROM            Products
                LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID 
                LEFT JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE           Orders.OrderID IS NULL
GROUP BY        ProductName

-- The code for the next four is very similar, but the results are different.

--13. Show the order ID and orderdate of all orders that have associated order detail records. In other words, these are orders than have lines/products on them. (INNER JOIN, DISTINCT).

SELECT DISTINCT Orders.OrderID,
                Orders.OrderDate
FROM            Orders
                INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
                INNER JOIN Products ON [Order Details].ProductID = Products.ProductID

--14. Show the order ID and a count of how many products/lines/orderdetailsrecords are on the order. Only include orders that have at least on line on them. (INNER JOIN, GROUP BY). In other words, there should be no counts of zero.

SELECT          Orders.OrderID,
                COUNT(Products.ProductID) AS [# of Products]
FROM            Orders
                INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
                INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY        Orders.OrderID

--15. Show the order ID and a count of how many products/lines/orderdetailsrecords are on the order. Include any orders that have no products on them. (LEFT JOIN, GROUP BY.) In other words, there may be counts of zero. There shouldn't be, if our system is written well, but there might be. This is an example of a data cleansing operation - all our orders should have products on them. If they don't there's a problem.

SELECT          Orders.OrderID,
                COUNT(Products.ProductID) AS [# of Products]
FROM            Orders
                LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
                LEFT JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY        Orders.OrderID

--16. Show the orderID and orderdate of all orders that have no products on them. (LEFT JOIN, WHERE IS NULL). There should be no orders like this, if our data is good. If there are, these would be called "widow" records, and it indicates there is a problem with the data.

SELECT          Orders.OrderID
FROM            Orders
                LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
                LEFT JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE           Products.ProductID IS NULL
GROUP BY        Orders.OrderID
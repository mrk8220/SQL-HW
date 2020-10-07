--Micahel Krummenacker MIS 315 Project 11

--1. Give a list of Categories with no products.

SELECT   Categories.CategoryName
FROM     Categories LEFT JOIN 
		 Products ON Products.CategoryID = Categories.CategoryID
WHERE    Products.ProductID = NULL

--2. Give a list of Categories and the number of products in each category. Include every category, even those without products in them.

SELECT Categories.CategoryName,
	   COUNT(Products.ProductID)
FROM   Categories
		INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName

--3. Give a list of shippers that have never been used.

SELECT         Shippers.CompanyName
FROM           Shippers
   LEFT JOIN   Orders ON Shippers.ShipperID = Orders.ShipVia
GROUP BY       Shippers.CompanyName
HAVING         COUNT(Orders.OrderID) = 0
ORDER BY       Shippers.CompanyName

--4. Give a list of shippers and the number of orders that they have shipped. Include every shipper, even those who haven't shipped any orders.

SELECT         Shippers.CompanyName,
               COUNT(Orders.OrderID) AS [Num of Orders]
FROM           Shippers
   LEFT JOIN   Orders ON Shippers.ShipperID = Orders.ShipVia
GROUP BY       Shippers.CompanyName
ORDER BY       Shippers.CompanyName

--5. Give a list of products that have not been on any orders.

SELECT   Products.ProductName
FROM     Products
    INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
	INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE   Orders.OrderID = NULL
GROUP BY Products.ProductName


--6. Give a list of products and how many orders they have been on. Include every product, even those that have never appeared on an order.

SELECT          ProductName,
                COUNT(Orders.OrderID) AS [Orders]
FROM            Products
                INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID 
                INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY        ProductName

--7. Give a list of Customers who have never placed an order.

SELECT    CompanyName
FROM      Customers
     LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE     Customers.CustomerID IS NULL
GROUP BY  CompanyName

--8. Give a list of Customers and how many orders they have placed. Include every customer.

SELECT    CompanyName,
		  COUNT(OrderID)
FROM      Customers
     INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY  CompanyName

--9. Give a list of every product. Include the Supplier's company name, where available.

SELECT  ProductName,
		CompanyName
FROM      Products
     INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY ProductName,
		 CompanyName


--10.Give a list of every order. Include the Shipper's company name where available.

SELECT         Orders.OrderID,
               Shippers.CompanyName
FROM           Orders
   LEFT JOIN   Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY       Orders.OrderID,
               Shippers.CompanyName
ORDER BY       Orders.OrderID,
               Shippers.CompanyName
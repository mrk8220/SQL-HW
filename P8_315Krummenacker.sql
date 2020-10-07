--Michael Krummenacker MIS315 Project 8

--1.Show the categoryName of all categories with products that have an average unitprice under $25.

SELECT   Categories.CategoryName
FROM     Categories 
    JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
HAVING   AVG(Products.UnitPrice) < 25

--2.Show the Supplier company name of all suppliers who supply us fewer than 3 products.

SELECT   Suppliers.CompanyName
FROM     Suppliers
   JOIN  Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
HAVING   COUNT(Products.ProductID) < 3
ORDER BY Suppliers.CompanyName

--3.Show the supplier company name of all suppliers who supply us fewer than 3 products priced above $6.

SELECT   Suppliers.CompanyName
FROM     Suppliers
   JOIN  Products ON Suppliers.SupplierID = Products.SupplierID
WHERE    Products.UnitPrice > 6
GROUP BY Suppliers.CompanyName
HAVING   COUNT(Products.ProductID) < 3 
ORDER BY Suppliers.CompanyName

--4.Show the categoryName of all categories whose number of products is more than 5.

SELECT   Categories.CategoryName
FROM     Categories
   JOIN  Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
HAVING   COUNT(Products.ProductID) > 5
ORDER BY Categories.CategoryName

--5.Show the OrderID and CustomerID of all orders with more than one product on the order.

SELECT   Orders.OrderID,
         Customers.CustomerID
FROM     Orders
    JOIN Customers ON Orders.CustomerID = Customers.CustomerID
    JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY Orders.OrderID,
         Customers.CustomerID
HAVING   COUNT([Order Details].ProductID) > 1
ORDER BY Orders.OrderID

--6.Show the OrderID and CustomerID of all orders that total more than $5000. (Do not include Freight in the total, but factor in the discount.)

SELECT   Orders.OrderID,
         Customers.CustomerID
FROM     Orders
    JOIN Customers ON Orders.CustomerID = Customers.CustomerID
    JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY Orders.OrderID,
         Customers.CustomerID
HAVING   SUM(([Order Details].Quantity * [Order Details].UnitPrice) * (1.0 - [Order Details].Discount)) > 5000
ORDER BY Orders.OrderID

--7.Show the productName of any products for which we hold more than $3000 in inventory.

SELECT   ProductName,
         SUM(UnitsInStock*UnitPrice) AS [Inventory $]
FROM     Products
GROUP BY ProductName
HAVING    SUM(UnitsInStock*UnitPrice) > 3000

--8.Show the productName of any products which have more than $30,000 in sales in the year 1997.

SELECT   Products.ProductName
FROM     [Order Details]
  JOIN   Products ON Products.ProductID = [Order Details].ProductID
  JOIN   Orders   ON Orders.OrderID =[Order Details].OrderID
WHERE    YEAR(Orders.OrderDate) = 1997
GROUP BY Products.ProductName
HAVING   SUM([Order Details].Quantity * [Order Details].UnitPrice) > 30000
ORDER BY Products.ProductName

--9.Show the year and month of any month where our revenue exceeded $10K. Don't include Freight in the revenue. Factor in the discount.

SELECT   YEAR(OrderDate),
		 MONTH(OrderDate)
FROM     Orders 
 JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY OrderDate
HAVING   SUM(([Order Details].Quantity * [Order Details].UnitPrice) * (1.0 - [Order Details].Discount)) > 10000
ORDER BY OrderDate


--10.Do number 9 again, but do not include shipcities of Berlin, Barcelone, Helsinki, and Cork.

SELECT   YEAR(OrderDate),
		 MONTH(OrderDate)
FROM     Orders 
 JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE    ShipCity NOT IN ('Berlin','Barcelone','Helsinki','Cork')
GROUP BY OrderDate
HAVING   SUM(([Order Details].Quantity * [Order Details].UnitPrice) * (1.0 - [Order Details].Discount)) > 10000
ORDER BY OrderDate

--Michael Krummenacker MIS315 Project 7

--1. Show the ProductID, ProductName, and all the OrderIDs for orders each product has been on. Also show the quantity on each order. (This requires a join of Products and Order details. No need to join in Orders. Note that [Order Details] has a space in the name, so you need to use square brackets.)

SELECT   Products.ProductID,
         ProductName,
         Orders.OrderID,
         Quantity
FROM     Products
    JOIN [Order Details]    ON Products.ProductID = [Order Details].ProductID,
         Orders

--2. Show the OrderID, OrderDate, and all the ProductIDs for products each order has on it. Also show the quantity of each product. (This requires a join of Orders and [Order Details]. No need to join in Products.)

SELECT   Orders.OrderID,
         OrderDate,
         Products.ProductID,
         Quantity
FROM     Orders
    JOIN [Order Details]    ON Orders.OrderID = [Order Details].OrderID,
         Products

--3. Show the ProductID, ProductName, and the total number of units of that product sold for the year 1997.

SELECT   Products.ProductID,
         ProductName,
         SUM([Order Details].Quantity) AS [# of units sold]
FROM     Products,
         [Order Details],
         Orders
WHERE    OrderDate > '19970101' AND
         OrderDate < '19980101' 
GROUP BY Products.ProductID,
         ProductName

--4. Show the ProductID, ProductName, and the minimum and maximum unit price the product was sold for in the year 1997. Use [Order Details].unitprice for the minimum and maximum price.

SELECT   Products.ProductID,
         ProductName,
         MIN(Products.UnitPrice) AS [Min Price],
         MAX(Products.UnitPrice) AS [Max Price]
FROM     Products
    JOIN [Order Details]    ON Products.UnitPrice = [Order Details].UnitPrice,
         Orders
WHERE    OrderDate > '19970101' AND
         OrderDate < '19980101' 
GROUP BY Products.ProductID,
         ProductName
ORDER BY ProductID

--5. Show the OrderID, CustomerID, OrderDate, and a count of the number of different products on the order. 

SELECT   Orders.OrderID,
		 CustomerID,
		 OrderDate,
		 COUNT(Products.ProductID)
FROM	 Products,
		 Orders,
		 [Order Details]
WHERE    Products.ProductID = [Order Details].ProductID
GROUP BY Orders.OrderID,
		 CustomerID,
		 OrderDate

--6. Show the ProductID, ProductName, and a count of the number of orders that this product has appeared on.

SELECT   Products.ProductID,
		 ProductName,
		 COUNT(Orders.OrderID) AS [# Of Orders]
FROM	 Products,
		 Orders,
		 [Order Details]
WHERE    Products.ProductID = [Order Details].ProductID
GROUP BY Products.ProductID,
		 ProductName

--7. Show the OrderID, CustomerID, OrderDate, and the total amount due for each order. (sum up the unitprice*quantity*(1-discount)). Do not worry about Freight. 

SELECT   Orders.OrderID,
		 CustomerID,
		 OrderDate,
		 SUM(Products.UnitPrice*quantity*(1-discount)) AS [Total Amount Due]
FROM	 Products,
		 Orders,
		 [Order Details]
WHERE    Orders.OrderID = [Order Details].OrderID AND
		 Products.UnitPrice = [Order Details].UnitPrice
GROUP BY Orders.OrderID,
         CustomerID,
		 OrderDate

--8. Do #7 again, but only include orders in 1997.

SELECT   Orders.OrderID,
		 CustomerID,
		 OrderDate,
		 SUM(Products.UnitPrice*quantity*(1-discount)) AS [Total Amount Due]
FROM	 Products,
		 Orders,
		 [Order Details]
WHERE    Orders.OrderID = [Order Details].OrderID AND
		 Products.UnitPrice = [Order Details].UnitPrice AND
		 OrderDate > '19970101' AND
		 OrderDate <'19980101'
GROUP BY Orders.OrderID,
         CustomerID,
		 OrderDate

--9. Show the ProductID, ProductName, and the total revenues for each product during 1997. This is very similar to #7, but grouped differently.

SELECT   Products.ProductID,
		 ProductName,
		 SUM(Freight)
FROM	 Products,
		 Orders,
		 [Order Details]
WHERE    Products.ProductID = [Order Details].ProductID AND
		 OrderDate > '19970101' AND
		 OrderDate <'19980101'
GROUP BY Products.ProductID,
		 ProductName

--10. Show each OrderID, OrderDate, the ProductID, ProductName, and price it was sold for, for every product on every order. You must join all three tables to do this. 
SELECT   Orders.OrderID,
	     OrderDate,
	     Products.ProductID,
	     ProductName,
	     Products.UnitPrice
FROM	 Products,
		 Orders,
		 [Order Details]
WHERE    Orders.OrderId = [Order Details].OrderID AND
		 Products.ProductId = [Order Details].ProductID AND 
		 Products.UnitPrice = [Order Details].UnitPrice


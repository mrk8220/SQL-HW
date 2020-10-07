--Michael Krummenacker MIS 315 Project 16

--1. Give all details (use *) about the product with the lowest unit price. (Use unitprice from the products table).

SELECT   *
FROM     Products
WHERE    unitPrice <= (SELECT MIN(UnitPrice)
					  FROM Products)

--2. Give all details about all below average price products( Use unitprice from the products table).

SELECT *
FROM  Products
WHERE   UnitPrice < (SELECT AVG(UnitPrice)
					 FROM Products)

--3. Give all details about the order with the highest freight.

SELECT *
FROM   Orders
WHERE  Freight >= (SELECT MAX(Freight)
					FROM Orders)

--4. Give all details about orders with above average freight costs.

SELECT  *
FROM   Orders
WHERE  Freight > (SELECT AVG(Freight)
				  FROM Orders)

--5. Give all details about the product(s) with the minimum reorderlevel.

SELECT  *
FROM    Products
WHERE   ReorderLevel <= (SELECT  MIN(ReorderLevel)
						 FROM  Products)

--6. Give all details about products with below average reorderlevels.

SELECT  *
FROM    Products
WHERE   ReorderLevel < (SELECT  AVG(ReorderLevel)
						 FROM  Products)

--7. Give all details about the product with the most units in stock.

SELECT  *
FROM    Products
WHERE   UnitsInStock >= (SELECT MAX(UnitsInStock)
						 FROM Products)

--8. Give all details about the products with above average units in stock.

SELECT  *
FROM    Products
WHERE   UnitsInStock > (SELECT AVG(UnitsInStock)
						 FROM Products)

--9. Give all details about the product with the highest total dollar value in inventory.

SELECT  *
FROM    Products
WHERE   (UnitsInStock*UnitPrice) >= (SELECT  MAX(UnitPrice) * MAX(UnitsInStock)
									FROM Products)

--10. Give all details about products with above average dollar value in inventory.

SELECT  *
FROM    Products
WHERE   (UnitsInStock*UnitPrice) > (SELECT  AVG(UnitPrice) * AVG(UnitsInStock)
									FROM Products)
#Q2 - 1
#ANS: 54
SELECT ShipperName, COUNT(O.ShipperID)
FROM Orders O
INNER JOIN Shippers S ON O.ShipperID = S.ShipperID 
WHERE S.ShipperName = "Speedy Express"
GROUP BY S.ShipperName;

SELECT TOP 1 E.LastName FROM Employees E
INNER JOIN Orders O on O.EmployeeID = E.EmployeeID
Group by E.LastName
Order by COUNT(O.EmployeeID) DESC;

Select TOP 1 Products.ProductName, Customers.Country, COUNT(Orders.OrderID) AS Tot_Orders FROM 
(((Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID)
INNER JOIN OrderDetails ON Orders.OrderID = Orderdetails.OrderID)
INNER JOIN Products ON Orderdetails.ProductID = Products.ProductID)
WHERE Country = 'Germany'
GROUP BY ProductName, Country
ORDER BY COUNT(Orders.orderID) DESC;
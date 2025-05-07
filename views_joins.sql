USE LittleLemonDB;

CREATE VIEW OrdersView AS
    SELECT O.OrderID, O.Quantity, O.TotalCost
    FROM LittleLemonDB.Orders AS O
    WHERE O.Quantity > 2;

SELECT * FROM OrdersView;

SELECT C.CustomerID, C.Name, O.OrderID, O.TotalCost
FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
WHERE O.TotalCost > 50;

SELECT m.ItemName
FROM Menu AS m
WHERE m.MenuID = ANY (
    SELECT MenuID
    FROM OrdersMenu
    GROUP BY MenuID
    HAVING SUM(Quantity) > 2
);

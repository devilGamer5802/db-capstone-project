USE LittleLemonDB;
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS 'Get Max Quantity'
        FROM Orders;
end;

CALL GetMaxQuantity();

PREPARE GetOrderDetail FROM
    'SELECT OrderID, Quantity, TotalCost
        FROM Orders
        WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders
           WHERE CancelOrder.order_id = Orders.OrderID;
end;

CALL CancelOrder(3);
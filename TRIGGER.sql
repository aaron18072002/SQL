-- Trigger khi insert sẽ chuyển productName về viết hoa toàn bộ:

CREATE TRIGGER MakeProductNameUpperCase
ON [dbo].[Products]
AFTER INSERT
AS
BEGIN 
	UPDATE [dbo].[Products]
	SET ProductName = UPPER(i.ProductName)
	FROM inserted AS i
	WHERE [dbo].[Products].ProductName = i.ProductName
END

INSERT INTO [dbo].[Products]
	([ProductName], [SupplierID], [CategoryID])
VALUES ('test name', 1, 1)

-- Chặn không cho phép cập nhật [UnitsInStock] sản phẩm nhỏ hơn 0

CREATE TRIGGER PreventNegativeUnitsInStock
ON [dbo].[Products]
AFTER UPDATE 
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted AS i WHERE i.UnitsInStock < 0)
	BEGIN 
		ROLLBACK;
		RAISERROR ('[UnitsInStock] không được bé hơn 0', 16, 1); 
	END
END

UPDATE [dbo].[Products]
SET [UnitsInStock] = -1
WHERE ProductID = 78

-- Viết một trigger trong cơ sở dữ liệu Northwind để đảm bảo 
-- rằng mỗi khi có một chi tiết đơn hàng mới được thêm vào, số lượng tồn kho phải được giảm đi

CREATE TRIGGER UpdateProductInventory
ON [dbo].[Order Details]
AFTER INSERT
AS 
BEGIN
	UPDATE [dbo].[Products]
	SET [UnitsInStock] = [UnitsInStock] - (SELECT i.Quantity FROM inserted as i WHERE i.ProductID = [ProductId])
	WHERE [ProductID] IN (SELECT [ProductID] FROM inserted AS i)
END 

-- Bài tập
-- Bài tập 1: Bổ sung thêm cột LastModified và tạo một trigger để sau khi một sản phẩm được thêm 
-- hoặc cập nhật vào bảng "Products" tự động cập nhật trường "LastModified" 
-- với ngày và giờ hiện tại.

CREATE TRIGGER UpdateLastMofidied
ON [dbo].[Products]
AFTER UPDATE, INSERT
AS
BEGIN
	UPDATE [dbo].[Products]
	SET [LastModified] = GETDATE()
	WHERE [ProductID] = (SELECT [ProductId] FROM inserted)
END

-- Bài tập 2: Tạo một trigger "INSTEAD OF DELETE" để kiểm tra xem khách hàng có đơn hàng 
-- (Orders) không. Nếu có, trigger không cho phép xóa khách hàng. 
-- Nếu không có đơn hàng liên quan, trigger thực hiện xóa khách hàng.

CREATE TRIGGER PreventDeleteCustomerHaveOrders
ON [dbo].[Customers]
AFTER DELETE
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [dbo].[Orders] AS O WHERE O.CustomerID LIKE (SELECT [CustomerID] FROM deleted))
		BEGIN
			ROLLBACK;
			RAISERROR ('Không được xóa khách hàng đang có orders', 16, 1); 
		END
	ELSE 
		BEGIN
			DELETE [dbo].[Customers]
			WHERE [CustomerID] LIKE (SELECT [CustomerID] FROM deleted)
		END
END

DELETE [dbo].[Customers]
WHERE [CustomerID] LIKE 'VINET'

-- Bài tập 3: Tạo một trigger trong cơ sở dữ liệu Northwind để kiểm tra và không cho phép đặt hàng 
-- (Order) với số lượng sản phẩm lớn hơn số lượng tồn kho. 

CREATE TRIGGER PreventOrderIfStockLessThanOrder
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN
	IF EXISTS (SELECT 1
		FROM inserted AS i
		INNER JOIN [dbo].[Products] AS P
		ON i.ProductID = P.ProductID
		WHERE P.UnitsInStock < i.Quantity)
	BEGIN 
		ROLLBACK;
		RAISERROR ('Không đủ số lượng hàng', 16, 1);
	END
END
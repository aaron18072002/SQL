-- T?o m?t stored procedure ?? l?y thông tin 
-- về sản ph?m d?a trên tên s?n ph?m ???c cung c?p.

--CREATE PROCEDURE GetProductByName
--	(@ProductName VARCHAR(100))
--AS
--BEGIN
--	SELECT *
--	FROM [dbo].[Products] AS P
--	WHERE P.ProductName LIKE @ProductName
--END

--EXEC GetProductByName @ProductName = 'Chai'

-- T?o m?t stored procedure tính tổng doanh số bán hàng
-- c?a m?t nhân viên d?a trên EmployeeID.

--CREATE PROCEDURE GetTotalSalesByEmployeeId
--	(@EmployeeId INT)
--AS 
--BEGIN
--	SELECT O.EmployeeID, SUM(Temp.TotalPrice) AS [TotalSales]
--	FROM [dbo].[Orders] AS O
--	INNER JOIN (
--		SELECT OD.OrderID, 
--			   SUM(OD.Quantity*OD.UnitPrice) AS [TotalPrice]
--		FROM [dbo].[Order Details] AS OD
--		GROUP BY OD.OrderID
--	) AS Temp
--	ON O.OrderID = Temp.OrderID
--	WHERE O.EmployeeID = @EmployeeId
--	GROUP BY O.EmployeeID
--END

--EXEC GetTotalSalesByEmployeeId @EmployeeId = 1

-- T?o m?t stored procedure để thêm mới khách hàng vào bảng Customers.

--CREATE PROCEDURE AddCustomer
--	(@CustomerId NCHAR(5), @CompanyName NVARCHAR(40),
--	 @ContactName NVARCHAR(30), @ContactTitle NVARCHAR(30))
--AS
--BEGIN
--	INSERT INTO [dbo].[Customers] 
--		([CustomerID], [CompanyName], [ContactName], [ContactTitle])
--	VALUES (@CustomerId, UPPER(@CompanyName), @ContactName, @ContactTitle)
--END

--EXEC AddCustomer @CustomerId = 'ANH02', @CompanyName = 'that nghiep',
--				 @ContactName = 'NEMO', @ContactTitle = 'Backend Developer'

--DROP PROCEDURE IF EXISTS AddCustomer

-- Tạo một stored procedure để cập nhật giá
-- cho một sản phẩm cụ thể

CREATE PROCEDURE UpdateProductPriceByProductId
	(@ProductId INT, @UnitPrice DECIMAL(10,2))
AS
BEGIN
	UPDATE [dbo].[Products]
	SET UnitPrice = @UnitPrice
	WHERE ProductID = @ProductId
END

EXEC UpdateProductPriceByProductId @ProductId = 1, @UnitPrice = 20.00

--Bài tập

-- 1. Viết một Stored Procedure để truy xuất danh sách các đơn đặt hàng 
-- cho một khách hàng dựa trên tên khách hàng. Tham số đầu vào là tên khách hàng, 
-- và Stored Procedure sẽ trả về danh sách các đơn đặt hàng liên quan.

CREATE PROCEDURE GetOrdersByCustomerName
	(@CustomerName NVARCHAR(30))
AS
BEGIN
	SELECT O.*, C.ContactName, OD.ProductID, OD.Quantity, OD.UnitPrice
	FROM [dbo].[Orders] AS O
	INNER JOIN [dbo].[Order Details] AS OD
	ON O.OrderID = OD.OrderID
	INNER JOIN [dbo].[Customers] AS C
	ON O.CustomerID = C.CustomerID
	WHERE C.ContactName = @CustomerName
END

EXEC GetOrdersByCustomerName @CustomerName = 'Paul Henriot'

--2. Viết một Stored Procedure để cập nhật số lượng hàng tồn kho cho một sản phẩm cụ thể dựa trên ID sản phẩm và số lượng mới. Stored Procedure này sẽ nhận vào ID sản phẩm và số lượng mới, sau đó cập nhật số lượng tồn kho trong bảng Products.


--3. Viết một Stored Procedure để truy xuất danh sách các sản phẩm thuộc một danh mục cụ thể 
-- và giới hạn số lượng sản phẩm trả về. Tham số đầu vào bao gồm ID danh mục 
--và số lượng sản phẩm cần trả về.

CREATE PROCEDURE GetProductsByCategoryId
	(@CategoryId INT, @Limit INT)
AS
BEGIN
	SELECT TOP(@Limit) *
	FROM [dbo].[Products] AS P
	WHERE P.CategoryID = @CategoryId
END

EXEC GetProductsByCategoryId @CategoryId = 1, @Limit = 5

--4. Viết một Stored Procedure để truy xuất danh sách khách hàng dựa trên khu vực địa lý (Region) hoặc quốc gia (Country) của họ. Tham số đầu vào sẽ là khu vực địa lý hoặc quốc gia và Stored Procedure sẽ trả về danh sách các khách hàng trong khu vực đó.
-- Tao table ao

SELECT * 
INTO Customer_1
FROM [dbo].[Customers]

-- Xóa đi khách hàng 'ALFKI'

DELETE FROM [dbo].[Customer_1] 
WHERE [CustomerID] LIKE 'ALFKI'

-- Xóa đi toàn bộ khách hàng có quốc gia
-- bắt đầu bằng 'U'

DELETE FROM [dbo].[Customer_1]
WHERE [Country] LIKE 'U%'

-- Xóa sạch 1 bảng

DELETE FROM [dbo].[Customer_1]

DROP TABLE [dbo].[Customer_1]

-- • Từ cơ sở dữ liệu NORTHWIND Sử dụng SELECT INTO để tạo ra bảng tạm thời trước khi thực hành câu lệnh DELETE

SELECT *
INTO Order_1
FROM [dbo].[Orders]

SELECT *
INTO Products_1
FROM [dbo].[Products]

DROP TABLE Order_1
DROP TABLE Products_1

-- 1. Trong cơ sở dữ liệu NorthWind, làm thế nào để viết một câu lệnh DELETE để xóa một đơn đặt hàng cụ t
-- hể dựa trên OrderID? Ví dụ: Xóa đơn đặt hàng có OrderID là 10248.

DELETE FROM [dbo].[Order_1]
WHERE [OrderID] = 10248

-- 2. Xóa tất cả sản phẩm từ bảng Products có số lượng tồn kho (UnitsInStock) bằng 0

DELETE FROM [dbo].[Products_1]
WHERE UnitsInStock = 0

-- 3. Xóa tất cả đơn hàng và chi tiết đặt hàng liên quan đến một khách hàng cụ thể dựa trên CustomerID

DECLARE @CustomerId NCHAR(5)
SET @CustomerId = 'ALFKI'

DELETE FROM [dbo].[Order Details]
WHERE [OrderID] IN (
	SELECT O.OrderID
	FROM [Orders] AS O
	WHERE O.CustomerID = @CustomerId
)

DELETE FROM [dbo].[Orders]
WHERE [CustomerID] = @CustomerId
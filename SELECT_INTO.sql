-- Tạo ra bảng mới với các sản phẩm có giá >50;

SELECT *
INTO HighValueProducts
FROM [dbo].[Products] AS P
WHERE P.UnitPrice > 50

DROP TABLE HighValueProducts

-- Tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO OrderToAmerica
FROM [dbo].[Orders] AS O
WHERE O.ShipCountry LIKE 'USA'

DROP TABLE OrderToAmerica

-- 1. Tạo một bảng tạm thời "CustomersInLondon" từ bảng "Customers" trong cơ sở dữ liệu 
-- NorthWind để chứa thông tin của các khách hàng có địa chỉ ở London

SELECT * 
INTO CustomersInLondon
FROM [dbo].[Employees] AS E
WHERE E.City LIKE 'London'

DROP TABLE CustomersInLondon

-- 2. Tạo một bảng tạm thời "HighValueOrders" để chứa thông tin về các đơn hàng 
-- có tổng giá trị đặt hàng lớn hơn 1000 đô la.

WITH OrderTotalPrices AS (
	SELECT OD.OrderID, SUM(OD.Quantity*OD.UnitPrice) AS [TotalPrice]
	FROM [dbo].[Order Details] AS OD
	GROUP BY OD.OrderID
)

SELECT O.OrderID, OTP.TotalPrice
INTO HighValueOrders
FROM [dbo].[Orders] AS O
INNER JOIN OrderTotalPrices AS OTP
ON O.OrderID = OTP.OrderID
WHERE OTP.TotalPrice > 1000

DROP TABLE HighValueOrders

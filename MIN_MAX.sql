-- MIN/MAX
SELECT MIN([UnitPrice]) AS [MinPrice]
FROM [dbo].[Products]
--Tìm ngày đặt hàng gần nhất
SELECT MAX([OrderDate]) AS [LatestOrderDate]
FROM [dbo].[Orders]

SELECT MAX([UnitsInStock]) AS [MaxUnitsInStock]
FROM [dbo].[Products]
--Tìm nv có tuổi đời lớn nhất
SELECT MIN([BirthDate]) AS [BirthDate]
FROM [dbo].[Employees] 

-- SUM/COUNT/AVG
SELECT COUNT(*) AS [NumberOfCustomers]
FROM [dbo].[Customers]

SELECT SUM([Freight]) AS [Total_Freight_Cost]
FROM [dbo].[Orders]

SELECT AVG([Quantity]) AS [Avg_Quantity]
FROM [dbo].[Order Details]
--Tìm số lượng hàng tồn kho
SELECT COUNT(*) AS [TotalProducts],
	   SUM(UnitsInStock) - SUM(UnitsOnOrder) AS [ProductsInventory],
	   AVG(UnitPrice) AS [AverategUnitPrice]
FROM [dbo].[Products]

SELECT COUNT(*) AS [TotalOrders]
FROM [dbo].[Orders]

SELECT COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]

SELECT AVG([UnitPrice]) AS [AverageUnitPrice],
       SUM([Quantity]) AS [TotalQuantity]
FROM [dbo].[Order Details]


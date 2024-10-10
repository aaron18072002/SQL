-- HAVING
SELECT [CustomerID], COUNT([OrderID]) AS [Total_Orders]
FROM [dbo].[Orders]
GROUP BY [CustomerID]
HAVING COUNT([CustomerID]) > 20
ORDER BY COUNT([CustomerID]) DESC

SELECT [SupplierID], 
	   SUM([UnitsInStock]) AS [TotalUnitsInStock],
	   AVG([UnitPrice]) AS [AverageUnitPrice]
FROM [dbo].[Products]
GROUP BY [SupplierID]
HAVING SUM([UnitsInStock]) > 30 
AND AVG([UnitPrice]) < 50 

SELECT MONTH([ShippedDate]) AS [Month], SUM([Freight]) AS [TotalFreights]
FROM [dbo].[Orders]
WHERE [ShippedDate] BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH([ShippedDate])
HAVING SUM([Freight]) > 1000
ORDER BY MONTH([ShippedDate]) ASC

--BT1: Hãy lọc ra những thành phố có số lượng đơn hàng > 16 và sắp xếp theo tổng số lượng giảm dần
SELECT [ShipCity], COUNT([OrderID]) AS 'TotalOrders'
FROM [dbo].[Orders]
GROUP BY [ShipCity]
HAVING COUNT([OrderID]) > 16

--TT1: Lấy danh sách sản phẩm có tổng số lượng >75, 
--có tỷ lệ giảm giá trung bình >7%, và sắp xếp theo tỷ lệ giảm giá trung bình giảm dần
SELECT [ProductID], 
	   AVG([Discount]) AS [AverageDiscount],
	   SUM(Quantity) AS [TotalQuantities]
FROM [dbo].[Order Details]
GROUP BY [ProductID]
HAVING AVG([Discount]) > 0.07
AND SUM(Quantity) > 75
ORDER BY AVG([Discount]) DESC

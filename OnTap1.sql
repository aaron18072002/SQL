-- BT1: Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, 
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần.

SELECT [CustomerID], COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [CustomerID]
HAVING COUNT([OrderID]) > 20
ORDER BY COUNT([OrderID]) DESC

-- BT2: Hãy lọc ra các nhân viên (EmployeeID) có tổng số đơn hàng 
-- lớn hơn hoặc bằng 100, sắp xếp theo tổng số đơn hàng giảm dần.

SELECT [EmployeeID], COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [EmployeeID]
HAVING COUNT([OrderID]) >= 100
ORDER BY COUNT([OrderID]) DESC

-- BT3: Hãy cho biết những thể loại nào (CategoryID) 
-- có số sản phẩm khác nhau lớn hơn 11.

SELECT [CategoryID], COUNT([ProductID]) AS [TotalProducts]
FROM [dbo].[Products]
GROUP BY [CategoryID]
HAVING COUNT(CategoryID) > 11

-- BT4: Hãy cho biết những thể loại nào (CategoryID) có số tổng 
-- số lượng sản phẩm trong kho (UnitsInStock) lớn hơn 350.

SELECT [CategoryID], SUM([UnitsInStock]) AS [TotalUnitsInStock]
FROM [dbo].[Products]
GROUP BY [CategoryID]
HAVING SUM([UnitsInStock]) > 350

-- BT5: Hãy cho biết những quốc gia nào có nhiều hơn 7 khách hàng.

SELECT [ShipCountry], COUNT([CustomerID]) AS [TotalCustomers]
FROM [dbo].[Orders]
GROUP BY [ShipCountry]
HAVING COUNT([CustomerID]) > 7

-- BT6: Hãy cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao, 
-- sắp xếp tăng dần theo ngày giao hàng. 

SELECT DAY([ShippedDate]) AS [ShippedDay], COUNT([ShippedDate]) AS [TotalShippedOrders]
FROM [dbo].[Orders]
GROUP BY DAY([ShippedDate])
HAVING COUNT([ShippedDate]) > 5
ORDER BY DAY([ShippedDate]) ASC

-- BT7: Hãy cho biết những quốc gia bắt đầu bằng chữ 'A' hoặc 'G' 
-- và có số lượng đơn hàng lớn hơn 29. 

SELECT [ShipCountry], COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'A%' OR [ShipCountry] LIKE 'G%'
GROUP BY [ShipCountry]
HAVING COUNT([OrderID]) > 29
ORDER BY COUNT([OrderID]) DESC

-- BT8: Hãy cho biết những thành phố nào có số lượng đơn hàng được 
-- giao là khác 1 và 2, ngày đặt hàng từ ngày '1997-04-01' đến ngày '1997-08-31'

SELECT [ShipCity], COUNT([ShippedDate]) AS [ShippedOrders]
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1997-04-01' AND '1997-08-31'
GROUP BY [ShipCity]
HAVING COUNT([ShippedDate]) NOT IN (1,2)
--HAVING COUNT([ShippedDate]) NOT LIKE 1 
--	AND COUNT([ShippedDate]) NOT LIKE 2


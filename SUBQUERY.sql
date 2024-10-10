SELECT [ProductID], [ProductName], [UnitPrice]
FROM [dbo].[Products]
WHERE [UnitPrice] > (
	SELECT AVG([UnitPrice])
	FROM [dbo].[Products]
);

-- Loc ra nhung khach hang co so don hang > 10
-- CÁCH 1
SELECT O.CustomerID, C.ContactName, COUNT(O.OrderID) AS [TotalOrders]
FROM [dbo].[Orders] AS O
LEFT JOIN [dbo].[Customers] AS C
ON O.CustomerID = C.CustomerID
GROUP BY O.CustomerID, C.ContactName
HAVING COUNT(O.OrderID) > 10
-- CÁCH 2: Dùng subquery
SELECT *
FROM [Customers]
WHERE [CustomerID] IN (
	SELECT [CustomerID]
	FROM [dbo].[Orders]
	GROUP BY [CustomerID]
	HAVING COUNT([CustomerID]) > 10
);

-- Tinh tong tien cho tung don hang
SELECT O.[OrderID], (
		SELECT SUM(OD.Quantity * OD.UnitPrice -  (OD.Quantity * OD.UnitPrice * OD.Discount)) 
		FROM [dbo].[Order Details] AS OD
		WHERE OD.OrderID = O.OrderID
		GROUP BY OD.OrderID
	) AS [TotalPrice]
FROM [dbo].[Orders] AS O

-- Loc ra ten san pham va tong so don hang cua san pham
SELECT [ProductName], (
		SELECT COUNT(OD.OrderID)
		FROM [dbo].[Order Details] AS OD
		WHERE OD.ProductID = P.ProductID
		GROUP BY OD.ProductID
	) AS [TotalOrders]
FROM [dbo].[Products] AS P

-- Bạn hãy in ra Mã đơn hàng, và số lượng sản phẩm của đơn hàng đó.
SELECT [OrderID], (
		SELECT COUNT(OD.Quantity)
		FROM [Order Details] AS OD
		WHERE OD.OrderID = O.OrderID
		GROUP BY OD.OrderID
	) AS [TotalProducts]
FROM [dbo].[Orders] AS O


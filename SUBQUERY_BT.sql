-- Liet ke cac don hang co 
-- ngay dat hang gan nhat

SELECT *
FROM [dbo].[Orders] AS O
WHERE O.OrderDate = (
	SELECT MAX([OrderDate])
	FROM [dbo].[Orders]
)

-- Liệt kê tất cả các sản phẩm (ProductName)
-- mà không có đơn đặt hàng nào đặt mua chúng.

SELECT P.ProductName
FROM [dbo].[Products] AS P
WHERE P.ProductID NOT IN (
	SELECT DISTINCT OD.ProductID
	FROM [dbo].[Order Details] AS OD
)

-- Lấy thông tin về các đơn hàng, và tên các sản phẩm 
-- thuộc các đơn hàng chưa được giao cho khách.

SELECT [OR].*, OD.*, P.ProductName
FROM [dbo].[Orders] AS [OR]
INNER JOIN [dbo].[Order Details] AS OD
ON [OR].OrderID = OD.OrderID
INNER JOIN [dbo].[Products] AS P
ON OD.ProductID = P.ProductID
WHERE [OR].[OrderID] IN (
	SELECT O.OrderID
	FROM [dbo].[Orders] AS O
	WHERE O.ShippedDate IS NULL
)

-- Lấy thông tin về các sản phẩm có số lượng tồn kho 
-- ít hơn số lượng tồn kho trung bình của tất cả các sản phẩm

SELECT *
FROM [dbo].[Products] AS P
WHERE P.UnitsInStock < (
	SELECT AVG([UnitsInStock])
	FROM [dbo].[Products] 
)


-- Lấy thông tin về các khách hàng có tổng giá trị đơn hàng lớn nhất

SELECT O.OrderId, O.CustomerID, SUM(OD.Quantity * OD.UnitPrice) AS [TotalOrderPrice]
FROM [dbo].[Orders] AS O
INNER JOIN [dbo].[Order Details] AS OD
ON O.OrderID = OD.OrderID
INNER JOIN [dbo].[Customers] AS C
ON O.CustomerID = C.CustomerID
GROUP BY O.OrderId, O.CustomerID
HAVING SUM(OD.Quantity * OD.UnitPrice) = (
	SELECT TOP 1 SUM(OD.UnitPrice * OD.Quantity)
	FROM [dbo].[Orders] AS O
	INNER JOIN [dbo].[Order Details] AS OD
	ON O.OrderID = OD.OrderID
	GROUP BY O.OrderID, O.CustomerID
	ORDER BY SUM(OD.UnitPrice * OD.Quantity) DESC
)



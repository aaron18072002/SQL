--WITH short_e AS (
--		SELECT [EmployeeID], [LastName], [FirstName]
--		FROM [dbo].[Employees]
--)

--SELECT * FROM short_e

-- Lấy thông tin về các sản phẩm (Products) có cùng thể loại với một sản phẩm cụ thể

--WITH ProductCategory AS  (
--	SELECT [CategoryID]
--	FROM [dbo].[Products]
--	WHERE [ProductName] = 'Chang'
--)

--SELECT P.ProductName, P.CategoryID
--FROM [dbo].[Products] AS P
--INNER JOIN ProductCategory AS PC
--ON P.CategoryID = PC.CategoryID

-- Lấy thông tin về đơn hàng (Orders) cùng với tổng giá trị đơn hàng 
-- và tỷ lệ giữa tổng giá trị và phí giao hàng

--C1
--SELECT O.OrderID, O.Freight, OP.TotalPrice ,(OP.TotalPrice / O.Freight) AS [Rate]
--FROM [dbo].[Orders] AS O
--INNER JOIN (
--	SELECT OD.OrderID, SUM(OD.Quantity * OD.UnitPrice) AS [TotalPrice]
--	FROM [dbo].[Order Details] AS OD
--	GROUP BY OD.OrderID
--) AS OP
--ON O.OrderID = OP.OrderID

-- Lấy thông tin về đơn hàng (Orders) cùng với tổng giá trị đơn hàng 
-- và tỷ lệ giữa tổng giá trị và phí giao hàng

--C2
--WITH OrderTotalPrices AS (
--	SELECT [OrderID], SUM([Quantity] * [UnitPrice]) AS [TotalPrice]
--	FROM [dbo].[Order Details]
--	GROUP BY [OrderID]
--)

--SELECT O.OrderID, O.Freight, OTP.TotalPrice, 
--	   (OTP.TotalPrice / O.Freight) AS [Ratio]
--FROM [dbo].[Orders] AS O
--INNER JOIN OrderTotalPrices AS OTP
--ON O.OrderID = OTP.OrderID

-- 1. Sử dụng CTE để tính tổng doanh số bán hàng cho từng sản phẩm từ hai bảng "Order Details" 
-- và "Products" trong cơ sở dữ liệu NorthWind.

-- 2. Sử dụng CTE để tính toán tổng doanh số bán hàng theo từng khách hàng 
-- và sau đó sắp xếp danh sách khách hàng theo tổng doanh số giảm dần.

-- 3. Sử dụng CTE tính tổng doanh số bán hàng theo năm từ bảng "Orders" và "Order Details" A

WITH OrderTotalPrices AS (
	SELECT OD.OrderID, SUM(OD.Quantity * OD.UnitPrice) AS [TotalPrice]
	FROM [dbo].[Order Details] AS OD
	GROUP BY OD.OrderID
)

SELECT YEAR(O.OrderDate) AS [YEAR], SUM(OTP.TotalPrice) AS [ProfitByYear]
FROM [dbo].[Orders] AS O
INNER JOIN OrderTotalPrices AS OTP
ON O.OrderID = OTP.OrderID
GROUP BY YEAR(O.OrderDate)
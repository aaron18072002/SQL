--CREATE VIEW MonthlySales AS
--(
--	SELECT YEAR(O.OrderDate) AS 'Năm', 
--		   MONTH(O.OrderDate) AS 'Tháng',
--		   COUNT(*) AS 'Số lượng đơn hàng'
--	FROM [dbo].[Orders] AS O
--	GROUP BY YEAR(O.OrderDate), MONTH(O.OrderDate)
--)

USE NORTHWND;

DROP VIEW MonthlySales;

CREATE VIEW MonthlySales AS (
	SELECT YEAR(O.OrderDate) AS 'Năm',
		   MONTH(O.OrderDate) AS 'Tháng',
		   COUNT(*) AS 'Số lượng đơn hàng'
	FROM [dbo].[Orders] AS O
	GROUP BY YEAR(O.OrderDate), MONTH(O.OrderDate)
);

SELECT * FROM MonthlySales;

--SELECT * FROM MonthlySales

-- Thực hành về view
-- 1. Tạo một View có tên "HighValueProducts" để hiển thị danh sách các sản phẩm có giá trị cao hơn $50.

--CREATE VIEW HighValueProducts AS
--(
--	SELECT *
--	FROM [dbo].[Products] AS P
--	WHERE P.UnitPrice > 50
--)

--SELECT * FROM HighValueProducts

-- 2. Tạo một View có tên "CustomerOrders" để hiển thị thông tin về khách hàng và số lượng hàng của họ.

--CREATE VIEW CustomerOrders AS 
--(
--	SELECT C.*, Temp.TotalOrders
--	FROM [dbo].[Customers] AS C
--	INNER JOIN (	
--		SELECT O.CustomerID, COUNT(O.CustomerID) AS [TotalOrders]
--		FROM [dbo].[Orders] AS O
--		GROUP BY O.CustomerID
--	) AS Temp
--	ON C.CustomerID = Temp.CustomerID
--)

--SELECT * FROM CustomerOrders

-- 3. Tạo một View có tên "EmployeeSalesByYear" để hiển thị tổng doanh số bán hàng của từng nhân viên theo năm.

CREATE VIEW EmployeeSalesByYear AS
(
	SELECT YEAR(O.OrderDate) AS 'Năm', 
		   O.EmployeeID,
		   SUM(Temp.TotalPrice) AS [TotalSalesByYear]
	FROM [dbo].[Orders] AS O
	INNER JOIN (
		SELECT OD.OrderID, SUM(OD.Quantity*OD.UnitPrice) AS [TotalPrice]
		FROM [dbo].[Order Details] AS OD
		GROUP BY OD.OrderID
	) AS Temp
	ON O.OrderID = Temp.OrderID
	GROUP BY YEAR(O.OrderDate), O.EmployeeID
)

-- 4. Tạo một View có tên "CategoryProductCounts" để hiển thị số lượng sản phẩm trong mỗi danh mục sản phẩm.
-- 5. Tạo một View có tên "CustomerOrderSummary" để hiển thị tổng giá trị đặt hàng của mỗi khách hàng
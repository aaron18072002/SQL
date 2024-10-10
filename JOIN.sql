-- VD1: Từ bảng Products và Categories, hãy in ra các thông tin sau đây: 
-- Mã thể loại Tên thể loại Mã sản phẩm Tên sản phẩm

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM [dbo].[Products] AS P, [dbo].[Categories] AS C
WHERE p.CategoryID = c.CategoryID

-- VD2: Từ bảng Employees và Orders, hãy in ra các thông tin sau đây: 
-- Mã nhân viên - Tên nhân viên - Số lượng đơn hàng mà nhân viên đã bán được

SELECT O.EmployeeID, E.FirstName, COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders] AS O, [dbo].[Employees] AS E
WHERE O.EmployeeID = E.EmployeeID
GROUP BY O.EmployeeID, E.FirstName

-- VD3: Từ bảng Customers và Orders, hãy in ra các thông tin sau đây: 
-- Mã số khách hàng Tên công ty Tên liên hệ Số lượng đơn hàng đã mua 
-- Với điều kiện: quốc gia của khách hàng là UK

SELECT O.CustomerID, p.CompanyName, p.ContactName , COUNT(O.OrderID) AS [TotalOrders]
FROM [dbo].[Orders] AS O, [dbo].[Customers] AS P
WHERE o.CustomerID = p.CustomerID AND p.Country = 'UK'
GROUP BY O.CustomerID, p.CompanyName, p.ContactName

-- VD4: Từ bảng Orders và Shippers, hãy in ra các thông tin sau đây: 
-- Mã nhà vận chuyến Tên công ty vận chuyến Tổng số tiên được vận chuyến (Sum Frieght) 
-- Và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần.

SELECT O.ShipVia, S.CompanyName, SUM(O.Freight) AS [TotalFreights]
FROM [dbo].[Orders] AS O, [dbo].[Shippers] AS S
WHERE O.ShipVia = S.ShipperID
GROUP BY O.ShipVia, S.CompanyName
ORDER BY SUM(O.Freight) DESC

-- VD5: Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây: 
-- Mã nhà cung cấp Tên công ty Tổng số các sản phẩm khác nhau đã cung cấp 
-- Và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất.

SELECT TOP 1 P.SupplierID, S.CompanyName, COUNT(P.ProductID) AS [TotalSuppliedProducts]
FROM [dbo].[Products] AS P, [dbo].[Suppliers] AS S
WHERE P.SupplierID = S.SupplierID
GROUP BY P.SupplierID, S.CompanyName
ORDER BY COUNT(P.ProductID) DESC

-- VD6: Từ bảng Orders và Orders Details, hãy in ra các thông tin sau đây: 
-- Mã đơn hàng - Tổng số tiền sản phẩm của đơn hàng đó

SELECT OD.OrderID, SUM(OD.UnitPrice * OD.Quantity) AS [TotalPrice]
FROM [dbo].[Orders] AS O, [dbo].[Order Details] AS OD
GROUP BY OD.OrderID

-- VD7:

SELECT OD.OrderID, E.FirstName, E.LastName, SUM(OD.Quantity * OD.UnitPrice) AS [TotalPrice]
FROM [dbo].[Orders] AS O, [dbo].[Employees] AS E, [dbo].[Order Details] AS OD
WHERE O.EmployeeID = E.EmployeeID AND OD.OrderID = O.OrderID
GROUP BY OD.OrderID, E.FirstName, E.LastName

-- BT1: từ bảng 3 trong hình hãy in ra các thông tin sau đây:
-- mã đơn hàng, tên khách hàng, tên công ty vận chuyển 
-- và chỉ ra các đơn hàng được chuyển đến 'Uk' trong năm 1997

SELECT o.OrderID, c.ContactName, s.ShipperID
FROM [dbo].[Orders] AS o, [dbo].[Customers] AS c, [dbo].[Shippers] AS s
WHERE o.CustomerID = c.CustomerID 
	AND s.ShipperID = o.ShipVia 
	AND o.ShipCountry = 'UK'
	AND YEAR(o.ShippedDate) = '1997'
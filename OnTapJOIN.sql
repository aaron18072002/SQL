-- BÀI TẬP 1 Từ bảng Products và Categories, hãy tìm các sản phẩm thuộc danh mục 'Seafood' 
-- in ra các thông tin sau đây: Mã thể loại Tên thể loại Mã sản phẩm Tên sản phẩm

SELECT P.ProductID, P.ProductName, P.CategoryID, C.CategoryName
FROM [dbo].[Products] AS P, [dbo].[Categories] AS C
WHERE P.CategoryID = C.CategoryID 
	AND C.CategoryName = 'Seafood'

-- BÀI TẬP 2 Từ bảng Products và Suppliers, hãy tìm các sản phẩm thuộc được cung cấp từ nước 'Germany'
-- Mã nhà cung cấp Quốc gia Mã sản phẩm Tên sản phẩm

SELECT P.ProductID, P.ProductName, P.SupplierID, S.Country
FROM [dbo].[Products] AS P, [dbo].[Suppliers] AS S
WHERE P.SupplierID = S.SupplierID 
	AND S.Country = 'Germany'

-- BÀI TẬP 3
-- Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- Và chỉ in ra các đơn hàng của các khách hàng đến từ thành phố London

SELECT O.OrderID, C.ContactName, S.CompanyName
FROM [dbo].[Orders] AS O, [dbo].[Customers] AS C, [dbo].[Shippers] AS S
WHERE O.CustomerID = C.CustomerID 
	AND O.ShipVia = S.ShipperID 
	AND C.City = 'London'

-- BÀI TẬP 4
-- Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- Ngày yêu cầu chuyển hàng
-- Ngày giao hàng
-- Và chỉ in ra các đơn hàng bị giao muộn hơn quy định.
-- Require Date< ShippedDate

SELECT O.OrderID, C.ContactName, S.CompanyName, O.RequiredDate, O.ShippedDate
FROM [dbo].[Orders] AS O, [dbo].[Customers] AS C, [dbo].[Shippers] AS S
WHERE O.CustomerID = C.CustomerID 
	AND O.ShipVia = S.ShipperID
	AND O.RequiredDate < O.ShippedDate
	
-- EXERCISE
-- Give these shipcountries for which customers don't come from the United States.
-- Select only this countries which is over than 100 orders.
-- Display Shipcountry and Number of orders

SELECT O.ShipCountry, COUNT(O.OrderID) AS [NumberOfOrders]
FROM [dbo].[Orders] AS O, [dbo].[Customers] AS C
WHERE O.CustomerID = C.CustomerID
	AND C.Country NOT LIKE 'United States'
GROUP BY O.ShipCountry
HAVING COUNT(O.OrderID) > 100

-- BÀI TẬP 1
-- Bài tập 1 (INNER JOIN): Liệt kê tên sản phẩm và tên nhà cung cấp của các sản phẩm đã được đặt hàng trong 
-- bảng "Order Details". Sử dụng INNER JOIN để kết hợp bảng "Order Details" 
-- với các bảng liên quan để lấy thông tin sản phẩm và nhà cung cấp.

SELECT DISTINCT P.ProductID, P.ProductName, S.SupplierID, S.CompanyName
FROM [dbo].[Order Details] AS O 
INNER JOIN [dbo].[Products] AS P
ON O.ProductID = P.ProductID
INNER  JOIN [dbo].[Suppliers] AS S
ON P.SupplierID = S.SupplierID

-- BÀI TẬP 2
-- Bài tập 2 (LEFT JOIN): Liệt kê tên khách hàng và tên nhân viên phụ trách của các 
-- đơn hàng trong bảng "Orders". Bao gồm cả các đơn hàng không có nhân viên phụ trách. 
-- Sử dụng LEFT JOIN để kết hợp bảng "Orders" với bảng "Employees" để lấy thông tin 
-- về khách hàng và nhân viên phụ trách.

SELECT O.OrderID, 
	CONCAT(E.FirstName, ' ' ,E.LastName) AS [EmployeeName],
	C.ContactName
FROM [dbo].[Orders] AS O
LEFT JOIN [dbo].[Employees] AS E
ON O.EmployeeID = E.EmployeeID
LEFT JOIN [dbo].[Customers] AS C
ON O.CustomerID = C.CustomerID

-- BÀI TẬP 3
-- Bài tập 3 (RIGHT JOIN):
SELECT O.OrderID, 
	   --CONCAT(E.FirstName, ' ' ,E.LastName) AS [EmployeeName],
	   C.ContactName
FROM [dbo].[Orders] AS O
--RIGHT JOIN [dbo].[Employees] AS E
--ON O.EmployeeID = E.EmployeeID
RIGHT JOIN [dbo].[Customers] AS C
ON O.CustomerID = C.CustomerID

-- BÀI TẬP 4
-- Bài tập 4 (FULL JOIN): Liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng 
-- "Products". Bao gồm cả các danh mục và nhà cung cấp không có sản phẩm. 
-- Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN và RIGHT JOIN để lấy thông tin về danh mục và nhà cung cấp.

SELECT DISTINCT P.ProductID, P.ProductName, S.CompanyName, C.CategoryName
FROM [dbo].[Products] AS P 
FULL JOIN [dbo].[Categories] AS C
ON P.CategoryID = P.ProductID
FULL JOIN [dbo].[Suppliers] AS S
ON P.SupplierID = S.SupplierID

-- BÀI TẬP 5
-- Bài tập 5 (INNER JOIN): Liệt kê tên khách hàng và tên sản phẩm đã được đặt hàng 
-- trong bảng "Orders" và "Order Details". Sử dụng INNER JOIN để kết hợp bảng 
-- "Orders" và "Order Details" để lấy thông tin khách hàng và sản phẩm đã được đặt hàng.

SELECT DISTINCT O.OrderID, C.ContactName, P.ProductName
FROM [dbo].[Orders] AS O
INNER JOIN [dbo].[Order Details] AS OD
ON O.OrderID  = OD.OrderID
INNER JOIN [dbo].[Products] AS P
ON OD.ProductID = P.ProductID
INNER JOIN [dbo].[Customers] AS C
ON O.CustomerID = C.CustomerID

-- BÀI TẬP 6
-- Bài tập 6 (FULL JOIN): Liệt kê tên nhân viên và tên khách hàng của các đơn hàng 
-- trong bảng "Orders". Bao gồm cả các đơn hàng không có nhân viên hoặc khách hàng tương ứng. 
-- Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN và RIGHT JOIN để kết hợp bảng "Orders" với bảng "Employees" 
-- và "Customers" để lấy thông tin về nhân viên và khách hàng.

SELECT O.OrderID, 
	   CONCAT(E.FirstName, ' ' ,E.LastName) AS [EmployeeName],
	   C.ContactName
FROM [dbo].[Orders] AS O
FULL JOIN [dbo].[Employees] AS E
ON O.EmployeeID = E.EmployeeID
FULL JOIN [dbo].[Customers] AS C
ON O.CustomerID = C.CustomerID
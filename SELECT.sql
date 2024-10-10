-- SELECT
SELECT ProductName 
FROM [dbo].[Products];

SELECT [ProductName], [UnitPrice], [QuantityPerUnit]
FROM [dbo].[Products];
 
--Viết câu lệnh SQL lấy ra tên công ty của khách hàng 
--và quốc gia của các khách hàng đó
SELECT [CompanyName], [Country]
FROM [dbo].[Customers];

SELECT [CompanyName], [Phone]
FROM [dbo].[Suppliers];

--Viết ra câu lệnh SQL lấy ra ngày sinh, 
--thành phố hiện tại và số điện thoại nhà của các nhân viên.
SELECT [BirthDate], [City], [HomePhone]
FROM [dbo].[Employees];

SELECT * FROM [dbo].[Products];

SELECT * FROM [dbo].[Suppliers];

-- SELECT DISTINCT

SELECT Country FROM [dbo].[Suppliers]

SELECT DISTINCT [Country] 
FROM [dbo].[Suppliers];

SELECT DISTINCT [Country]
FROM [dbo].[Customers]

SELECT DISTINCT [PostalCode]
FROM [dbo].[Suppliers]

SELECT DISTINCT [LastName], [TitleOfCourtesy]
FROM [dbo].[Employees]

SELECT [LastName], [TitleOfCourtesy]
FROM [dbo].[Employees]

SELECT DISTINCT [ShipVia]
FROM [dbo].[Orders]

SELECT DISTINCT [CompanyName], [Country]
FROM [dbo].[Customers]

-- SELECT TOP

SELECT TOP 10 * FROM [dbo].[Customers]

SELECT TOP 30 PERCENT * FROM [dbo].[Employees] 

SELECT DISTINCT TOP 5 [CustomerID]
FROM [dbo].[Orders]

SELECT DISTINCT TOP 3 [CategoryID]
FROM [dbo].[Products]

--Truy vấn 20% records không trùng lặp ShipName và ShipAddress trong bảng Orders.
SELECT DISTINCT TOP 20 PERCENT [ShipName], [ShipAddress]
FROM [dbo].[Orders]

-- ALIAS
SELECT [CompanyName] AS N'Công ty', 
	   [PostalCode] AS N'Mã bưu điện', 
	   [City] AS N'Thành phố',
					*
FROM [dbo].[Customers]

SELECT [LastName] AS N'Họ',
	   [FirstName] AS N'Tên',
				*
FROM [dbo].[Employees]

SELECT TOP 15 O.*
FROM [dbo].[Orders] AS O 

SELECT TOP 5 
		P.ProductName AS N'Tên sản phẩm',
		P.SupplierID AS N'Mã nhà cung cấp',
		P.CategoryID AS N'Mã thể loại',
					*
FROM [dbo].[Products] AS P

-- CompanyName => Tên công ty
-- Address => Địa chỉ
-- City => Thành phố
-- Country => Quốc gia
-- Và đăt tên thay thế cho bảng Customers là "KH", sử dung tên thay thế khi truy vấn các cột bên trên.
-- Và chỉ lấy ra 10 khách hàng đầu tiên trong bảng
SELECT TOP 5 KH.CompanyName AS N'Tên công ty',
			 KH.[Address] AS N'Địa chỉ',
			 KH.City AS N'Thành phố',
			 KH.Country AS N'Quốc gia', *
FROM [dbo].[Customers] AS KH
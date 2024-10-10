--ORDER BY
SELECT * 
FROM [dbo].[Suppliers]
ORDER BY [CompanyName] ASC

SELECT *
FROM [dbo].[Products]
ORDER BY [UnitPrice] DESC

SELECT * 
FROM [dbo].[Employees]
ORDER BY [LastName], [FirstName]

SELECT TOP 1 *
FROM [dbo].[Order Details]
ORDER BY [Quantity] DESC

SELECT [OrderID], [OrderDate]
FROM [dbo].[Orders]
ORDER BY [OrderDate] DESC

SELECT [ProductName],
	   [UnitPrice],
	   [UnitsInStock]
FROM [dbo].[Products]
ORDER BY [UnitsInStock] DESC

--Viết câu lệnh SQL lấy ra cột "Country" 
--và đặt tên thay thế là "Quốc gia" từ bảng "Suppliers". 
--Và tên Quốc gia được sắp xếp theo thứ tự tăng dần từ A - Z
SELECT [Country] AS ["Quốc Gia"]
FROM [dbo].[Suppliers]
ORDER BY ["Quốc Gia"] ASC

--Viết câu lệnh SQL lấy ra số tiền vận chuyển (Freight) 
--khác nhau và chỉ lấy ra 2 dòng đầu tiên theo thứ tự 
--giảm dần của số tiền vận chuyển (Freight) từ bảng "Orders"
SELECT DISTINCT TOP 2 [Freight]
FROM [dbo].[Orders]
ORDER BY [Freight] DESC

--Viết câu lệnh SQL lấy ra 3 nhân có viên có tên (FirstName), 
--ngày sinh (BirthDate) và ngày tuyển dụng (HireDate) 
--khác nhau dựa theo tên (FirstName) từ A - Z từ bảng "Employees"
SELECT DISTINCT TOP 3 
	   [FirstName],
	   [BirthDate],
	   [HireDate]
FROM [dbo].[Employees]
ORDER BY [FirstName] ASC

-- CÁC PHÉP TOÁN VỀ SQL +,-,*,%,/
SELECT ([UnitsInStock] - [UnitsOnOrder]) AS [StockRemainding],
	   [UnitsInStock],
	   [UnitsOnOrder],
	   [ProductName]
FROM [dbo].[Products]

SELECT *, ([UnitPrice] * [Quantity]) AS [OrderDetailValue]
FROM [dbo].[Order Details]

SELECT (AVG([Freight])/MAX([Freight])) AS [FreightRatio]
FROM [dbo].[Orders]

--Hãy liệt kê danh sách các sản phẩm, và giá (UnitPrice) của từng sản phẩm sẽ được giảm đi 10%.
--Cách 1: dùng phép nhân + phép chia
--Cách 2: chỉ được dùng phép nhân
SELECT ([UnitPrice] * 90 / 100) AS [UnitPriceAfterDiscount], 
		[UnitPrice]
FROM [dbo].[Products]

SELECT ([UnitPrice] * 0.9) AS [UnitPriceAfterDiscount], 
		[UnitPrice]
FROM [dbo].[Products]

--Tính giá trị trung bình của giá đơn hàng trong bảng product sau đó chia cho 10 lấy phần dư
SELECT (AVG(UnitPrice) % 10) AS [Result]
FROM [dbo].[Products]

-- MỆNH ĐỀ WHERE
-- CÁCH PHÉP TOÁN SO SÁNH >,<,<=,>=,<>(khác),=
SELECT [City], *
FROM [dbo].[Employees]
WHERE [City] LIKE 'London'
ORDER BY [LastName] ASC

--Liệt kê các Orders bị giao muộn
SELECT [OrderID], [ShippedDate], [RequiredDate]
FROM [dbo].[Orders]
WHERE [ShippedDate] > [RequiredDate]

SELECT COUNT(*) AS [TotalLateOrder]
FROM [dbo].[Orders]
WHERE [ShippedDate] > [RequiredDate]

SELECT *
FROM [dbo].[Order Details]
WHERE [Discount] > 0.1

SELECT *
FROM [dbo].[Order Details]
WHERE [Discount] > 0.1 AND [Discount] < 0.2

--BÀI TẬP 1
--Hãy liệt kê tất cả các đơn hàng được gửi đến quốc gia là “France"
SELECT [ShipCity], *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'France'

--BÀI TẬP 2
--Hãy liệt các sản phẩm có số lượng hàng trong (UnitsInStock) lớn hơn 20.
SELECT [UnitsInStock], *
FROM [dbo].[Products]
WHERE [UnitsInStock] > 20

--bài tập thử thách: hãy liệt kê các sản phẩm có giá bán lớn hơn hoặc bằng 
--2 lần sản phẩm có giá bán nhỏ nhất. sau đó sắp xếp chúng theo thứ tự từ bé đến lớn.
SELECT P.[UnitPrice], P.[ProductName]
FROM [dbo].[Products] AS P
WHERE ([UnitPrice] / (SELECT MIN([UnitPrice]) FROM [dbo].[Products])) > 2
ORDER BY P.[UnitPrice] ASC;

-- TOÁN TỬ LOGIC: AND, OR, NOT
SELECT [UnitsInStock], *
FROM [dbo].[Products]
WHERE [UnitsInStock] < 50 OR [UnitsInStock] > 100

SELECT [ShipCountry],
	   [RequiredDate],
	   [ShippedDate], *
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'Brazil'
AND [RequiredDate] < [ShippedDate]

SELECT [UnitPrice],
	   [CategoryID],
	   [ProductName]
FROM [dbo].[Products]
WHERE [UnitPrice] < 100 
AND [CategoryID] NOT LIKE 1

SELECT [Freight],*
FROM [dbo].[Orders]
WHERE [Freight] >= 50
AND [Freight] <= 100

SELECT [UnitsInStock],
	   [UnitsOnOrder], *
FROM [dbo].[Products]
WHERE [UnitsInStock] > 20
AND [UnitsOnOrder] < 20

--Viết câu lệnh SQL tìm ra nhân viên không phải ở USA và chỉ lấy 5 khác hàng đầu tiên, 
--sắp xếp theo thứ tự [Lastname] A-Z và tạo ra cột full name
SELECT TOP 5 ([FirstName] + ' ' + [LastName]) AS [FullName], *
FROM [dbo].[Employees]
WHERE [Country] NOT LIKE 'USA'
ORDER BY [LastName] ASC

-- TOÁN TỬ ĐẶC BIỆT: BETWEEN, LIKE, WILDCARD, IN / NOT IN, IS NULL
SELECT [UnitPrice], *
FROM [dbo].[Products]
WHERE [UnitPrice] BETWEEN 10 AND 200

SELECT [OrderDate], *
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31'

SELECT SUM([Freight]) AS [TotalJulyFreight]
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1997-07-01' AND '1997-07-31'

--BT1: Lấy danh sách các đơn đặt hàng có ngày đặt hàng trong khoảng từ ngay 1/1/1997 đến ngày 31/12/1997
--và được vận chuyển bằng đường tày thủy  (Shipvia =3)
SELECT [ShipVia],
	   [OrderDate], *
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1997-01-01' AND '1997-12-31'
AND [ShipVia] LIKE 3

--Thử thách 1: Viết câu lệnh SQL liệt kê họ và tên nhân viên,
--chỉ sống ở London,
--có ngày tháng năm sinh từ đến 1/1/1952 đến 31/12/1963 
--hoặc ngày tuyển từ 1/2/1992 đến 31/12/1993
--chỉ lấy 3 nhân viên đầu tiên sắp xếp theo [LastName] A-Z.
SELECT TOP 3 [City],
		     [BirthDate],
			 [HireDate], *
FROM [dbo].[Employees]
WHERE [City] LIKE 'London'
AND [BirthDate] BETWEEN '1952-01-01' AND '1963-12-31'
OR [HireDate] BETWEEN '1992-02-01' AND '1993-12-31'
ORDER BY [LastName] ASC

-- LIKE
SELECT [Country], *
FROM [dbo].[Customers]
WHERE [Country] LIKE 'A%'

SELECT [ShipCity], *
FROM [dbo].[Orders]
WHERE [ShipCity] NOT LIKE '%a%'

--BT1: Hãy lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của công ty
SELECT [CompanyName], *
FROM [dbo].[Suppliers]
WHERE [CompanyName] NOT LIKE '%b%'

--Challenge1: Write an SQL statement to list employees fullname with the letter "e" in the last name 
--and born from 1952-01-01 to 1962-12-31, 
--arrange in A-Z order by first Name
--taking only the first 5 lines
SELECT TOP 5 ([FirstName] + ' ' + [LastName]) AS [FullName]
FROM [dbo].[Employees]
WHERE [LastName] LIKE '%e%'
AND [BirthDate] BETWEEN '1952-01-01' AND '1962-12-31'
ORDER BY [FirstName] ASC

-- WILDCARD % _ [] ^ -
SELECT [ContactName]
FROM [dbo].[Customers]
WHERE [ContactName] LIKE 'A%'

SELECT [ShipCity], *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'L[^u,o]%'

SELECT [ShipCity], *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'L[a-e]%'

--Bài tập 1: Hãy lấy ra tất cả các nhà cung cấp hàng có tên công ty 
--bắt đầu bằng chữ A và kh chứa b.
SELECT [CompanyName], *
FROM [dbo].[Suppliers]
WHERE [CompanyName] LIKE 'A%[^b]%'
AND [CompanyName] NOT LIKE '%b%'

SELECT [ShipCountry], *
FROM [dbo].[Orders]
WHERE [ShipCountry] NOT IN ('Germany','UK','Brazil')

SELECT [CategoryID], * 
FROM [dbo].[Products]
WHERE [CategoryID] NOT IN (2,3,4)

SELECT [TitleOfCourtesy], *
FROM [dbo].[Employees]
WHERE [TitleOfCourtesy] IN ('Ms.','Mrs.')

--Làm bài tập.
--Bài tập 1: liệt kê các khách hàng đến từ các thành phố London, Berlin, Warszawa.
SELECT [City], *
FROM [dbo].[Customers]
WHERE [City] NOT IN ('Berlin','London','Warszawa')

-- NULL
SELECT [ShippedDate], *
FROM [dbo].[Orders]
WHERE [ShippedDate] IS NULL

SELECT [Region], *
FROM [dbo].[Customers]
WHERE [Region] IS NOT NULL

SELECT [CompanyName], *
FROM [dbo].[Customers]
WHERE [CompanyName] IS NULL

--BÀI TẬP 1: Hãy lấy ra tất cả các đơn hàng chưa được giao hàng 
--và có khu vực giao hàng (ShipRegion) không bị NULL.
SELECT [ShippedDate],
	   [ShipRegion],
			*
FROM [dbo].[Orders]
WHERE [ShippedDate] IS NULL
AND [ShipRegion] IS NOT NULL

-- GROUP BY

--Cho biết mỗi kh đã đặt bao nhiêu đơn hàng
SELECT [CustomerID], COUNT(*) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [CustomerID]

--Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm.
SELECT [SupplierID], AVG([UnitPrice]) AS [AvgUnitPrice]
FROM [dbo].[Products]
GROUP BY [SupplierID]

--Hãy cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho
SELECT [CategoryID], SUM([UnitsInStock]) AS [TotalUnitsInStock]
FROM [dbo].[Products]
GROUP BY [CategoryID]

--Hãy cho biết giá vận chuyển thấp nhất và lớn nhất của các đơn hàng theo từng thành phố và quốc gia khác nhau.
SELECT [ShipCountry], [ShipCity],
	   MIN([Freight]) AS [MinFreight],
	   MAX([Freight]) AS [MaxFreight]
FROM [dbo].[Orders]
GROUP BY [ShipCity], [ShipCountry]

--BT1: Hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau
SELECT [Country], COUNT(*) AS [TotalEmployees]
FROM [dbo].[Employees]
GROUP BY [Country]

--Challenges1: Write an SQL statement 
--Thống kê số khách hàng ở từng quốc gia, từng thành phố
--Tìm các khách hàng có CompanyName có chữ a trong tên
--Sắp xếp theo chiều A-Z Country
SELECT [Country], [City], COUNT(*) AS [TotalCustomers]
FROM [dbo].[Customers]
WHERE [CompanyName] LIKE '%a%'
GROUP BY [Country], [City]
ORDER BY [Country] ASC


@PhongTran-kl5kh
4 tháng trước
Em cảm ơn thầy về bài giảng ạ.
--BT1: Hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau
Select e.[Country], COUNT (e.EmployeeID)
From [dbo].Employees as e
Group by e.[Country];

--Challenges1: Write an SQL statement 
--Thống kê số khách hàng ở từng quốc gia, từng thành phố
--Tìm các khách hàng có CompanyName có chữ a trong tên
--Sắp xếp theo chiều A-Z Country
Select c.[Country], c.[City], Count (c.[CustomerID]) as [Thenumbercustomer]
From [dbo].[Customers] as c
Where c.[CompanyName] LIKE '%a%'
Group by c.[Country],c.[City]
Order by c.[Country] ASC;

--Challenges2: Write an SQL Statment
-- Tính tổng số tiền vận chuyển ở từng thành phố, quốc qua
-- Chỉ lấy những ShipName có có chữ 'b' 
--Sắp xếp theo chiều từ A-Z của ShipNAme
SELECT *
INTO Customers_1
FROM [dbo].[Customers]

DROP TABLE Customers_1
DROP TABLE 

-- Cập nhật thông tin của một khách hàng trong bảng Customers. 
-- Dưới đây là cách cập nhật địa chỉ của khách hàng có 
-- CustomerID là "ALFKI"
UPDATE [dbo].[Customers_1]
SET [Address] = 'New Address'
WHERE [CustomerID] = 'ALFKI'

SELECT *
INTO Products_1
FROM [dbo].[Products]

-- Tăng giá toàn bộ sản phẩm lên 10%

UPDATE [dbo].[Products_1]
SET [UnitPrice] = [UnitPrice]*1.1


--Cập nhật thông tin của sản phẩm có ProductID 
--là 7 trong bảng Products để thay đổi tên sản 
--phẩm thành "Máy tính xách tay mới" 
--và cập nhật giá bán thành 999.99 đô la. 

UPDATE [dbo].[Products_1]
SET [ProductName] = 'May tinh xach tay moi',
    [UnitPrice] = 999.99
WHERE [ProductID] = 7

-- bt1: cập nhật thông tin của tất xả các khách hàng trong bảng Customers có 
-- thành phố (City) là "Paris" để thay đổi quốc gia (Country) thành "Pháp"

UPDATE [dbo].[Customers_1]
SET [Country] = 'Phap'
WHERE [City] LIKE 'Paris'

SELECT * 
FROM [dbo].[Customers_1] AS C
WHERE C.City = 'Paris'

-- bt2: cập nhật thông tin của một sản phẩm cụ thể trong bảng Products dựa trên ProductName
DECLARE @ProductName NVARCHAR(40)
SET @ProductName = ''

UPDATE [dbo].[Products_1]
SET ProductName = @ProductName